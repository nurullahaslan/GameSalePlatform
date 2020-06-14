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
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            SqlConnection myCon = new SqlConnection("Data Source=DESKTOP-A77ORJE\\SQLEXPRESS;Initial Catalog=GAMES_SALES_PLATFORM;Integrated Security=True");
            SqlCommand myCom = new SqlCommand("Select * From KULLANICI Where EMAIL = @EMAIL and SIFRE = @SIFRE", myCon);
            myCom.Parameters.AddWithValue("EMAIL", mail.Text.ToString().Trim());
            myCom.Parameters.AddWithValue("SIFRE", pass.Text.ToString().Trim());
            myCon.Open();
            SqlDataReader myReader = myCom.ExecuteReader();
            if (myReader.Read())
            {
                if (myReader["EMAIL"].ToString() == mail.Text.ToString())
                {
                    Session.Add("KULLANICI_ID", myReader["KULLANICI_ID"].ToString());
                    Response.Redirect("Store.aspx");
                }
            }
            myCon.Close();
        }
    }
}