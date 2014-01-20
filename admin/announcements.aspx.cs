using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_announcements : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Datbase_ClassesDataContext db = new Datbase_ClassesDataContext();

        announcement an = new announcement();
        an.body = RadEditor1.Content;
        an.subject = TextBox1.Text;
        an.date = DateTime.Now;
        an.to = Convert.ToInt32(DropDownList1.SelectedValue);

        try
        {
            db.announcements.InsertOnSubmit(an);
            db.SubmitChanges();
            Label1.Text = "Successfully Posted";
        }
        catch (Exception ex)
        {
            Label1.Text = ex.Message.ToString();
        }
    }
}