using GenKFI.Properties;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GenKFI.noFront
{
    /// <summary>
    /// Summary description for CountryLookUp
    /// </summary>
    public class CountryLookUp : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";

            string location = "";
            string Var2 = context.Request.Form["LocCode"].ToString();
            if (Var2.Length != 2)
            {
                context.Response.Write(Var2);
                return;
            }

            GoodConn gc = new GoodConn();
            try
            {

                string statement = "SELECT fstrCountryGT FROM rfrCountry WHERE ";
                statement += "fstrCountryCode = '" + context.Request.Form["LocCode"].ToString() + "';";
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
                        location = var.ToString();
                }

                gc.Disconnect();

                // and send the number back, blank if bad
                context.Response.Write(location);
            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
                context.Response.Write(location);
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