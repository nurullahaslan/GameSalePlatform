using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Zteam
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "addToCart")
            {
                try
                {
                    DataTable dt = new DataTable(); // sepeti tutacagimiz bir datatable olusturuyoruz

                    if (HttpContext.Current.Session["cart"] != null)//daha önceden sepet olusturulmus mu diye sessiona bakiyoruz
                    {
                        dt = (DataTable)HttpContext.Current.Session["cart"];//session varsa  sessionu datatbale ye cast edip datatablemizi elde ediyoruz
                    }
                    else//session yok ise yani sepet daha önce olusturulup sessiona atilmamis ise dataTableyi olusturuyoruz
                    {
                        dt.Columns.Add("Order");
                        dt.Columns.Add("OYUN_ID");// DataTableye id colonunu ekliyoruz
                        dt.Columns.Add("ADI");//DataTableye isim colonunu ekliyoruz
                        dt.Columns.Add("ADET");//DataTableye fiyat colonunu ekliyoruz
                        dt.Columns.Add("FIYAT");//DataTableye adet colonunu ekliyoruz
                        dt.Columns.Add("FOTOGRAF");//DataTableye tutar colonunu ekliyoruz
                        dt.Columns.Add("ARATOPLAM");//DataTableye tutar colonunu ekliyoruz
                        //dt.Columns.Add("TOPLAM");//DataTableye tutar colonunu ekliyoruz

                    }
                    bool idCheck = false;  //Kontrol adindaki methoda gelen id  degerini gönderiyoruz
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        if (e.CommandArgument.ToString() == dt.Rows[i]["OYUN_ID"].ToString())
                        {
                            idCheck = true;
                            dt.Rows[i]["ADET"] = (Convert.ToDouble(dt.Rows[i]["ADET"].ToString()) + 1).ToString();
                            dt.Rows[i]["ARATOPLAM"] = ((Convert.ToDouble(dt.Rows[i]["ARATOPLAM"].ToString())) + (Convert.ToDouble(dt.Rows[i]["FIYAT"].ToString()))).ToString();
                            //dt.Rows[dt.Rows.Count - 1]["TOPLAM"] = ((Convert.ToDouble(dt.Rows[i]["FIYAT"].ToString())) + (Convert.ToDouble(dt.Rows[dt.Rows.Count - 1]["TOPLAM"].ToString()))).ToString();
                        }
                        
                    }
                    if (!idCheck)
                    {
                        // böylece ayni id ye sahip ürün daha önce eklendiyse ayni ürünü birdaha eklemek yerine sadece ürünnün sepeteki adetini artiracagiz
                        // Kontrol methodu ürün varsa true yoks false deger döndürüyor
                        DataRow drow = dt.NewRow();//yeni bir row (satir) olusturuluyor.

                        drow["OYUN_ID"] = e.CommandArgument.ToString();//satirin id colonuna gelen id yaziliyor.
                        drow["ADI"] = ((Label)e.Item.FindControl("lblProductName")).Text.ToString();//satirin isim colonuna gelen isim yaziliyor.
                        drow["ADET"] = 1;//satirin fiyat colonuna gelen fiyat yaziliyor.
                        drow["FIYAT"] = ((Label)e.Item.FindControl("lblPrice")).Text.ToString().TrimEnd('0').TrimEnd(',');//satirin adet colonuna gelen adet yaziliyor.
                        drow["FOTOGRAF"] = ((Label)e.Item.FindControl("lblPicture")).Text.ToString();//satirin tutar alanina gelen fiyat ile adet çarpimi  yaziliyor.
                        drow["ARATOPLAM"] = ((Label)e.Item.FindControl("lblPrice")).Text.ToString().TrimEnd('0').TrimEnd(',');
                        dt.Rows.Add(drow);//olusturulan satir tabloya ekleniyor. 
                    }
                    

                    HttpContext.Current.Session["cart"] = dt;//en son olarak olsturulan DataTable nin sayfa postback oldugunda kaybolmamasi için
                                                             // sessiona atiliyor. artik birdaki sefere session oldugu için tablo bu sessiondan alinip üzerine yazilcak
                    Response.Redirect("Cart.aspx");
                }
                catch
                {


                }
                Response.Redirect("Store.aspx");
            }
        }
    }
}