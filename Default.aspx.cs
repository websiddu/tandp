using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


        if (Roles.IsUserInRole(User.Identity.Name, "admin"))
        {
            Response.Redirect("~/admin/Default.aspx");
        }
        if (Roles.IsUserInRole(User.Identity.Name, "student"))
        {
            Response.Redirect("~/s/Default.aspx");
        }
        if (Roles.IsUserInRole(User.Identity.Name, "dc"))
        {
            Response.Redirect("~/c/Default.aspx");
        }
        if (User.Identity.IsAuthenticated == false)
            Server.Transfer("~/Login.aspx");
    }
}