using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Zteam
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["KULLANICI_ID"] != null)
                notLoggedIn.Visible = false;   

        }
        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            Session.Remove("KULLANICI_ID");
            Response.Redirect("Store.aspx");
        }

    }
}