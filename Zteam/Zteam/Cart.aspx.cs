using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Zteam
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            if (HttpContext.Current.Session["cart"] != null)//daha önceden sepet olusturulmus mu diye sessiona bakiyoruz
            {
                dt = (DataTable)HttpContext.Current.Session["cart"];//session varsa  sessionu datatbale ye cast edip datatablemizi elde ediyoruz
                cartList.DataSource = dt;
                cartList.DataBind();
                decimal toplamSonuç = dt.Rows.Cast<DataRow>().Sum<DataRow>(p => decimal.Parse(p["ARATOPLAM"].ToString()));
                lblTotal.Text = toplamSonuç.ToString();
            }
            else//session yok ise yani sepet daha önce olusturulup sessiona atilmamis ise dataTableyi olusturuyoruz
            {

            }


        }

        protected void btnClick_Event(object sender, EventArgs e)
        {
            DateTime date = DateTime.Now;
            if (Session["KULLANICI_ID"] == null)
                Response.Redirect("Login.aspx");
            else
            {

                SqlConnection myCon = new SqlConnection("Data Source=DESKTOP-A77ORJE\\SQLEXPRESS;Initial Catalog=GAMES_SALES_PLATFORM;Integrated Security=True");
                SqlCommand myCom = new SqlCommand("Insert Into FATURA (TUTAR,TARIH,KULLANICI_ID) values(@TUTAR,@TARIH,@KULLANICI_ID)", myCon);
                myCom.Parameters.AddWithValue("@TUTAR", lblTotal.Text.ToString());
                myCom.Parameters.AddWithValue("@TARIH", date);
                myCom.Parameters.AddWithValue("@KULLANICI_ID", Session["KULLANICI_ID"]);
                myCon.Open();
                myCom.ExecuteNonQuery();
                myCon.Close();
                Response.Redirect("Store.aspx");
            }
        }


    }
}