using GenKFI.Properties;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GenKFI.noFront
{
    /// <summary>
    /// Summary description for CRSLocationLookup
    /// </summary>
    public class CRSLocationLookup : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";

            string location = "";

            GoodConn gc = new GoodConn();
            try
            {

                string statement = "SELECT fstrLocation FROM rfrCRSLocation WHERE ";
                statement += "fstrLocationCode = '" + context.Request.Form[ "LocCode" ].ToString() + "';";
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