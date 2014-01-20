using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class admin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Roles.IsUserInRole(Page.User.Identity.Name, "admin") || Page.User.Identity.IsAuthenticated == false)
            Response.Redirect("~/Login.aspx");
        else
            Session["UserLogin"] = Page.User.Identity.Name;

        if (Page.User.Identity.Name == "tpo")
        {
            HyperLink4.Visible = false;
        }
    }
    protected void LoginStatus1_LoggingOut(object sender, LoginCancelEventArgs e)
    {
        Session.Abandon();
    }
}
