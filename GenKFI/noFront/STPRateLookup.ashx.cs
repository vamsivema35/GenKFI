using GenKFI.Properties;
using System;
using System.Web;

namespace GenKFI.noFront
{
    /// <summary>
    /// Summary description for StpRateLookup
    /// </summary>
    public class STPRateLookup : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";

            string rate = "0";

            GoodConn gc = new GoodConn();
            try
            {

                string statement = "SELECT fcurRate FROM rfrSTPRate WHERE ";
                statement += "fstrTaxProgram = '" + context.Request.Form["TaxProgram"].ToString() + "' AND '";
                statement += context.Request.Form["PeriodEnd"].ToString() + "' >= fdtmBegin AND '";
                statement += context.Request.Form["PeriodEnd"].ToString() + "' <= fdtmEnd ;";

                // do the lookup, if needed
#if DEBUG
                gc.Connect(Resources.connString);
#else
				gc.Connect( Resources.prodConnString );
#endif

                if (statement != "")
                {
                    object GetRate = gc.DoScalar(statement);
                    if (GetRate != null)
                        rate = GetRate.ToString();
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