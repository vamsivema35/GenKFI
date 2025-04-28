using GenKFI.Properties;
using System;
using System.Web;

namespace GenKFI.noFront
{
    /// <summary>
    /// Summary description for <see cref="RateTableLookup"/>
    /// </summary>
    public class RateTableLookup : IHttpHandler
	{

		public void ProcessRequest( HttpContext context )
		{
			string taxValue = "";
			context.Response.ContentType = "text/plain";

			// given the taxable income, filing status and tax year, find the taxValue on table rfrTaxTable
			GoodConn gc = new GoodConn();
			try
			{
				string statement = "SELECT CAST( ~COLUMN~ AS VARCHAR ) FROM rfrTaxTable WHERE ";
				statement += context.Request.Form[ "taxable" ].ToString() + " > fcurLower AND ";
				statement += context.Request.Form[ "taxable" ].ToString() + " <= fcurUpper AND ";
				statement += "fstrTaxYear = '" + context.Request.Form[ "taxYear" ].ToString() + "';";
				// if the status is 5, return same as joint
				switch( context.Request.Form[ "status" ] )
				{
					// single
					case "1":
						statement = statement.Replace( "~COLUMN~", "fcurSingle" );
						break;

					// married joint
					case "2":
					// widow(er)
					case "5":
						statement = statement.Replace( "~COLUMN~", "fcurJoint" );
						break;

					// married separate
					case "3":
						statement = statement.Replace( "~COLUMN~", "fcurSeperate" );
						break;

					// head of household
					case "4":
						statement = statement.Replace( "~COLUMN~", "fcurHeadHouse" );
						break;

					// no status, return 0
					case "0":
					default:
						statement = "";
						break;
				}
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
						taxValue = var.ToString();
				}

				gc.Disconnect();
				// and send the number back, blank if bad
				context.Response.Write( taxValue );
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