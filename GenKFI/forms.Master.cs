using GenKFI.Properties;
using System;
using System.Data;
using System.Reflection.Emit;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace GenKFI
{

    public partial class Forms : MasterPage
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            //#if DEBUG
            //			string script = "<script type=\"text/javascript\">";
            //			script += "$(document).ready(function(){ ";
            //			script += "$( 'body' ).css( 'background-image', 'url(" + ResolveClientUrl( "~/images/dev.png" ) + " )' );";
            //			script += "$( 'body' ).css( 'background-repeat', 'repeat-y' );";
            //			script += "} );</script>";
            //			Page.ClientScript.RegisterStartupScript( this.GetType(), "backgroundset", script );
            //#endif

            // check for impersonation
            if (Session["impersonating"] == null)
                Session["impersonating"] = "";
            footerPNL.Visible = (bool)(Session["impersonating"].ToString() != "");
        }
        public void LoadCountryName()
        {
            // fill the Country DDLs

            if (CountryDDL.Visible == true)
            {
                CountryDDL.Visible = false;
                return;
            }

            CountryDDL.Visible = true;
            CountryDDL.Enabled = true;
            CountryDDL.Items.Clear();
            CountryDDL.Items.Add(new ListItem("Select A Country", "-1"));
            // Read Country Table and fill DropDownList
            GoodConn gc = new GoodConn();
            DataTable dt;
            int numRows;
            string statement;

            try
            {
#if DEBUG
                gc.Connect(Resources.connString);
#else
			    	gc.Connect( Resources.prodConnString );
#endif
                
                statement = "Select c.fstrCountryName ,";
                statement += " c.fstrCountryGT ";
                statement += "From rfrCountry c ";
                statement += "Order By c.fstrCountryName ";
                gc.DoSelect(statement);
                dt = new DataTable();
                numRows = gc.ReadSelect(out dt);
                if (numRows > 0)
                {
                    
                    foreach (DataRow row in dt.Rows)
                    {
                        CountryDDL.Items.Add(new ListItem(row["fstrCountryName"].ToString()));
                    }
                }
                gc.Disconnect();

                keFocusHID.Value = hidSaveFocus.Value;

            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
            }

        }


        protected void OnSelectedIndexChanged_CountryDDL(object sender, EventArgs e)
        {
            string strSQL = "";
            GoodConn gc = new GoodConn();
            string CCode = "";

            try
            {

#if DEBUG
                gc.Connect(Resources.connString);
#else
				gc.Connect( Resources.prodConnString );
#endif
                string CountryName = null;
                if (CountryDDL.SelectedItem.Text != "")
                  {
                    string CountryCode = CountryDDL.SelectedItem.Text;
                    if (CountryCode != null)
                    {
                        CountryName = CountryCode.ToString();
                    }
                }

                strSQL = "SELECT fstrCountryGT ";
                strSQL += " FROM rfrCountry ";
                strSQL += " WHERE fstrCountryName = '" + CountryName + "'";
                CCode = gc.DoScalar(strSQL).ToString();

                hidCCode.Value = CCode;
//                keCountryHID.Value = "txtCountry";

                CountryDDL.Visible = false;
                CountryDDL.SelectedIndex = 0;
                
                keFocusHID.Value = hidSaveFocus.Value;

                gc.Disconnect();
            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
            }
        }

    // since all pages using this master need the controls table somewhere
    // let's build the table here
    // if not needed, be sure to replace '~@markerRow@~' with an empty string
    // takes the connection, the submit button ID, and the three values to identify the controls needed
    // form name
    // TP file type
    // block number
    // moveOffset is a user supplied tag that they will be replacing later to offset the markerX values
    // includeMovement is a bit-wise indicator of which movement functions to include, where
    //		1's bit ~ control scroll via CtlMove
    //		2's bit ~ image move via moveStuff
    //		4's bit ~ marker move via moveStuff
    //		xyz = 7 includes them all
    public StringBuilder GetControlsTable( GoodConn gc, string btnSubID, string controlHeaderID, string moveOffsetM = "", string moveOffsetI = "", string moveOffsetC = "", string inputClass = "", int includeMovement = 7, string alignToControlName = "", string repeatOffset = "" )
		{
			StringBuilder ret = new StringBuilder();

			// no headerID, no controls, return empty table
			if( controlHeaderID == null || controlHeaderID == "" )
			{
				ret.Append( "<table id=\"tableCtrl\" cellspacing=\"0\" cellpadding=\"0\" style=\"margin: auto; width: 90%;\"></table>" );
				return ret;
			}

			if( !gc.IsOpen )
				return ret;

			try
			{
				string statement = "SELECT cc.IDrfrControls, ";
				statement += "cc.fblnHidden, ";
				statement += "cc.fblnRequired, ";
				statement += "cc.fstrLabel, ";
				statement += "cc.fstrInputId, ";
				statement += "cc.flngDispLength, ";
                statement += "cc.flngMaxLength, ";
                statement += "cc.flngCtrlMove, ";
				statement += "cc.flngImgMoveX, ";
				statement += "cc.flngImgMoveY, ";
				statement += "cc.flngMarkerMoveX, ";
				statement += "cc.flngMarkerMoveY, ";
                statement += "cc.flngCtrl2Move, ";
                statement += "cc.flngImg2MoveX, ";
                statement += "cc.flngImg2MoveY, ";
                statement += "cc.flngMarker2MoveX, ";
                statement += "cc.flngMarker2MoveY, ";
                statement += "cc.flngCtrl3Move, ";
                statement += "cc.flngImg3MoveX, ";
                statement += "cc.flngImg3MoveY, ";
                statement += "cc.flngMarker3MoveX, ";
                statement += "cc.flngMarker3MoveY, ";
                statement += "cc.flngCtrl4Move, ";
                statement += "cc.flngImg4MoveX, ";
                statement += "cc.flngImg4MoveY, ";
                statement += "cc.flngMarker4MoveX, ";
                statement += "cc.flngMarker4MoveY, ";
                statement += "cc.flngCtrl5Move, ";
                statement += "cc.flngImg5MoveX, ";
                statement += "cc.flngImg5MoveY, ";
                statement += "cc.flngMarker5MoveX, ";
                statement += "cc.flngMarker5MoveY, ";
                statement += "cc.flngCtrl6Move, ";
                statement += "cc.flngImg6MoveX, ";
                statement += "cc.flngImg6MoveY, ";
                statement += "cc.flngMarker6MoveX, ";
                statement += "cc.flngMarker6MoveY, ";
                statement += "cc.flngCtrl7Move, ";
                statement += "cc.flngImg7MoveX, ";
                statement += "cc.flngImg7MoveY, ";
                statement += "cc.flngMarker7MoveX, ";
                statement += "cc.flngMarker7MoveY, ";
                statement += "cc.fstrNextCtrl, ";
				statement += "cc.flngFormatIDFK, ";
				// for the format function
				statement += "rfrFormatTypes.fstrFJSfuncName AS formatFunc, ";
				statement += "ISNULL( rfrFormatTypes.fstrDoLookupType, '' ) AS fstrDoLookup, ";
				statement += "cc.fstrColumn, ";
				statement += "cc.fblnVertSkip, ";
                statement += "ch.fstrTaxProgram, ";
                statement += "str(ch.fblnLand,1) As fblnLand, ";
                statement += "ch.fstrAcctType ";
                // this stays the same
				statement += "FROM rfrControlHeaders ch, rfrControls cc LEFT JOIN rfrFormatTypes ON cc.flngFormatIDFK = rfrFormatTypes.IDrfrFormatTypes ";
				statement += "WHERE flngControlHeadersIDFK = " + controlHeaderID + " AND ";
                statement += "ch.idControlHeaders = " + controlHeaderID + " AND ";
                statement += "cc.fblnActive = 1 AND ";
				statement += "cc.flngOrder > 0 ";
				statement += "ORDER BY cc.flngOrder";

				gc.DoSelect( statement );
				DataTable ctrlDT = new DataTable();
				int numRows = gc.ReadSelect( out ctrlDT );
				// put controls in here, just leave as HTML controls, and the javascript can
				// handle everything from the events and scripts in the database
				// controlsLIT
				// String manipulation into html 
                int inttab = 11;
				if( numRows > 0 )
				{
					foreach( DataRow row in ctrlDT.Rows )
					{
						// try something else for this, maybe make it look better
						// this will be replaced later to remove the new row if the control is in the second column, i.e. </tr>1<tr>
						ret.Append( "~fblnVertSkip~<tr>\n" );
						ret.Append( "	<td>\n" );
						// if not a label type, we want the label here
						if( row[ "fstrInputID" ].ToString().Substring( 0, 3 ) != "lbl" )
						{
							ret.Append( "		fstrLabel\n" );
						}
						ret.Append( "	</td>\n" );
						ret.Append( "	<td>\n" );
						// if a label type, put the label here
						if( row[ "fstrInputID" ].ToString().Substring( 0, 3 ) == "lbl" )
						{
							ret.Append( "		<span style=\"font-weight:bold;\">fstrLabel</span>\n" );
						}
						// if not a label, put in all the rest of the junk
						else
						{
							ret.Append( "		<input\n" );
							ret.Append( "			id=\"~fstrInputId\"\n" );
							ret.Append( "			name=\"~fstrInputId\"\n" );
							ret.Append( "			class=\"" + inputClass + "\"" );
                            if (row["fblnHidden"].ToString() == "1")
                                ret.Append("			tabindex=\"-1\"\"");
                            else
                                ret.Append("			tabindex=\"" + "~@TI@~" + inttab.ToString() + "\"");

							ret.Append( "			type=\"fblnHiddenfstrInputId\"\n" );
                            ret.Append("			autocomplete=\"nope\"\n");
                            ret.Append("			maxlength=\"flngMaxLengthmx\"\n");
							ret.Append( "			style=\"height: 22px;\n" );
							ret.Append( "				width: flngDispLengthpx;\n" );
							ret.Append( "				background-color: rgb(255, 255, 255);\"\n" );
                            // if checkbox - was the mouse use to check it
                            if (row["fstrInputId"].ToString().Substring(0, 3) == "ckb" || row["fstrInputId"].ToString().Substring(0, 3) == "chk")
                            {
                                ret.Append("			onClick=\"chkClick(this);selNext(fstrNextCtrl);\"\n");
                            }
                            ret.Append("			onfocus=\"$(this).css('background-color', '#66FF99'); SaveTheFocus(~fstrInputId);\n");
							if( ( includeMovement & 1 ) != 0 )
                            ret.Append("				CtlMove(flngCtrlMove" + moveOffsetC + ", ~@TB@~);\n");

							ret.Append( "				moveStuff(fblnLand,flngImgMoveX,flngImgMoveY" + moveOffsetI + "," );
							ret.Append( ( ( includeMovement & 2 ) != 0 ? "true" : "false" ) + ",flngMarkerMoveX,flngMarkerMoveY" + moveOffsetM + "," );
							ret.Append( ( ( includeMovement & 4 ) != 0 ? "true" : "false" ) );
							// if passed, the moveStuff function will align to the passed control name AFTER the stored movements and offsets
							ret.Append( ( alignToControlName == "" ? "" : alignToControlName ) );
							// if passed, pass along to moveStuff
							ret.Append( ( repeatOffset == "" ? "" : repeatOffset ) + ");\n" );

                            // if this field is required, make a note when this field is entered
                            if (row["fblnRequired"].ToString() == "1")
                            {
                                ret.Append("				AddTouch(this);\n");
                                ret.Append("				$('#~fstrInputIdTouched').val('1');\n");
                            }
                            // close the onFocus handler
                            ret.Append( "\"\n" );
							ret.Append( "			onblur=\"$(this).css('background-color', '#FFFFFF');saveTheVal(~fstrInputId);\"\n" );
							ret.Append( "			onkeydown=\"if(chkAction('~isCheck~', this)) {\n" );
							ret.Append( "				doFormat( this,formatFunc, 'fstrDoLookup', 'fstrAcctType' );\n" );
							ret.Append( "				selNext(fstrNextCtrl);}\"\n" );
							ret.Append( "			value=\"~fstrColumn~\">\n" );

							// if this field is required, add a hidden field here to hold a toggle if the field was touched or not
							// this value is then checked in the checkRequired function on KeyEntry.aspx
							if( row[ "fblnRequired" ].ToString() == "1" )
								ret.Append( "		<input type=\"hidden\" ID=\"~fstrInputIdTouched\" value=\"-1\" >\n" );

                            if (row["fblnHidden"].ToString() == "0")
                                inttab++;

						}
						ret.Append( "	</td>\n" );
						ret.Append( "</tr>\n" );

						// put in the DB values
						// this will be replaced later to remove the new row if the control is in the second column, i.e. </tr>1<tr>
						ret.Replace( "fblnVertSkip", row[ "fblnVertSkip" ].ToString() );
						// no label if hidden, and set type
						if( row[ "fblnHidden" ].ToString() == "1" )
						{
							ret.Replace( "fstrLabel", "" );
							ret.Replace( "fblnHiddenfstrInputId", "hidden" );
						}
						else
						{
							// flag required items
							if( row[ "fblnRequired" ].ToString() == "1" )
								ret.Replace( "fstrLabel", row[ "fstrLabel" ].ToString() + " <span style=\"color: red;\">*</span>" );
							else
								ret.Replace( "fstrLabel", row[ "fstrLabel" ].ToString() );

							if( row[ "fstrInputId" ].ToString().Substring( 0, 3 ) == "ckb" || row[ "fstrInputId" ].ToString().Substring( 0, 3 ) == "chk" )
							{
								ret.Replace( "fblnHiddenfstrInputId", "checkbox" );
								ret.Replace( "~isCheck~", "1" );
							}
							else
							{
								ret.Replace( "fblnHiddenfstrInputId", "text" );
								ret.Replace( "~isCheck~", "0" );
							}
						}
						ret.Replace( "~fstrInputId", row[ "fstrInputId" ].ToString() );
						ret.Replace( "flngMaxLengthmx", row[ "flngMaxLength" ].ToString() );
						// added a limiter to this, looks weird when the boxes are too long
						int myWidth = int.Parse( row[ "flngDispLength" ].ToString() ) * 18;
						if( myWidth > 252 )
							myWidth = 252;
						ret.Replace( "flngDispLengthpx", myWidth.ToString() + "px" );
                        ret.Replace("fblnLand", row["fblnLand"].ToString());

                        if (row["fstrTaxProgram"].ToString() == "OGD")
                        {
                            if (hidOgdForm.Value == "0")
                            {
                                ret.Replace("flngCtrlMove", row["flngCtrlMove"].ToString());
                                ret.Replace("flngImgMoveX", row["flngImgMoveX"].ToString());
                                ret.Replace("flngImgMoveY", row["flngImgMoveY"].ToString());
                                ret.Replace("flngMarkerMoveX", row["flngMarkerMoveX"].ToString());
                                ret.Replace("flngMarkerMoveY", row["flngMarkerMoveY"].ToString());
                            }
                            if (hidOgdForm.Value == "2")
                            {
                                ret.Replace("flngCtrlMove", row["flngCtrl2Move"].ToString());
                                ret.Replace("flngImgMoveX", row["flngImg2MoveX"].ToString());
                                ret.Replace("flngImgMoveY", row["flngImg2MoveY"].ToString());
                                ret.Replace("flngMarkerMoveX", row["flngMarker2MoveX"].ToString());
                                ret.Replace("flngMarkerMoveY", row["flngMarker2MoveY"].ToString());
                            }
                            if (hidOgdForm.Value == "3")
                            {
                                ret.Replace("flngCtrlMove", row["flngCtrl3Move"].ToString());
                                ret.Replace("flngImgMoveX", row["flngImg3MoveX"].ToString());
                                ret.Replace("flngImgMoveY", row["flngImg3MoveY"].ToString());
                                ret.Replace("flngMarkerMoveX", row["flngMarker3MoveX"].ToString());
                                ret.Replace("flngMarkerMoveY", row["flngMarker3MoveY"].ToString());
                            }
                            if (hidOgdForm.Value == "4")
                            {
                                ret.Replace("flngCtrlMove", row["flngCtrl4Move"].ToString());
                                ret.Replace("flngImgMoveX", row["flngImg4MoveX"].ToString());
                                ret.Replace("flngImgMoveY", row["flngImg4MoveY"].ToString());
                                ret.Replace("flngMarkerMoveX", row["flngMarker4MoveX"].ToString());
                                ret.Replace("flngMarkerMoveY", row["flngMarker4MoveY"].ToString());
                            }
                            if (hidOgdForm.Value == "5")
                            {
                                ret.Replace("flngCtrlMove", row["flngCtrl5Move"].ToString());
                                ret.Replace("flngImgMoveX", row["flngImg5MoveX"].ToString());
                                ret.Replace("flngImgMoveY", row["flngImg5MoveY"].ToString());
                                ret.Replace("flngMarkerMoveX", row["flngMarker5MoveX"].ToString());
                                ret.Replace("flngMarkerMoveY", row["flngMarker5MoveY"].ToString());
                            }
                            if (hidOgdForm.Value == "6")
                            {
                                ret.Replace("flngCtrlMove", row["flngCtrl6Move"].ToString());
                                ret.Replace("flngImgMoveX", row["flngImg6MoveX"].ToString());
                                ret.Replace("flngImgMoveY", row["flngImg6MoveY"].ToString());
                                ret.Replace("flngMarkerMoveX", row["flngMarker6MoveX"].ToString());
                                ret.Replace("flngMarkerMoveY", row["flngMarker6MoveY"].ToString());
                            }
                            if (hidOgdForm.Value == "7")
                            {
                                ret.Replace("flngCtrlMove", row["flngCtrl7Move"].ToString());
                                ret.Replace("flngImgMoveX", row["flngImg7MoveX"].ToString());
                                ret.Replace("flngImgMoveY", row["flngImg7MoveY"].ToString());
                                ret.Replace("flngMarkerMoveX", row["flngMarker7MoveX"].ToString());
                                ret.Replace("flngMarkerMoveY", row["flngMarker7MoveY"].ToString());
                            }
                        }
                        else
                        {
                            ret.Replace("flngCtrlMove", row["flngCtrlMove"].ToString());
                            ret.Replace("flngImgMoveX", row["flngImgMoveX"].ToString());
                            ret.Replace("flngImgMoveY", row["flngImgMoveY"].ToString());
                            ret.Replace("flngMarkerMoveX", row["flngMarkerMoveX"].ToString());
                            ret.Replace("flngMarkerMoveY", row["flngMarkerMoveY"].ToString());
                        }

                        ret.Replace( "formatFunc", row[ "formatFunc" ].ToString() );
						ret.Replace( "fstrDoLookup", row[ "fstrDoLookup" ].ToString() );
                        ret.Replace( "fstrAcctType", row["fstrAcctType"].ToString());
                        // different on final or not
						if( row[ "fstrNextCtrl" ].ToString() == "btnSub" )
							ret.Replace( "fstrNextCtrl", btnSubID );
						else
							ret.Replace( "fstrNextCtrl", row[ "fstrNextCtrl" ].ToString() );
						ret.Replace( "fstrColumn", row[ "fstrColumn" ].ToString() );
					}

					// remove extra rows on controls in 2nd column
					ret = ret.Replace( "</tr>\n~1~<tr>", "\n" );
					ret = ret.Replace( "</tr>\n~0~<tr>", "</tr>\n<tr>" );
					ret = ret.Replace( "~1~", "" );
					ret = ret.Replace( "~0~", "" );
					// some final formatting
					ret.Insert( 0, "<table id=\"tableCtrl\" cellspacing=\"0\" cellpadding=\"0\" style=\"margin: auto; width: 90%;\">~@markerRow@~" );
					ret.Append( "</table>" );



				}
			}
			catch( Exception ex )
			{
				throw new Exception( "Control Table Builder Error", ex );
			}
			return ret;
		}

		// as above, we'll need to use this on the key page and the test page
		// so put it here
		// we need most of the same things as above
		// takes the connection, and the three values to identify the controls needed
		// form name
		// TP file type
		// block number
		// returns the maxScroll value to put on the page
		public long RegisterAutoJavaScripts( GoodConn gc, string controlHeaderID, string repeaterNameIndex = "" )
		{
			// no headerID, no controls, return 0
			if( controlHeaderID == null || controlHeaderID == "" )
				return 0;

			long maxScrl;
//            integer intmaxScrl = 0;
			if( !gc.IsOpen )
				return 0;

            try
            {

                // JD Start for Replacement
                string ctrlStatement = "SELECT max(flngCtrlMove) As CtrlMove ";
                ctrlStatement += "FROM rfrControls ";
                ctrlStatement += "WHERE flngControlHeadersIDFK = " + controlHeaderID + " AND ";
                ctrlStatement += "fblnActive = 1 AND ";
                ctrlStatement += "flngOrder > 0 ";

                maxScrl = (Int32)gc.DoScalar(ctrlStatement);

 //               gc.doSelect(ctrlStatement);

 //               maxScrl = long.Parse(intmaxScrl);

                string AJSstatement = "SELECT ";
                AJSstatement += " ajc.IDtblAutoJavaComplete AS ID, ";
                AJSstatement += " ajc.flngControlOutIDFK AS idCtrl, ";
                AJSstatement += " c1.fstrInputID AS cout, ";
                AJSstatement += " 	(Case When ajc.flngControl1IDFK > 0 then ";
                AJSstatement += " 	    (Select c2.fstrInputID ";
                AJSstatement += "        From rfrControls c2 ";
                AJSstatement += "        Where c2.IDrfrControls = ajc.flngControl1IDFK) ";
                AJSstatement += "    Else  str(ajc.flngControl1IDFK,3) End) AS in1, ";
                AJSstatement += " (Case When ajc.flngControl2IDFK > 0 then ";
                AJSstatement += "     (Select c3.fstrInputID ";
                AJSstatement += " 	   From rfrControls c3 ";
                AJSstatement += "      Where c3.IDrfrControls = ajc.flngControl2IDFK) ";
                AJSstatement += "   Else  str(ajc.flngControl2IDFK,3) End) AS in2, ";
                AJSstatement += " ajc.fdecConstant AS const,  ";
                AJSstatement += " (Case When ajc.flngName1IDFK > 0 then  ";
                AJSstatement += "     (Select c4.fstrInputID ";
                AJSstatement += "      From rfrControls c4 ";
                AJSstatement += "      Where c4.IDrfrControls = ajc.flngName1IDFK) ";
                AJSstatement += "   Else  str(ajc.flngName1IDFK,3) End) AS Nin1, ";
                AJSstatement += " (Case When ajc.flngName2IDFK > 0 then  ";
                AJSstatement += "     (Select c5.fstrInputID ";
                AJSstatement += "      From rfrControls c5 ";
                AJSstatement += "      Where c5.IDrfrControls = ajc.flngName2IDFK) ";
                AJSstatement += "   Else  str(ajc.flngName2IDFK,3) End) AS Nin2, ";
                AJSstatement += " CAST( jaf.fstrJavaTemplate AS VARCHAR( 1024 ) ) AS listing, ";
                AJSstatement += " jaf.fstrInput1 AS jIn1, ";
                AJSstatement += " jaf.fstrInput2 AS jIn2, ";
                AJSstatement += " jaf.fstrName1 AS jNIn1, ";
                AJSstatement += " jaf.fstrName2 AS jNIn2, ";
                AJSstatement += " ajc.flngOrder AS ord, ";
                AJSstatement += " ajc.fblnOnBlur as onBlur ";
                AJSstatement += " FROM  ";
                AJSstatement += " tblAutoJavaComplete ajc ";
                AJSstatement += " INNER JOIN rfrJavaAutoFunctions jaf ON ajc.flngJavaFuncIDFK = jaf.IDrfrJavaAutoFunctions ";
                AJSstatement += " INNER JOIN rfrControls c1 ON ajc.flngControlOutIDFK = c1.IDrfrControls ";
                AJSstatement += " WHERE ";
                AJSstatement += " ajc.flngControlOutIDFK in ( ";
                AJSstatement += " select IDrfrControls ";
                AJSstatement += " from rfrControls ";
                AJSstatement += " where flngControlHeadersIDFK =  " + controlHeaderID + " ) ";
                AJSstatement += " Order by ajc.flngControlOutIDFK, ajc.fblnOnBlur, ajc.flngOrder  ";
                gc.DoSelect(AJSstatement);
                DataTable AJSdt = new DataTable();
                int AJSnumRows = gc.ReadSelect(out AJSdt);
                if (AJSnumRows > 0)
                {
                    // we have rows to deal with, do so here to build the jQuery we need to register on the page
                    // SELECTed columns
                    // cout		output control name (same for all rows, by construction)
                    // in1		input 1 control name (-10 for previous row, -20 for constant)
                    // in2		input 2 control name
                    // const	contant value (to use when in1 == -20)
                    // listing	java template listing
                    // jIn1		value to replace in listing with in1 (or constant, or previous value, based on in1 value)
                    // jIn2		value to replace in listing with in2
                    // ord		order to apply the listing to the values (ORDER BY value)
                    // onBlur	flag to register function in onblur, instead of onfocus
                    string AJSscript = "";
                    string strCtrl = "";
                    string strcout = "";
                    string strOnBlur = "";
                    string eventName = "";
                    foreach (DataRow AJSrow in AJSdt.Rows)
                    {
                       if (strCtrl == "") 
                       { 
                           strCtrl = AJSrow["idCtrl"].ToString();
                           strOnBlur = AJSrow["onBlur"].ToString();
                           strcout = AJSrow["cout"].ToString();
                       }
                        if (strOnBlur != AJSrow["onBlur"].ToString())
                        {
                            eventName = "focus";
                            if (strOnBlur == "1")
                                eventName = "blur";
                            AJSscript = "$(document).ready(function(){\n$('#" + strcout + repeaterNameIndex + "').on('" + eventName + "', function(){\n$('#" + strcout + repeaterNameIndex + "').val(" + AJSscript + ");\n";
                            // only if this is on focus, select it, otherwise we can never leave this control
                            if (eventName == "focus")
                                AJSscript += "$('#" + strcout + repeaterNameIndex + "').select();";
                            AJSscript += "\n});\n});";
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), strCtrl + eventName + repeaterNameIndex, AJSscript, true);
                            AJSscript = "";
                            strOnBlur = AJSrow["onBlur"].ToString();
                            strCtrl = AJSrow["idCtrl"].ToString();
                            strcout = AJSrow["cout"].ToString();
                        }
                        if (strCtrl != AJSrow["idCtrl"].ToString()) 
                        {
                            eventName = "focus";
                            if (strOnBlur == "1")
                                eventName = "blur";
                            AJSscript = "$(document).ready(function(){\n$('#" + strcout + repeaterNameIndex + "').on('" + eventName + "', function(){\n$('#" + strcout + repeaterNameIndex + "').val(" + AJSscript + ");\n";
                            // only if this is on focus, select it, otherwise we can never leave this control
                            if (eventName == "focus")
                                AJSscript += "$('#" + strcout + repeaterNameIndex + "').select();";
                            AJSscript += "\n});\n});";
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), strCtrl + eventName + repeaterNameIndex, AJSscript, true);
                            AJSscript = "";
                            strOnBlur = AJSrow["onBlur"].ToString();
                            strCtrl = AJSrow["idCtrl"].ToString();
                            strcout = AJSrow["cout"].ToString();
                        }

                        string sBuff = sBuff = AJSrow["listing"].ToString();
                        // check first term, in1 and jIn1
                        // previous value, -10
                        if (AJSrow["in1"].ToString() == "-10")
                        {
                            // check second term, in2 and jIn2
                            // previous value, -10
                            if (AJSrow["in2"].ToString() == "-10")
                            {
                                // replace second input with the current script and save in output
                                AJSscript = sBuff.Replace(AJSrow["jIn1"].ToString(), "(" + AJSscript + ")").Replace(AJSrow["jIn2"].ToString(), "(" + AJSscript + ")");
                            }
                            // constant, -20
                            else if (AJSrow["in2"].ToString() == "-20")
                            {
                                // replace first input with the current script
                                sBuff = sBuff.Replace(AJSrow["jIn1"].ToString(), "(" + AJSscript + ")");
                                // replace second input with the constant value
                                AJSscript = sBuff.Replace(AJSrow["jIn2"].ToString(), AJSrow["const"].ToString());
                            }
                            // normal control
                            else
                            {
                                // replace first input with the current script
                                sBuff = sBuff.Replace(AJSrow["jIn1"].ToString(), "(" + AJSscript + ")");
                                // replace second input with the control name
                                AJSscript = sBuff.Replace(AJSrow["jIn2"].ToString(), "$('#" + AJSrow["in2"].ToString() + repeaterNameIndex + "').val().replace(/,/g,\"\")");
                            }
                        }
                        // constant, -20
                        else if (AJSrow["in1"].ToString() == "-20")
                        {
                            // check second term, in2 and jIn2
                            // previous value, -10
                            if (AJSrow["in2"].ToString() == "-10")
                            {
                                // replace the first input with the constant
                                // replace the second input with the previous script
                                AJSscript = sBuff.Replace(AJSrow["jIn1"].ToString(), AJSrow["const"].ToString()).Replace(AJSrow["jIn2"].ToString(), "(" + AJSscript + ")");
                            }
                            // constant, -20
                            else if (AJSrow["in2"].ToString() == "-20")
                            {
                                // replace both inputs with the constant, lost the previous script here
                                AJSscript = sBuff.Replace(AJSrow["jIn1"].ToString(), AJSrow["const"].ToString()).Replace(AJSrow["jIn2"].ToString(), AJSrow["const"].ToString());
                            }
                            // normal control
                            else
                            {
                                // replace the first input with the constant
                                // replace the second input with the control value function
                                AJSscript = sBuff.Replace(AJSrow["jIn1"].ToString(), AJSrow["const"].ToString()).Replace(AJSrow["jIn2"].ToString(), "$('#" + AJSrow["in2"].ToString() + repeaterNameIndex + "').val().replace(/,/g,\"\")");
                            }
                        }
                        // normal control
                        else
                        {
                            // check second term, in2 and jIn2
                            // previous value, -10
                            if (AJSrow["in2"].ToString() == "-10")
                            {
                                // replace the first input with the control string
                                // replace the second input with the previous script
                                AJSscript = sBuff.Replace(AJSrow["jIn1"].ToString(), "$('#" + AJSrow["in1"].ToString() + repeaterNameIndex + "').val().replace(/,/g,\"\")").Replace(AJSrow["jIn2"].ToString(), "(" + AJSscript + ")");
                            }
                            // constant, -20
                            else if (AJSrow["in2"].ToString() == "-20")
                            {
                                // replace the first input with the control string
                                // replace the second input with the constant
                                AJSscript = sBuff.Replace(AJSrow["jIn1"].ToString(), "$('#" + AJSrow["in1"].ToString() + repeaterNameIndex + "').val().replace(/,/g,\"\")").Replace(AJSrow["jIn2"].ToString(), AJSrow["const"].ToString());
                            }
                            // normal control
                            else
                            {
                                // replace the first input with the control string
                                // replace the second input with the control string
                                AJSscript = sBuff.Replace(AJSrow["jIn1"].ToString(), "$('#" + AJSrow["in1"].ToString() + repeaterNameIndex + "').val().replace(/,/g,\"\")").Replace(AJSrow["jIn2"].ToString(), "$('#" + AJSrow["in2"].ToString() + repeaterNameIndex + "').val().replace(/,/g,\"\")"); ;
                            }
                        }

                        // all the scripts are built, now put in the names, if any
                        if (AJSrow["jNIn1"].ToString() != "")
                        {
                            AJSscript = AJSscript.Replace(AJSrow["jNIn1"].ToString(), AJSrow["Nin1"].ToString() + repeaterNameIndex);
                        }
                        if (AJSrow["jNIn2"].ToString() != "")
                        {
                            AJSscript = AJSscript.Replace(AJSrow["jNIn2"].ToString(), AJSrow["Nin2"].ToString() + repeaterNameIndex);
                        }

                    }
                    // build all the calcs, now register the function with jQuery in the onfocus
                   if (AJSscript != "")
                   {
                       eventName = "focus";
                       if (strOnBlur == "1")
                           eventName = "blur";
                       AJSscript = "$(document).ready(function(){\n$('#" + strcout + repeaterNameIndex + "').on('" + eventName + "', function(){\n$('#" + strcout + repeaterNameIndex + "').val(" + AJSscript + ");\n";
                      // only if this is on focus, select it, otherwise we can never leave this control
                       if (eventName == "focus")
                           AJSscript += "$('#" + strcout + repeaterNameIndex + "').select();";
                       AJSscript += "\n});\n});";
                       ScriptManager.RegisterClientScriptBlock(this, this.GetType(), strCtrl + eventName + repeaterNameIndex, AJSscript, true);
                    }
                }
            }

			catch (Exception ex)
            {
                throw new Exception("Control Table Builder Error", ex);
            }

			return maxScrl;
		}

		// this gets the fintZoomPerc from rfrControlHeaders, and sets some initial scripts to size the image
		public void SetZoomFactor( string controlHeaderID, string imageID, GoodConn gc )
		{
			if( !gc.IsOpen )
				return;

			// need the zoom factor
			string statement = "SELECT fintZoomPerc FROM rfrControlHeaders ch WHERE idControlHeaders = " + controlHeaderID + ";";
			string zoomFactor = ( float.Parse( gc.DoScalar( statement ).ToString() ) / 100.0 ).ToString();

            // set the zoomFactor in the page
            if ( !Page.ClientScript.IsStartupScriptRegistered( "setFZ" ) )
			{
				//string setFZ = "$(\"" + imageID + "\").load(function() { foomZactor = " + zoomFactor.ToString() + ";\n";
				string setFZ = "$(window).load(function() { foomZactor = " + zoomFactor.ToString() + ";\n";
                setFZ += "setOriginals();\n";
                setFZ += "$(\"#divImageDrag\").css(\"top\", $(\"#dragTHID\").val().replace(\"px\", \"\") * foomZactor + (1 - foomZactor) * $(\"#divMarker\").css(\"top\").replace(\"px\", \"\"));\n";
				setFZ += "$(\"#divImageDrag\").css(\"left\", $(\"#dragLHID\").val().replace(\"px\", \"\") * foomZactor + (1 - foomZactor) * $(\"#divMarker\").css(\"left\").replace(\"px\", \"\"));\n";
				setFZ += "$(\"#" + imageID + "\").width($(\"#imgWHID\").val() * foomZactor);\n";
				setFZ += "$(\"#" + imageID + "\").height($(\"#imgHHID\").val() * foomZactor);\n";
				setFZ += "origFoomZactor = " + zoomFactor.ToString() + ";";
				setFZ += "if( document.getElementById( document.getElementById( \"" + keFocusHID.ClientID + "\" ).value ) != null ){\n";
				setFZ += "document.getElementById( document.getElementById( \"" + keFocusHID.ClientID + "\" ).value ).select();\n";
				setFZ += "document.getElementById( document.getElementById( \"" + keFocusHID.ClientID + "\" ).value ).blur();\n";
				setFZ += "document.getElementById( document.getElementById( \"" + keFocusHID.ClientID + "\" ).value ).focus();}\n";
				setFZ += "});";
				//@#@# need to find a way to know when the image is loaded, so we can get the initial values and set them appropriately
				ScriptManager.RegisterStartupScript( this.Page, this.Page.GetType(), "setFZ", setFZ, true );
			}
		}
	}
}