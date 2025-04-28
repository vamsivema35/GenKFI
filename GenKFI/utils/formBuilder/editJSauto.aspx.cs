using GenKFI.Properties;
using System;
using System.Data;
using System.Web.Security;
using System.Web.UI.WebControls;

namespace GenKFI.utils.formBuilder
{
    public partial class editJSauto : System.Web.UI.Page
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
			strCurrPage = "JS Auto-Complete Functions";
			//@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
			Session[ "kstrcurrPage" ] = strCurrPage;
			( (Literal)Master.FindControl( "titleLIT" ) ).Text = UtilClass.NormalizeUN( Context.User.Identity.Name ) + " : GenKFI Tax Programs - " + Session[ "tpSelHID" ].ToString().Replace( "ALL;", "" ).Replace( ";", ", " ) + " : " + Roles.GetRolesForUser( MyUserRole.UserName() )[ 0 ];
			( (Literal)Master.FindControl( "headerLIT" ) ).Text = Session[ "tpSelHID" ].ToString().Replace( "ALL;", "" ).Replace( ";", ", " ) + " : " + strCurrPage;
			Session[ "homeLink" ] = "Default.aspx";

			UtilClass ec = new UtilClass();
			ec.AdminOnly( strCurrPage );
			Response.BufferOutput = true;

			//@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
			//@#@# common code on all pages
			//@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#

			#endregion

