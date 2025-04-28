using GenKFI.Properties;
using System;
using System.Web;


namespace GenKFI.noFront
{
    /// <summary>
    /// Summary description for <see cref="LowIncTableLookup"/>
    /// </summary>
    public class LowIncTableLookup : IHttpHandler
	{

		public void ProcessRequest( HttpContext context )
		{
			string rebateVal = "";
            context.Response.ContentType = "text/plain";
            // return nothing on '0', or non integer
            if (context.Request.Form["exmpt"].ToString().Trim() == "0" ||
                !int.TryParse(context.Request.Form["exmpt"].ToString().Trim(), out int exmpt))
            {
                context.Response.Write("");
                return;
            }

            // given the taxable income, filing status, tax year and number of exemptions find the rebate on rfrPitRcLic
            GoodConn gc = new GoodConn();
			try
			{

				string statement = "SELECT CAST( ~COLUMN~ AS VARCHAR ) FROM rfrPitRcLic WHERE ";
				statement += context.Request.Form[ "taxable" ].ToString() + " > fcurLower AND ";
				statement += context.Request.Form[ "taxable" ].ToString() + " <= fcurUpper AND ";
				statement += "fstrTaxYear = '" + context.Request.Form[ "taxYear" ].ToString().Trim() + "';";
				if( exmpt >= 6 )
					statement = statement.Replace( "~COLUMN~", "fcurExmpt6" );
				else
					statement = statement.Replace( "~COLUMN~", "fcurExmpt" + exmpt.ToString() );

				// do the lookup, if needed
#if DEBUG
				gc.Connect( Resources.connString );
#else
				gc.Connect( Resources.prodConnString );
#endif

				if( statement != "" )
				{
					object var = gc.DoScalar( statement );
					if( var != null )
						rebateVal = var.ToString();
				}

				gc.Disconnect();

				// if the status is 3 (married separately)

				if( context.Request.Form[ "status" ] == "3" )
					rebateVal = ( int.Parse( rebateVal ) / 2 ).ToString();

				// and send the number back, blank if bad
				context.Response.Write( rebateVal );
			}
			catch( Exception ex )
			{
				UtilClass.RecordError( gc, ex );
				gc.Disconnect();
				context.Response.Write( "" );
			}
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