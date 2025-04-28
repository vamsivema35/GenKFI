using GenKFI.Properties;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GenKFI.noFront
{
    /// <summary>
    /// Summary description for CRSRateLookup
    /// </summary>
    public class CRSRateLookup : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";

            string rate = "0";
            string location = context.Request.Form["LocCode"].ToString();

            location = location.Replace("-", "");

            GoodConn gc = new GoodConn();
            try
            {
                string statement = "SELECT fcurRate FROM rfrCrsRate WHERE '";
                statement += context.Request.Form["CRSPeriodEnd"].ToString() + "' >= fdtmStart AND '";
                statement += context.Request.Form["CRSPeriodEnd"].ToString() + "' <= fdtmEnd AND ";
                statement += "fstrRateType = '" + context.Request.Form["RateType"].ToString() + "' AND ";
                statement += "fstrLocation = '" + location + "';";

                // do the lookup, if needed
#if DEBUG
                gc.Connect(Resources.connString);
#else
				gc.Connect( Resources.prodConnString );
#endif

                if (statement != "")
                {
                    object var = gc.DoScalar(statement);
                    if (var != null)
                        rate = var.ToString();
                }

                gc.Disconnect();


                // and send the number back, blank if bad
                context.Response.Write(rate);
            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
                context.Response.Write(rate);
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