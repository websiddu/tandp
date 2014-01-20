using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class student_communication_Compose : System.Web.UI.Page
{
    Datbase_ClassesDataContext db = new Datbase_ClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.User.Identity.IsAuthenticated == false)
            Response.Redirect("~/Login.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        if (RadComboBox1.SelectedValue.ToString() == Session["UserLogin"].ToString())
        {
            Label1.Text = "You cannot send the message to your self";
        }
        else
        {
            try
            {
                private_messaging pm = new private_messaging();
                pm.To = "admin";
                pm.From = Page.User.Identity.Name.ToString();
                pm.Body = RadEditor1.Content;
                pm.Status = false;
                pm.Received = DateTime.Now;
                pm.Subject = RadTextBox1.Text;
                db.private_messagings.InsertOnSubmit(pm);
                db.SubmitChanges();
                Label1.Text = "Successfully Sent!!! Now you can close the window!!";

            }
            catch (Exception ex)
            {

                Label1.Text = "Fill all the Details Correctly..";
            }
        }
    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        /*
        if (RadioButtonList1.SelectedIndex == 0)
        {
            var databound = from p in db.studfulldetails
                            select p.Stud_ID;
            RadComboBox1.DataSource = databound;
            //RadComboBox1.DataTextField = "Stud_ID";
            //RadComboBox1.DataValueField = "Stud_ID";
            RadComboBox1.DataBind();
            
            
        }
        if (RadioButtonList1.SelectedIndex == 1)
        {
            var databound = from p in db.faculties
                            select p.Facultyid;
            RadComboBox1.DataSource = databound;
           // RadComboBox1.DataTextField = "Facultyid";
            //RadComboBox1.DataValueField = "Facultyid";
            RadComboBox1.DataBind();
            
        }
        if (RadioButtonList1.SelectedIndex == 2)
        {
            var databound = from p in db.studfulldetails
                            select "p_" + p.Stud_ID;
            RadComboBox1.DataSource = databound;
            // RadComboBox1.DataTextField = "Facultyid";
            //RadComboBox1.DataValueField = "Facultyid";
            RadComboBox1.DataBind();

        }*/

       
    }
}