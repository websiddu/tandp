using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;


public partial class admin_communication_Reply : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.User.Identity.IsAuthenticated == false)
            Response.Redirect("~/login.aspx");

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Datbase_ClassesDataContext db = new Datbase_ClassesDataContext();
        private_messaging pm = new private_messaging();

        pm.Body = RadEditor1.Content;
        pm.From = Page.User.Identity.Name.ToString();
        pm.To = RadTextBox1.Text;
        pm.Subject = "RE :" + RadTextBox2.Text;
        pm.Status = false;
        pm.Received = DateTime.Now;
        try
        {
            db.private_messagings.InsertOnSubmit(pm);
            db.SubmitChanges();
            Label1.Text = "Successfully Sent You can close the window now!";
        }
        catch (Exception ex)
        {
            Label1.Text = ex.Message.ToString();
        }

    }
}