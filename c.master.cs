using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class c : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Roles.IsUserInRole(Page.User.Identity.Name, "dc") || Page.User.Identity.IsAuthenticated == false)
            Response.Redirect("~/Login.aspx");
        else
            Session["UserLogin"] = Page.User.Identity.Name;

        Datbase_ClassesDataContext db = new Datbase_ClassesDataContext();
        try
        {
            var dept = (from p in db.Coordinators
                        where p.Co_ID == Page.User.Identity.Name
                        select p.Dept).Single();
            Session["Department"] = dept;
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message.ToString());
        }

    }
    protected void LoginStatus1_LoggingOut(object sender, LoginCancelEventArgs e)
    {
        Session.Abandon();
    }
}
