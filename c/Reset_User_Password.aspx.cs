using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class c_Reset_User_Password : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = "";
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            if (RadComboBox2.SelectedValue != null)
            {
                if (TextBox1.Text == "" || TextBox2.Text == "" || TextBox1.Text != TextBox2.Text)
                {
                    Label1.Text = "You must fill the Fields correctly :)";
                }
                else
                {
                    MembershipUser mu = Membership.GetUser(RadComboBox1.SelectedValue.ToString());
                    mu.ChangePassword(mu.ResetPassword(), TextBox1.Text);
                    Label1.Text = "Password Changed successfully :) ";
                }
            }
            else
            {
                Label1.Text = "You must select student first.. ";
            }
        }
        catch (Exception ex)
        {
            Label1.Text = ex.Message.ToString();
        }
    }
}