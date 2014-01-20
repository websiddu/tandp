using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class s_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        doit();
    }

    private void doit()
    {
        Datbase_ClassesDataContext db = new Datbase_ClassesDataContext();

        try
        {

            var back_logs = (from p in db.Students
                             where p.Student_ID == Session["UserLogin"]
                             select p.total_baklogs).Single();
            var over = (from p in db.Students
                        where p.Student_ID == Session["UserLogin"]
                        select p.Overall).Single();

            Label1.Text = over.ToString();
            Label2.Text = back_logs.ToString();


        }
        catch (Exception ex)
        {
            Label1.Text = ex.Message.ToString();
        }
    }
}