			// first load, fill the LST
			if( !IsPostBack )
			{
				FillList();
			}
		}

		private void FillList()
		{
			GoodConn gc = new GoodConn();
			try
			{
#if DEBUG
				gc.Connect( Resources.connString );
#else
				gc.Connect( Resources.prodConnString );
#endif

				string statement = "SELECT IDrfrJavaAutoFunctions, fstrFuncName FROM rfrJavaAutoFunctions order by fstrFuncName;";
				gc.DoSelect( statement );
				DataTable dt = new DataTable();
				int numRows = gc.ReadSelect( out dt );
				functionLST.Items.Clear();
				if( numRows > 0 )
				{
					foreach( DataRow row in dt.Rows )
						functionLST.Items.Add( new ListItem( row[ 1 ].ToString(), row[ 0 ].ToString() ) );
				}
				gc.Disconnect();
			}
			catch( Exception ex )
			{
				UtilClass.RecordError( gc, ex );
				gc.Disconnect();
			}
		}

		protected void OnSelectedIndexChanged_functionLST(object sender, EventArgs e )
		{
			// when something gets selected, fill the text boxes with the appropriate values
			if( functionLST.SelectedIndex == -1 )
				return;

			GoodConn gc = new GoodConn();
			try
			{
#if DEBUG
				gc.Connect( Resources.connString );
#else
				gc.Connect( Resources.prodConnString );
#endif

                string statement = "SELECT fstrFuncName, fstrJavaTemplate, ";
                statement += "fstrInput1, fstrInput2, fstrName1, fstrName2 ";
                statement += "FROM rfrJavaAutoFunctions ";
                statement += "WHERE IDrfrJavaAutoFunctions = " + functionLST.SelectedValue + ";";
				gc.DoSelect( statement );
				DataTable dt = new DataTable();
				int numRows = gc.ReadSelect( out dt );
				if( numRows > 0 )
				{
					funcNameTXT.Text = dt.Rows[ 0 ][ "fstrFuncName" ].ToString();
					input1NameTXT.Text = dt.Rows[ 0 ][ "fstrInput1" ].ToString();
					input2NameTXT.Text = dt.Rows[ 0 ][ "fstrInput2" ].ToString();
					name1NameTXT.Text = dt.Rows[ 0 ][ "fstrName1" ].ToString();
					name2NameTXT.Text = dt.Rows[ 0 ][ "fstrName2" ].ToString();
					funcListTXT.Text = dt.Rows[ 0 ][ "fstrJavaTemplate" ].ToString();
				}
				gc.Disconnect();
			}
			catch( Exception ex )
			{
				UtilClass.RecordError( gc, ex );
				gc.Disconnect();
			}
		}

		protected void OnClick_addBTN( object sender, EventArgs e )
		{
			// make sure something is selected
			// we'll allow duplicate names, they should be smart enough to get around that themselves
			if( ( funcNameTXT.Text == "" ) ||
				( input1NameTXT.Text == "" ) ||
				( input2NameTXT.Text == "" ) ||
				( funcListTXT.Text == "" ) )
				return;

			GoodConn gc = new GoodConn();
			try
			{
#if DEBUG
				gc.Connect( Resources.connString );
#else
				gc.Connect( Resources.prodConnString );
#endif

				string statement = "INSERT INTO rfrJavaAutoFunctions ( fstrFuncName, fstrJavaTemplate, fstrInput1, fstrInput2, fstrName1, fstrName2 ) VALUES ( ";
				statement += "@funcNameTXT, ";
				statement += "@funcListTXT, ";
				statement += "@input1NameTXT, ";
				statement += "@input2NameTXT, ";
				statement += "@name1NameTXT, ";
				statement += "@name2NameTXT );";
				gc.ParamCommand( statement );
				gc.SetParam( "@funcNameTXT", SqlDbType.VarChar, funcNameTXT.Text );
				gc.SetParam( "@funcListTXT", SqlDbType.VarChar, funcListTXT.Text );
				gc.SetParam( "@input1NameTXT", SqlDbType.VarChar, input1NameTXT.Text );
				gc.SetParam( "@input2NameTXT", SqlDbType.VarChar, input2NameTXT.Text );
				gc.SetParam( "@name1NameTXT", SqlDbType.VarChar, name1NameTXT.Text );
				gc.SetParam( "@name2NameTXT", SqlDbType.VarChar, name2NameTXT.Text );
				gc.DoExecutePARAM();
				gc.Disconnect();

				FillList();
			}
			catch( Exception ex )
			{
				UtilClass.RecordError( gc, ex );
				gc.Disconnect();
			}
		}

		protected void OnClick_saveBTN( object sender, EventArgs e )
		{
			// can't save if nothing is selected
			if( functionLST.SelectedIndex == -1 )
				return;

			GoodConn gc = new GoodConn();
			try
			{
#if DEBUG
				gc.Connect( Resources.connString );
#else
				gc.Connect( Resources.prodConnString );
#endif

				string statement = "UPDATE rfrJavaAutoFunctions SET ";
				statement += "fstrFuncName = @fstrFuncName, ";
				statement += "fstrJavaTemplate = @fstrJavaTemplate, ";
				statement += "fstrInput1 = @fstrInput1, ";
				statement += "fstrInput2  = @fstrInput2, ";
				statement += "fstrName1 = @fstrName1, ";
				statement += "fstrName2  = @fstrName2 WHERE ";
				statement += "IDrfrJavaAutoFunctions = " + functionLST.SelectedValue + ";";
				gc.ParamCommand( statement );
				gc.SetParam( "@fstrFuncName", SqlDbType.VarChar, funcNameTXT.Text );
				gc.SetParam( "@fstrJavaTemplate", SqlDbType.VarChar, funcListTXT.Text );
				gc.SetParam( "@fstrInput1", SqlDbType.VarChar, input1NameTXT.Text );
				gc.SetParam( "@fstrInput2", SqlDbType.VarChar, input2NameTXT.Text );
				gc.SetParam( "@fstrName1", SqlDbType.VarChar, name1NameTXT.Text );
				gc.SetParam( "@fstrName2", SqlDbType.VarChar, name2NameTXT.Text );
				gc.DoExecutePARAM();
				gc.Disconnect();

				FillList();
			}
			catch( Exception ex )
			{
				UtilClass.RecordError( gc, ex );
				gc.Disconnect();
			}
		}

		protected void OnClick_remBTN( object sender, EventArgs e )
		{

			GoodConn gc = new GoodConn();
			try
			{
#if DEBUG
				gc.Connect( Resources.connString );
#else
				gc.Connect( Resources.prodConnString );
#endif

                // remove from the reference
                string statement = "DELETE FROM rfrJavaAutoFunctions ";
                statement += "WHERE IDrfrJavaAutoFunctions = " + functionLST.SelectedValue + ";";
				gc.DoExecute( statement );
                // remove from actual usage table
                statement = "DELETE FROM tblAutoJavacomplete ";
                statement += "WHERE flngJavaFuncIDFK = " + functionLST.SelectedValue + ";";
				gc.DoExecute( statement );
				gc.Disconnect();

				FillList();
			}
			catch( Exception ex )
			{
				UtilClass.RecordError( gc, ex );
				gc.Disconnect();
			}
		}
	}
}