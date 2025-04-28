using GenKFI.Properties;
using System;
using System.Web;

namespace GenKFI.noFront
{
    /// <summary>
    /// Summary description for WDTRateLookup
    /// </summary>
    public class WDTRateLookup : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";

            string rate = "0";

            GoodConn gc = new GoodConn();
            try
            {
                string statement = "SELECT fcurRate FROM rfrWdtRate WHERE '";
                statement += context.Request.Form["WDTPeriodEnd"].ToString() + "' >= fdtmBegin AND '";
                statement += context.Request.Form["WDTPeriodEnd"].ToString() + "' <= fdtmEnd AND ";
                statement += "fblnType = '" + context.Request.Form["OneWay"].ToString() + "' AND ";
                statement += "fintWtClass = '" + context.Request.Form["WeightClass"].ToString() + "';";

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
                    {
                        rate = var.ToString();
//                        rate = (Convert.ToDouble(var) / 100.0).ToString();
                    }
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