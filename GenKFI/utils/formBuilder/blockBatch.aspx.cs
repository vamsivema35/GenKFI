using GenKFI.Properties;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GenKFI.utils.formBuilder
{
    public partial class blockBatch : Page
    {
		string strCurrPage;

		protected void Page_Load( object sender, EventArgs e )
		{
			#region common load code

			//@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
			//@#@# common code on all pages
			//@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#

			//@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
			// this is the only thing that changes across pages
			strCurrPage = "Form Builder (Block/Batch)";
			//@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
			Session[ "kstrcurrPage" ] = strCurrPage;
			( (Literal)Master.FindControl( "titleLIT" ) ).Text = UtilClass.NormalizeUN( Context.User.Identity.Name ) + " : GenKFI Tax Programs - " + Session[ "tpSelHID" ].ToString().Replace( "ALL;", "" ).Replace( ";", ", " ) + " : " + Roles.GetRolesForUser( MyUserRole.UserName() )[ 0 ];
			( (Literal)Master.FindControl( "headerLIT" ) ).Text = Session[ "tpSelHID" ].ToString().Replace( "ALL;", "" ).Replace( ";", ", " ) + " : " + strCurrPage;
			Session[ "homeLink" ] = "Default.aspx";

			UtilClass ec = new UtilClass();
			ec.ErrorRedir( this );
			ec.AdminOnly( strCurrPage );
			Response.BufferOutput = true;

			//@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
			//@#@# common code on all pages
			//@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#

			// on some pages, we want to restrict to a single tax program
			// hide the drop down selection
			( (Panel)Master.FindControl( "tpSELPNL" ) ).Visible = false;

			#endregion

			if( !IsPostBack )
			{
				// this one will load all the possible values
				// if there was a query string, it will get set in loadDatas
				// put some years in the DDL
				taxYearDDL.Items.Clear();
				taxYearDDL.Items.Add( new ListItem( "Select A Year", "-1" ) );
				int thisYear = DateTime.Now.Year;
				for( int i = thisYear + 3; i > thisYear - 15; i-- )
					taxYearDDL.Items.Add( new ListItem( i.ToString(), i.ToString() ) );

				// clear the text box
				fileTypeTXT.Text = "";

				if( ViewState[ "rhID" ] == null )
					ViewState[ "rhID" ] = Request.QueryString[ "rhID" ];

				// if we have a query string, select that data in the boxes
				GoodConn gc = new GoodConn();
				try
				{
#if DEBUG
					gc.Connect( Resources.connString );
#else
					gc.Connect( Resources.prodConnString );
#endif
                    string statement = "SELECT fstrTaxProgram, fstrFileType, flngTaxYear ";
                    statement += "FROM rfrReturnHeaders ";
                    statement += "WHERE idReturnHeaders = " + Request.QueryString[ "rhID" ].ToString();
					gc.DoSelect( statement );
					DataTable dt = new DataTable();
					int numRows = gc.ReadSelect( out dt );
					if( numRows > 0 )
					{
						taxProgLIT.Text = dt.Rows[ 0 ][ "fstrTaxProgram" ].ToString();
						fileTypeTXT.Text = dt.Rows[ 0 ][ "fstrFileType" ].ToString();
						taxYearDDL.SelectedValue = dt.Rows[ 0 ][ "flngTaxYear" ].ToString();
					}
					gc.Disconnect();
				}
				catch( Exception ex )
				{
					UtilClass.RecordError( gc, ex );
					gc.Disconnect();
				}
			}

			// this has to be done each time, to relink the event handlers
			if( Request.QueryString.Count != 0 )
				LoadDatas();
		}


		private void LoadDatas()
		{
			// next select all the tax forms and blocks
			GoodConn gc = new GoodConn();
			string statement = "";
			DataTable dt;
			int numRows;

			try
			{
#if DEBUG
				gc.Connect( Resources.connString );
#else
				gc.Connect( Resources.prodConnString );
#endif

				// this will include the top header in the select for each block
				// the top header includes the template image information, which we need to pass to the formEdit page for editing
				statement = "SELECT ";
				statement += "	ch2.idControlHeaders AS topHeaderID, ";
				statement += "	ch1.idControlHeaders, ";
				statement += "	ch1.fstrTaxForm, ";
				statement += "	ch1.fstrTable, ";
				statement += "	ch1.flngBlock, ";
				statement += "	ch1.fstrFormType, ";
                statement += "	str(ch1.fblnLand,1) as fstrland ";
                statement += "FROM ";
				statement += "	rfrControlHeaders ch1, ";
				statement += "	rfrControlHeaders ch2 ";
				statement += "WHERE ";
				statement += "	ch1.flngReturnHeadersIDFK = " + ViewState[ "rhID" ].ToString() + " AND ";
				statement += "	ch2.flngBlock = 0 AND ";
				statement += "	ch1.fstrTaxForm = ch2.fstrTaxForm AND ";
				// this is to handle the fact that the repeater table has to be different, and include those rows as well
				statement += "	ch1.fstrTable = ( CASE WHEN ch1.fstrFormType = ch2.fstrFormType THEN ch2.fstrTable ELSE ch1.fstrTable END ) AND ";
				statement += "	ch2.flngReturnHeadersIDFK = ch1.flngReturnHeadersIDFK ";
				statement += "ORDER BY ";
				statement += "	ch1.fstrTaxForm, ";
				statement += "	ch1.flngBlock, ";
				statement += "	ch1.fstrTable, ";
				statement += "	ch1.fstrFormType;";
				gc.DoSelect( statement );
				dt = new DataTable();
				numRows = gc.ReadSelect( out dt );
				if( numRows > 0 )
				{
					/*
						tried several things to get the add and remove forms and blocks to work
						eventually ended up with Generic Handlers (ASHX) to handle it, and then
						just post back to this page, so the table can get built in the right order
						with the updated changes. 
					*/

					// remove old rows, except for the header
					for( int i = taxFormsTBL.Rows.Count - 1; i >= 0; i-- )
					{
						if( taxFormsTBL.Rows[ i ].ID == "headerROW" )
							continue;
						taxFormsTBL.Rows.RemoveAt( i );
					}
					foreach( DataRow row in dt.Rows )
					{
						// build the data rows and add to taxFormsTBL
						// each row needs the form name, table name, block number, and link to the formBuild.aspx with appropriate ident data
						TableRow tr = new TableRow();
						TableCell td = new TableCell();
						
						// delimiter line above blocks
						if( row[ "flngBlock" ].ToString() == "0" )
						{
							td.ColumnSpan = 6;
							td.Text = "<hr />";
							tr.Cells.Add( td );
							taxFormsTBL.Rows.Add( tr );
							tr = new TableRow();
							td = new TableCell();
						}

						// before putting in the rows, check on this table and it's needed columns
						bool hasTable = UtilClass.TableExists( row[ "fstrTable" ].ToString(), gc );
						List<string> cols = new List<string>();
						if( hasTable )
						{
							cols = UtilClass.AllColumnsExist( row[ "fstrTable" ].ToString(), "flngControlHeadersIDFK = " + row[ "idControlHeaders" ].ToString(), gc );
						}

                        td = new TableCell
                        {
                            Text = ((!hasTable || cols.Count != 0) && row["flngBlock"].ToString() != "0" ? "<span style=\"color: red\">*</span> " : "") + row["fstrTaxForm"].ToString()
                        };
                        tr.Cells.Add( td );

						td = new TableCell();

						// only the form header (block=0) is editable
						// controls and text don't play nice, use another control along with the hidden
						// label vs the text
						// this is now changed with the repeater blocks
						// the repeater blocks need their own tables, so we need to allow them to enter which table
						// still force the rest to be the same
						if( row[ "flngBlock" ].ToString() == "0" || row[ "fstrFormType" ].ToString() != "N" )
						{
                            TextBox txt = new TextBox
                            {
                                ID = "txtTbl" + row["idControlHeaders"].ToString(),
                                Text = row["fstrTable"].ToString()
                            };
                            td.Controls.Add( txt );
						}
						else
						{
                            Label lbl = new Label
                            {
                                ID = "lblTbl" + row["idControlHeaders"].ToString(),
                                Text = row["fstrTable"].ToString()
                            };
                            td.Controls.Add( lbl );
						}

                        // every row has an ID hidden to identify it
                        HiddenField hid = new HiddenField
                        {
                            ID = "hidID" + row["idControlHeaders"].ToString(),
                            Value = row["idControlHeaders"].ToString()
                        };
                        td.Controls.Add( hid );

						tr.Cells.Add( td );

                        td = new TableCell
                        {
                            Text = row["flngBlock"].ToString()
                        };
                        tr.Cells.Add( td );

						td = new TableCell();
						if( row[ "fstrFormType" ].ToString() == "R" )
							td.Text = "Repeater";
						else if( row[ "fstrFormType" ].ToString() == "P" )
							td.Text = "Multi-Page";
						else if( row[ "fstrFormType" ].ToString() == "RP" )
							td.Text = "Multi-Page Repeater";
						else
							td.Text = "Normal";
						tr.Cells.Add( td );

						td = new TableCell();
						// different link on block zero
						if( row[ "flngBlock" ].ToString() != "0" )
							td.Text = "<a href=\"formBuild.aspx?topHeaderID=" + row[ "topHeaderID" ].ToString() + "&headerID=" + row[ "idControlHeaders" ].ToString() + "&rhID=" + ViewState[ "rhID" ].ToString() + "&land=" + row["fstrLand"].ToString() + "\">Edit Form</a>";
						else
						{
							// radio buttons, one or the other
							string linkID = row[ "topHeaderID" ].ToString() + row[ "idControlHeaders" ].ToString() + ViewState[ "rhID" ].ToString();
							td.Text = "<a id=\"" + linkID + "\" href=\"../../noFront/newBlock.ashx?topHeaderID=" + row[ "topHeaderID" ].ToString() + "&headerID=" + row[ "idControlHeaders" ].ToString() + "&rhID=" + ViewState[ "rhID" ].ToString() + "\">Add Block</a>";
							td.Text += "<br /><input type=\"checkbox\" id=\"repeatCKB" + linkID + "\" value=\"repeat\" name=\"" + linkID + "CKB\" onclick=\"if(this.checked){\n$('#" + linkID + "').attr('href', $('#" + linkID + "').attr('href')+'&rp=1');\n}else{\n$('#" + linkID + "').attr('href', $('#" + linkID + "').attr('href').replace('&rp=1',''));\n}\" />Repeater";
							td.Text += "<input type=\"checkbox\" id=\"multiPageCKB" + linkID + "\" value=\"multiPage\" name=\"" + linkID + "CKB\" onclick=\"if(this.checked){\n$('#" + linkID + "').attr('href', $('#" + linkID + "').attr('href')+'&mp=1');\n}else{\n$('#" + linkID + "').attr('href', $('#" + linkID + "').attr('href').replace('&mp=1',''));\n}\" />Multi-Page";
						}
						tr.Cells.Add( td );

						td = new TableCell();
						// and finally a link to remove a block or form
						// note removing the form will remove all blocks
						// different link on block zero
						if( row[ "flngBlock" ].ToString() != "0" )
							td.Text = "<a href=\"../../noFront/RemBlock.ashx?topHeaderID=" + row[ "topHeaderID" ].ToString() + "&headerID=" + row[ "idControlHeaders" ].ToString() + "&block=" + row[ "flngBlock" ].ToString() + "&rhID=" + ViewState[ "rhID" ].ToString() + "\">Remove Block</a>";
						else
							td.Text = "<a href=\"../../noFront/RemBlock.ashx?topHeaderID=" + row[ "topHeaderID" ].ToString() + "&headerID=" + row[ "idControlHeaders" ].ToString() + "&block=" + row[ "flngBlock" ].ToString() + "&rhID=" + ViewState[ "rhID" ].ToString() + "\">Remove All Blocks</a>";
						tr.Cells.Add( td );

						tr.ID = row[ "idControlHeaders" ].ToString();

						// add the row to the table
						taxFormsTBL.Rows.Add( tr );
					}
				}

				gc.Disconnect();
			}
			catch( Exception ex )
			{
				UtilClass.RecordError( gc, ex );
				gc.Disconnect();
			}
		}

		protected void OnClick_newFormBTN(object sender, EventArgs e )
		{
			// if the validator did it's job
			if( Page.IsValid )
			{ 
				// get the name and add the declaration row in the table
				string statement = "INSERT INTO rfrControlHeaders ( ";
				statement += "fstrFileType, ";
				statement += "fstrTaxProgram, ";
				statement += "flngTaxYear, ";
				statement += "fstrTaxForm, ";
				statement += "fstrBlockTitle, ";
				statement += "flngBlock, ";
				statement += "fstrTable, ";
				statement += "flngClipTop, ";
				statement += "flngClipRight, ";
				statement += "flngClipBottom, ";
				statement += "flngClipLeft, ";
				statement += "fstrTemplateImage, ";
				statement += "fstrFormType, ";
				statement += "flngRepeatOffset, ";
				statement += "flngReturnHeadersIDFK ";

				statement += ") SELECT ";
				//@#@# some of these will be removed once the header columns are removed
				statement += "fstrFileType, ";
				statement += "fstrTaxProgram, ";
				statement += "flngTaxYear, ";
				statement += "'" + UtilClass.Sanitize( newFormTXT.Text ) + "', ";
				statement += "'" + UtilClass.Sanitize( newFormTXT.Text ) + "', ";
				statement += "0, ";
				statement += "'" + UtilClass.Sanitize( tableNameTXT.Text ) + "', ";
				statement += "0, ";
				statement += "0, ";
				statement += "0, ";
				statement += "0, ";
				statement += "'', ";
				statement += "'N', ";
				statement += "0, ";
                statement += ViewState["rhID"].ToString();
                statement += " FROM rfrReturnHeaders ";
                statement += "WHERE idReturnHeaders = " + ViewState[ "rhID" ].ToString() + ";";
				GoodConn gc = new GoodConn();
				try
				{
#if DEBUG
					gc.Connect( Resources.connString );
#else
					gc.Connect( Resources.prodConnString );
#endif
					gc.DoExecute( statement );
					gc.Disconnect();
				}
				catch( Exception ex )
				{
					UtilClass.RecordError( gc, ex );
					gc.Disconnect();
				}

				// reload the table, so they can then click and edit it
				LoadDatas();
			}
		}

		protected void OnClick_saveHeaderBTN( object sender, EventArgs e )
		{
			// save the header info on all form and control rows
			// identified by all the items in the QueryString
			GoodConn gc = new GoodConn();
			try
			{
#if DEBUG
				gc.Connect( Resources.connString );
#else
				gc.Connect( Resources.prodConnString );
#endif
				// only really need to update the return header values
				string statement = "UPDATE rfrReturnHeaders ";
				statement += "SET flngTaxYear = " + UtilClass.Sanitize( taxYearDDL.SelectedValue ) + ", ";
				statement += "fstrFileType = '" + UtilClass.Sanitize( fileTypeTXT.Text ) + "' ";
				statement += "WHERE idReturnHeaders = " + ViewState[ "rhID" ].ToString() + ";";
				gc.DoExecute( statement );

				gc.Disconnect();

				LoadDatas();
			}
			catch( Exception ex )
			{
				UtilClass.RecordError( gc, ex );
				gc.Disconnect();
			}
		}

		protected void OnClick_saveTableNameBTN( object sender, EventArgs e )
		{
			GoodConn gc = new GoodConn();
			string statement = "";
			try
			{
#if DEBUG
				gc.Connect( Resources.connString );
#else
				gc.Connect( Resources.prodConnString );
#endif

				// save the header ID
				string headerID = "";
				string newTblName = "";
				// loop over the rows
				foreach( TableRow row in taxFormsTBL.Rows )
				{
					if( row.ID == "headerROW" )
						continue;

					// get the hidden controls value
					foreach( Control c in row.Cells[ 1 ].Controls )
					{
						if( c.ID.IndexOf( "hidID" ) != -1 )
							headerID = ((HiddenField)c).Value;

						// by construction, only block=0 is editable
						// thus anything below this row will have the same table name
						// so save only if editable, leave as before if not
						if( c.ID.IndexOf( "txtTbl" ) != -1 && ( (TextBox)c ).ReadOnly == false )
							newTblName = ( (TextBox)c ).Text;
					}

					// build the statement to update
					statement = "UPDATE rfrControlHeaders SET fstrTable = '" + newTblName + "' ";
					statement += "WHERE idControlHeaders = " + headerID + ";";

					// and execute
					gc.DoExecute( statement );
				}
				gc.Disconnect();
				// and reload
				LoadDatas();
			}
			catch( Exception ex )
			{
				UtilClass.RecordError( gc, ex );
				gc.Disconnect();
			}
		}
	}
}