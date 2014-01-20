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
        if (!Roles.IsUserInRole(Page.User.Identity.Name, "student") || Page.User.Identity.IsAuthenticated == false)
            Response.Redirect("~/Login.aspx");
        else
            Session["UserLogin"] = Page.User.Identity.Name;

        Datbase_ClassesDataContext db =new  Datbase_ClassesDataContext();

        var check = (from p in db.Students
                    where p.Student_ID == Page.User.Identity.Name
                    select p.Checked).Single();
        var year = (from p in db.Students
                    where p.Student_ID == Page.User.Identity.Name
                    select p.Year).Single();
        Session["Year"] = year.ToString();

        if (check == false)
        {
            PlaceHolder1.Visible = true;
        }
        else
        {
            PlaceHolder1.Visible = false;
        }
    }
    protected void LoginStatus1_LoggingOut(object sender, LoginCancelEventArgs e)
    {
        Session.Abandon();
    }
}
