using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using System.Collections;

public partial class admin_reports_Report1 : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = "";
        if (IsPostBack)
        {
            drawgrid();
        }
        Button4.Visible = false;
        Button2.Visible = false;
        Button3.Visible = false;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        drawgrid();
    }

    private void drawgrid()
    {
        if (Validation() == true)
        {
            Button4.Visible = true;
            Button2.Visible = true;
            Button3.Visible = true;



            Double per = Convert.ToDouble(RadNumericTextBox1.Text);
            Int32 placemnets = Convert.ToInt32(RadioButtonList1.SelectedValue);
            Datbase_ClassesDataContext db = new Datbase_ClassesDataContext();
            if (placemnets == 2)
            {
                var std = from p in db.Students
                          where
                          p.Year == Convert.ToInt32(RadComboBox1.SelectedValue)
                          && p.Overall >= Convert.ToInt32(RadNumericTextBox1.Text)
                          && p.total_baklogs <= Convert.ToInt32(RadNumericTextBox2.Text)
                          && p.Department == Convert.ToInt32(Session["Department"].ToString())
                          select new
                          {
                              Stud_ID = p.Student_ID,
                              Name = p.First_Name + " " + p.Last_Name,
                              Course = p.Course1.Course1,
                              Dept = p.Department1.Department1,
                              Email = p.Email,
                              Percentage = p.Overall,
                              Backlogs = p.total_baklogs,
                              SSC = p.tenth,
                              Inter = p.Inter,
                              Grad = p.Eamcet_Rank
                          };

                RadGrid1.DataSource = std;
                RadGrid1.DataBind();
            }
            if (placemnets == 1)
            {
                var placed_stds = (from p in db.Placements
                                   select p.Student_ID).Distinct();
                var std1 = from p in db.Students
                           where
                            placed_stds.Contains(p.Student_ID)
                           && p.Year == Convert.ToInt32(RadComboBox1.SelectedValue)
                           && p.Overall >= Convert.ToInt32(RadNumericTextBox1.Text)
                           && p.total_baklogs <= Convert.ToInt32(RadNumericTextBox2.Text)
                           && p.Department == Convert.ToInt32(Session["Department"].ToString())
                           select new
                           {
                               Stud_ID = p.Student_ID,
                               Name = p.First_Name + " " + p.Last_Name,
                               Course = p.Course1.Course1,
                               Dept = p.Department1.Department1,
                               Email = p.Email,
                               Percentage = p.Overall,
                               Backlogs = p.total_baklogs,
                               SSC = p.tenth,
                               Inter = p.Inter,
                               Grad = p.Eamcet_Rank

                           };
                RadGrid1.DataSource = std1;
                RadGrid1.DataBind();
            }
            if (placemnets == 0)
            {
                var placed_stds1 = (from p in db.Placements
                                    select p.Student_ID).Distinct();
                var std2 = from p in db.Students
                           where
                            !placed_stds1.Contains(p.Student_ID)
                           && p.Year == Convert.ToInt32(RadComboBox1.SelectedValue)
                           && p.Overall >= Convert.ToInt32(RadNumericTextBox1.Text)
                           && p.total_baklogs <= Convert.ToInt32(RadNumericTextBox2.Text)
                           && p.Department == Convert.ToInt32(Session["Department"].ToString())
                           select new
                           {
                               Stud_ID = p.Student_ID,
                               Name = p.First_Name + " " + p.Last_Name,
                               Course = p.Course1.Course1,
                               Dept = p.Department1.Department1,
                               Email = p.Email,
                               Percentage = p.Overall,
                               Backlogs = p.total_baklogs,
                               SSC = p.tenth,
                               Inter = p.Inter,
                               Grad = p.Eamcet_Rank

                           };
                RadGrid1.DataSource = std2;
                RadGrid1.DataBind();
            }




        }
        else
        {

            Label1.Text = "Fill all the fields Correctly :) ";
        }
    }

    protected Boolean Validation()
    {
   


        if (RadNumericTextBox1.Text == "" || RadioButtonList1.SelectedValue == "" || RadNumericTextBox2.Text == "")
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