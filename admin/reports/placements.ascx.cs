using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

public partial class admin_reports_placements : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            drawgrid();
        }
        Button2.Visible = false;
        Button3.Visible = false;
        Button4.Visible = false;

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        drawgrid();
    }
    private void drawgrid()
    {
        Button2.Visible = true;
        Button3.Visible = true;
        Button4.Visible = true;

        if (Validation() == true)
        {
            IList<RadListBoxItem> companies = RadListBox1.CheckedItems;
            int[] cmpns = new int[companies.Count];
            Int32 i = 0;
            foreach (RadListBoxItem item in companies)
            {
                cmpns[i] = Convert.ToInt32(item.Value);
                i++;
            }

            Datbase_ClassesDataContext db = new Datbase_ClassesDataContext();
            var std = from p in db.Placements
                      where
                      cmpns.Contains(p.Placed_In)
                      && p.Student.Year == Convert.ToInt32(RadComboBox1.SelectedValue)
                      select new {
                          Stud_ID = p.Student_ID,
                          Name = p.Student.First_Name + " " + p.Student.Last_Name,
                          PlacedIn = p.Company.Company_Name,
                          Course = p.Student.Course1.Course1,
                          Dept = p.Student.Department1.Department1,
                          Email = p.Student.Email,
                          Percentage = p.Student.Overall,
                          Backlogs = p.Student.total_baklogs,
                          SSC = p.Student.tenth,
                          Inter = p.Student.Inter,
                          Grad = p.Student.Eamcet_Rank
                      
                      
                      };

            RadGrid1.DataSource = std;
            RadGrid1.DataBind();

        }
        else
        {

            Label1.Text = "Fill all the fields correctly..";
        }
    }
    private Boolean Validation()
    {
        IList<RadListBoxItem> companies = RadListBox1.CheckedItems;

        if (companies.Count == 0)
        {
            return false;
        }
        else
        {
            return true;
        }


    }

    protected void Button2_Click(object sender, EventArgs e)
    {

        RadGrid1.ExportSettings.ExportOnlyData = true;
        RadGrid1.ExportSettings.IgnorePaging = true;
        RadGrid1.ExportSettings.OpenInNewWindow = true;
        try
        {
            RadGrid1.MasterTableView.ExportToCSV();
        }
        catch (Exception ex)
        {
            Label1.Text = "No Data in the grid to Export :(";
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {

        RadGrid1.ExportSettings.ExportOnlyData = true;
        RadGrid1.ExportSettings.IgnorePaging = true;
        RadGrid1.ExportSettings.OpenInNewWindow = true;
        try
        {
            RadGrid1.MasterTableView.ExportToExcel();
        }
        catch (Exception ex)
        {
            Label1.Text = "No Data in the grid to Export :(";
        }
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        try
        {
            RadGrid1.ExportSettings.ExportOnlyData = true;
            RadGrid1.ExportSettings.IgnorePaging = true;
            RadGrid1.ExportSettings.OpenInNewWindow = true;

            RadGrid1.MasterTableView.ExportToPdf();
        }
        catch (Exception ex)
        {
            Label1.Text = "No Data in the grid to Export :(";
        }
    }
}