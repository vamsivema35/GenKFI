using GenKFI.Properties;
using System;
using System.Web;

namespace GenKFI.noFront
{
    /// <summary>
    /// Summary description for newBlock
    /// </summary>
    public class NewBlock : IHttpHandler
	{

		public void ProcessRequest( HttpContext context )
		{
			GoodConn gc = new GoodConn();
			try
			{
#if DEBUG
				gc.Connect( Resources.connString );
#else
				gc.Connect( Resources.prodConnString );
#endif

				string statement = "INSERT INTO rfrControlHeaders ( ";
				//@#@# statement += "	fstrFileType, ";
				//@#@# statement += "	fstrTaxProgram, ";
				//@#@# statement += "	flngTaxYear, ";
				statement += "	fstrTaxForm, ";
				statement += "	fstrBlockTitle, ";
				statement += "	flngBlock, ";
				statement += "	fstrTable, ";
				statement += "	flngClipTop, ";
				statement += "	flngClipRight, ";
				statement += "	flngClipBottom, ";
				statement += "	flngClipLeft, ";
				statement += "	fstrTemplateImage, ";
				statement += "	fstrFormType, ";
				statement += "	flngRepeatOffset, ";
				statement += "	flngReturnHeadersIDFK ) ";

				statement += "	SELECT ";
				//@#@# statement += "		fstrFileType, ";
				//@#@# statement += "		fstrTaxProgram, ";
				//@#@# statement += "		flngTaxYear, ";
				statement += "		fstrTaxForm, ";
				statement += "		fstrBlockTitle,";
				statement += "		( SELECT MAX(t1.flngBlock) + 1 ";
				statement += "			FROM rfrControlHeaders t1, ";
				/*
				statement += "			( SELECT fstrFileType, flngTaxYear, fstrTaxProgram, fstrTaxForm, fstrFormType FROM rfrControlHeaders WHERE idControlHeaders = " + context.Request.QueryString[ "headerID" ].ToString() + " ) t2 WHERE ";
				statement += "			t1.fstrFileType = t2.fstrFileType AND ";
				statement += "			t1.flngTaxYear = t2.flngTaxYear AND ";
				statement += "			t1.fstrTaxProgram = t2.fstrTaxProgram AND ";
				*/
				statement += "			( SELECT fstrTaxForm, fstrFormType FROM rfrControlHeaders WHERE idControlHeaders = " + context.Request.QueryString[ "headerID" ].ToString() + " ) t2 WHERE ";
				statement += "			t1.fstrTaxForm = t2.fstrTaxForm AND ";
				statement += "			t1.fstrFormType = t2.fstrFormType AND ";
				statement += "			t1.flngReturnHeadersIDFK = " + context.Request.QueryString[ "rhID" ].ToString() + " ), ";
				statement += "		fstrTable, ";
				statement += "		flngClipTop, ";
				statement += "		flngClipRight, ";
				statement += "		flngClipBottom, ";
				statement += "		flngClipLeft, ";
				statement += "		fstrTemplateImage, ";
				// toggle on repeater flag
				if( context.Request.QueryString[ "rp" ] != null && context.Request.QueryString[ "mp" ] == null )
					statement += "		'R', ";
				else if( context.Request.QueryString[ "rp" ] == null && context.Request.QueryString[ "mp" ] != null )
					statement += "		'P', ";
				// can be both
				else if( context.Request.QueryString[ "rp" ] != null && context.Request.QueryString[ "mp" ] != null )
					statement += "		'RP', ";
				else
					statement += "		'N', ";
				statement += "		flngRepeatOffset, ";
				statement += "		" + context.Request.QueryString[ "rhID" ].ToString() + " ";
				statement += "	FROM rfrControlHeaders WHERE ";
				statement += "	idControlHeaders = " + context.Request.QueryString[ "headerID" ].ToString() + ";";

				gc.DoExecute( statement );
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