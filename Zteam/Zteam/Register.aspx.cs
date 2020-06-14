using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace Zteam
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnRegister_Click(object sender,EventArgs e)
        {
            if (pass1.Text == pass2.Text)
            {
                SqlConnection myCon = new SqlConnection("Data Source=DESKTOP-A77ORJE\\SQLEXPRESS;Initial Catalog=GAMES_SALES_PLATFORM;Integrated Security=True");
                SqlCommand myCom = new SqlCommand("Insert Into KULLANICI (ADI,EMAIL,SIFRE) values(@ADI,@EMAIL,@SIFRE)", myCon);
                myCom.Parameters.AddWithValue("@ADI", name.Text.ToString().Trim());
                myCom.Parameters.AddWithValue("@EMAIL", mail.Text.ToString().Trim());
                myCom.Parameters.AddWithValue("@SIFRE", pass1.Text.ToString().Trim());
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