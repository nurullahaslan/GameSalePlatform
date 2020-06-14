using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Zteam
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["KULLANICI_ID"] == null)
                Response.Redirect("Login.aspx");
        }
        public string DefaultFileName = "assets/";
        protected void btnSave_Click(object sender,EventArgs e)
        {
            if (pass1.Text == pass2.Text)
            {
                SqlConnection myCon = new SqlConnection("Data Source=DESKTOP-A77ORJE\\SQLEXPRESS;Initial Catalog=GAMES_SALES_PLATFORM;Integrated Security=True");
                SqlCommand myCom = new SqlCommand("UPDATE KULLANICI SET ADI=@ADI,EMAIL=@EMAIL,SIFRE=@SIFRE,FOTOGRAF=@FOTOGRAF where KULLANICI_ID=@KULLANICI_ID", myCon);
                myCom.Parameters.AddWithValue("KULLANICI_ID", Session["KULLANICI_ID"]);
                myCom.Parameters.AddWithValue("ADI", name.Text.ToString().Trim());
                myCom.Parameters.AddWithValue("EMAIL", mail.Text.ToString().Trim());
                myCom.Parameters.AddWithValue("SIFRE", pass1.Text.ToString().Trim());
                if (FileUploader.HasFile)
                    try
                    {
                        FileUploader.SaveAs(Server.MapPath(DefaultFileName) +
                             FileUploader.FileName);
                        lblUpload.Text = "File name: " +
                             FileUploader.PostedFile.FileName + "<br>" +
                             FileUploader.PostedFile.ContentLength + " kb<br>" +
                             "Content type: " +
                             FileUploader.PostedFile.ContentType + "<br><b>Uploaded Successfully";

                    }
                    catch (Exception ex)
                    {
                        lblUpload.Text = "ERROR: " + ex.Message.ToString();
                    }
                else
                {
                    lblUpload.Text = "You have not specified a file.";
                }
                myCom.Parameters.AddWithValue("FOTOGRAF",DefaultFileName.ToString().Trim() + FileUploader.FileName.ToString().Trim());
                myCon.Open();
                myCom.ExecuteNonQuery();
                myCon.Close();
                Response.Redirect("Profile.aspx");
            }
            else
                errMsg.Visible = true;
        }
    }
}