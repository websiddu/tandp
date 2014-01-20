using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using Telerik.Web.UI;
public partial class admin_ManageCoordinators : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
  
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            // Create new user.

            MembershipUser newUser = Membership.CreateUser( TextBox1.Text, TextBox3.Text);
            Roles.AddUserToRole(TextBox1.Text, "dc");
            Datbase_ClassesDataContext db = new Datbase_ClassesDataContext();
            Coordinator cd = new Coordinator();
            cd.Dept = Convert.ToInt32(DropDownList1.SelectedValue);
            cd.Co_ID = TextBox1.Text;
            cd.Name = TextBox2.Text;
            db.Coordinators.InsertOnSubmit(cd);
            db.SubmitChanges();

            Label1.Text = "Coordinator Create Successfully";
        }
        catch (MembershipCreateUserException e1)
        {
            Label1.Text = GetErrorMessage(e1.StatusCode);
        }
        catch (HttpException e2)
        {
            Label1.Text = e2.Message;
        }

    }

    public string GetErrorMessage(MembershipCreateStatus status)
    {
        switch (status)
        {
            case MembershipCreateStatus.DuplicateUserName:
                return "Username already exists. Please enter a different user name.";

            case MembershipCreateStatus.DuplicateEmail:
                return "A username for that e-mail address already exists. Please enter a different e-mail address.";

            case MembershipCreateStatus.InvalidPassword:
                return "The password provided is invalid. Please enter a valid password value.";

            case MembershipCreateStatus.InvalidEmail:
                return "The e-mail address provided is invalid. Please check the value and try again.";

            case MembershipCreateStatus.InvalidAnswer:
                return "The password retrieval answer provided is invalid. Please check the value and try again.";

            case MembershipCreateStatus.InvalidQuestion:
                return "The password retrieval question provided is invalid. Please check the value and try again.";

            case MembershipCreateStatus.InvalidUserName:
                return "The user name provided is invalid. Please check the value and try again.";

            case MembershipCreateStatus.ProviderError:
                return "The authentication provider returned an error. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

            case MembershipCreateStatus.UserRejected:
                return "The user creation request has been canceled. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

            default:
                return "An unknown error occurred. Please verify your entry and try again. If the problem persists, please contact your system administrator.";
        }
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        Datbase_ClassesDataContext db = new Datbase_ClassesDataContext();
        var deta = (from p in db.Coordinators
                    where p.Co_ID == DropDownList2.SelectedValue
                    select p).Single();
        if (deta != null)
        {
            TextBox4.Text = deta.Name.ToString();
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Datbase_ClassesDataContext db = new Datbase_ClassesDataContext();
        var deta = (from p in db.Coordinators
                    where p.Co_ID == DropDownList2.SelectedValue
                    select p).Single();
        if (TextBox5.Text == "" && TextBox4.Text != deta.Name.ToString())
        {
            deta.Name = TextBox4.Text.ToString();
            db.SubmitChanges();

        }
        else
        {
            MembershipUser mu = Membership.GetUser(DropDownList2.SelectedValue.ToString());
            mu.ChangePassword(mu.ResetPassword(), TextBox1.Text);
            deta.Name = TextBox4.Text.ToString();
            db.SubmitChanges();
            Label2.Text = "Updated Changed successfully :) ";
        }
    }
    protected void RadGrid1_DeleteCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        GridDataItem item = (GridDataItem)e.Item;
        string ID = item.GetDataKeyValue("Co_ID").ToString();
        Datbase_ClassesDataContext db = new Datbase_ClassesDataContext();

        var t = from p in db.Coordinators
                where p.Co_ID == ID
                select p;
        if (t.Count() != 0)
        {
            db.Coordinators.DeleteAllOnSubmit(t);
            Roles.RemoveUserFromRole(ID, "dc");
            Membership.DeleteUser(ID, true);
            db.SubmitChanges();
        }
    }
}