using System;
using System.IO;
using System.Drawing.Imaging;
using System.Web;

namespace GenKFI.utils
{
    public partial class ViewMavImg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string MavPath = "";
            string MavOff = "";
            string MavSiz = "";

            if (Request.QueryString["MavPath"] != null)
            {
                MavPath = Request.QueryString["MavPath"];
                MavOff = Request.QueryString["MavOff"];
                MavSiz = Request.QueryString["MavSiz"];
            }

            if (MavPath != "")
            {
                try
                {
                    // read the file and write the binary stream to the response

                    FileStream fs = new FileStream(MavPath, FileMode.Open, FileAccess.Read);
                    BinaryReader reader = new BinaryReader(fs);

                    fs.Position = Convert.ToInt32( MavOff );
                    int lngSize = Convert.ToInt32( MavSiz );

                    Byte[] img = reader.ReadBytes(lngSize);


                        try
                        {
                            using (var ms = new MemoryStream(img))
                            {
                                MemoryStream MemOut = new MemoryStream();
                                System.Drawing.Image NewImage;
                                NewImage = System.Drawing.Image.FromStream(ms);
                                NewImage.Save(MemOut, ImageFormat.Jpeg);
                                img = MemOut.ToArray();
                                ms.Dispose();
                                NewImage.Dispose();
                                MemOut.Dispose();
                            }
                        }
                        catch { }

                    Response.BufferOutput = true;
                    Response.Charset = "";
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);

                    Response.ContentType = "image/jpeg";                       //"image/tiff"    Ex: "image/"
                    // Response.AddHeader("content-disposition", "attachment;filename=" + filename);

                    Response.BinaryWrite(img);

                    // clean up before we leave
                    
                    reader.Close();
                    fs.Close();
                    Response.Flush();
                    Response.End();
                }
                catch (HttpException exp)
                {
                    throw new HttpException("Web exception: ", exp);
                }
                //                catch (Exception ex)
//                {
//                    throw new Exception("Image Load: ", ex);
//                }
            }

        }
    }
}