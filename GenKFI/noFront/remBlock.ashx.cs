using GenKFI.Properties;
using System;
using System.Web;

namespace GenKFI.noFront
{
    /// <summary>
    /// Summary description for <see cref="RemBlock"/>
    /// </summary>
    public class RemBlock : IHttpHandler
	{

		public void ProcessRequest( HttpContext context )
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
				// first check if there are any blocks to delete
				statement = "SELECT MAX( t1.flngBlock ) ";
				statement += "	FROM rfrControlHeaders t1, ";
				//@#@# statement += "	( SELECT fstrFileType, flngTaxYear, fstrTaxProgram, fstrTaxForm, fstrFormType FROM rfrControlHeaders WHERE idControlHeaders = " + context.Request.QueryString[ "headerID" ].ToString() + " ) t2 WHERE ";
				statement += "	( SELECT fstrTaxForm, fstrFormType FROM rfrControlHeaders WHERE idControlHeaders = " + context.Request.QueryString[ "headerID" ].ToString() + " ) t2 WHERE ";
				/*
				statement += "	t1.fstrFileType = t2.fstrFileType AND ";
				statement += "	t1.flngTaxYear = t2.flngTaxYear AND ";
				statement += "	t1.fstrTaxProgram = t2.fstrTaxProgram AND ";
				*/
				statement += "	t1.fstrTaxForm = t2.fstrTaxForm AND ";
				statement += "	t1.fstrFormType = t2.fstrFormType AND ";
				statement += "	t1.flngReturnHeadersIDFK = " + context.Request.QueryString[ "rhID" ].ToString() + ";";
				int blockMax = int.Parse( gc.DoScalar( statement ).ToString() );

				int blockPassed = int.Parse( context.Request.QueryString[ "block" ].ToString() );
				// three cases
				// fourth case, block passed is not zero, max block is zero
					// not possible by construction
				// block passed is not zero, max block is not zero
				if( blockPassed != 0 && blockMax != 0 )
				{
					// delete the controls for that controlHeader value
					statement = "DELETE FROM rfrControls WHERE flngControlHeadersIDFK = " + context.Request.QueryString[ "headerID" ].ToString();
					gc.DoExecute( statement );
					// delete that controlHeader
					statement = "DELETE FROM rfrControlHeaders WHERE idControlHeaders = " + context.Request.QueryString[ "headerID" ].ToString();
					gc.DoExecute( statement );
				}
				// block passsed is zero, max block is not zero
				else if( blockPassed == 0 && blockMax != 0 )
				{
					// delete the controls for all blocks in that controlHeader
					statement = "DELETE FROM rfrControls WHERE flngControlHeadersIDFK IN ( ";
					statement += "SELECT idControlHeaders ";
					statement += "	FROM rfrControlHeaders t1, ";
					//@#@# statement += "	( SELECT fstrFileType, flngTaxYear, fstrTaxProgram, fstrTaxForm, fstrFormType FROM rfrControlHeaders WHERE idControlHeaders = " + context.Request.QueryString[ "headerID" ].ToString() + " ) t2 WHERE ";
					statement += "	( SELECT fstrTaxForm, fstrFormType FROM rfrControlHeaders WHERE idControlHeaders = " + context.Request.QueryString[ "headerID" ].ToString() + " ) t2 WHERE ";
					/*
					statement += "	t1.fstrFileType = t2.fstrFileType AND ";
					statement += "	t1.flngTaxYear = t2.flngTaxYear AND ";
					statement += "	t1.fstrTaxProgram = t2.fstrTaxProgram AND ";
					*/
					statement += "	t1.fstrTaxForm = t2.fstrTaxForm AND ";
					statement += "	t1.fstrFormType = t2.fstrFormType AND ";
					statement += "	t1.flngReturnHeadersIDFK = " + context.Request.QueryString[ "rhID" ].ToString() + " )";
					gc.DoExecute( statement );
					// delete all the headers under that controlHeader
					statement = "DELETE FROM rfrControlHeaders WHERE idControlHeaders IN ( ";
					statement += "SELECT idControlHeaders ";
					statement += "	FROM rfrControlHeaders t1, ";
					//@#@# statement += "	( SELECT fstrFileType, flngTaxYear, fstrTaxProgram, fstrTaxForm, fstrFormType FROM rfrControlHeaders WHERE idControlHeaders = " + context.Request.QueryString[ "headerID" ].ToString() + " ) t2 WHERE ";
					statement += "	( SELECT fstrTaxForm, fstrFormType FROM rfrControlHeaders WHERE idControlHeaders = " + context.Request.QueryString[ "headerID" ].ToString() + " ) t2 WHERE ";
					/*
					statement += "	t1.fstrFileType = t2.fstrFileType AND ";
					statement += "	t1.flngTaxYear = t2.flngTaxYear AND ";
					statement += "	t1.fstrTaxProgram = t2.fstrTaxProgram AND ";
					*/
					statement += "	t1.fstrTaxForm = t2.fstrTaxForm AND ";
					statement += "	t1.fstrFormType = t2.fstrFormType AND ";
					statement += "	t1.flngReturnHeadersIDFK = " + context.Request.QueryString["rhID"].ToString() + " ) AND ";
					statement += "idControlHeaders <> " + context.Request.QueryString[ "headerID" ].ToString() + ";";
					gc.DoExecute( statement );
				}
				// block passsed is zero, max block is zero
				else if( blockPassed == 0 && blockMax == 0 )
				{
					// delete that controlHeader (it won't have any controls, by construction)
					statement = "DELETE FROM rfrControlHeaders WHERE idControlHeaders = " + context.Request.QueryString[ "headerID" ].ToString();
					gc.DoExecute( statement );
				}
				gc.Disconnect();
			}
			catch( Exception ex )
			{
				UtilClass.RecordError( gc, ex );
				gc.Disconnect();
			}

			// and go back to the original page
			context.Response.Redirect( context.Request.UrlReferrer.AbsolutePath + "?rhID=" + context.Request.QueryString[ "rhID" ] );
		}

		public bool IsReusable
		{
			get
			{
				return false;
			}
		}
	}
}