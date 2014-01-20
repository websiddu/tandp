using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class c_Confirm_Std_Changes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Datbase_ClassesDataContext db = new Datbase_ClassesDataContext();
      
        try
        {
            var std = (from p in db.Students
                      where p.Student_ID == RadComboBox1.SelectedValue
                      select p).Single();
            std.Checked = true;
            std.TimeStamp = DateTime.Now;
            db.SubmitChanges();
            Label6.Text = "The Details of " + RadComboBox1.SelectedValue.ToString() + " Confirmed!! Successfully entered in to the Database..";

        }
        catch (Exception ex)
        {
            Label6.Text = ex.Message.ToString();
        }

    }
}