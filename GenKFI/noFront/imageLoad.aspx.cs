using System;
using System.IO;
using System.Drawing.Imaging;
using System.Web;


namespace GenKFI.noFront
{
    //@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
    //@#@# from http://www.aspsnippets.com/Articles/Displaying-images-that-are-stored-outside-the-Website-Root-Folder.aspx
    //@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#

    public partial class imageLoad : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string fName = "";



            if (Request.QueryString["fName"] != null)
                fName = Request.QueryString["fName"];
            else if (Session["kestrImagePath"] != null)
                fName = Session["kestrImagePath"].ToString();

            if (fName != "")
            {
                try
                {
                    // read the file and write the binary stream to the response

                    FileStream fs = new FileStream(fName, FileMode.Open, FileAccess.Read);
                    BinaryReader reader = new BinaryReader(fs);

                    int lngSize = (Int32)fs.Length;
                    int lngPosition = (Int32)fs.Position;

                    if (Convert.ToString(Session["mvImgSrc"]) == "MAVRO")
                    {
                        fs.Position = Convert.ToInt32(Session["mvOffset"]);
                        lngSize = Convert.ToInt32(Session["mvSize"]);
                    }

                    byte[] img = reader.ReadBytes(lngSize);

                    if (Convert.ToString(Session["mvImgSrc"]) == "MAVRO")
                    {
                        
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
                    }

                    Response.BufferOutput = true;
                    Response.Charset = "";
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Response.ContentType = "image/jpeg";                       //"image/tiff"    Ex: "image/"

                    Response.BinaryWrite(img);

                    // clean up before we leave
                    
                    reader.Close();
                    fs.Close();
                    reader.Dispose();
                    fs.Dispose();
                    Response.Flush();
                    Response.End();
                }
                catch (HttpException exp)
                {
                    throw new HttpException("Web exception: ", exp);
                }
                //catch( Exception ex )
                //{
                //       throw new Exception("Image Load: ", ex);
                //}
            }
        }
    }
}