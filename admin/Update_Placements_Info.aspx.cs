using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
public partial class admin_Update_Placements_Info : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = "";
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Datbase_ClassesDataContext db = new Datbase_ClassesDataContext();
        var check = from p in db.Placements
                    where p.Student_ID == RadComboBox1.SelectedValue.ToString()
                    && p.Placed_In == Convert.ToInt32(DropDownList1.SelectedValue)
                    select p;

        if (check.Count() == 0)
        {
            Placement pl = new Placement();
            pl.Placed_In = Convert.ToInt32(DropDownList1.SelectedValue);
            pl.Student_ID = RadComboBox1.SelectedValue.ToString();

            db.Placements.InsertOnSubmit(pl);
            try
            {
                db.SubmitChanges();
                RadGrid1.Rebind();
                Label1.Text = "Company Added Successfully :) :)";
            }
            catch (Exception ex)
            {
                Label1.Text = ex.Message.ToString();
            }

        }
        else
        {
            Label1.Text = "You have updated this already :) :)";

        }

    }
    protected void RadGrid1_DeleteCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        GridDataItem item = (GridDataItem)e.Item;
        Int32 ID = Convert.ToInt32(item.GetDataKeyValue("ID"));
        Datbase_ClassesDataContext db = new Datbase_ClassesDataContext();
        var del = (from p in db.Placements
                   where p.Student_ID == RadComboBox1.SelectedValue.ToString()
                   && p.ID == ID
                   select p).Single();
        if (del != null)
        {
            db.Placements.DeleteOnSubmit(del);
            try
            {
                db.SubmitChanges();
                RadGrid1.Rebind();
                Label1.Text = "Company Deleted Successfully :) :)";
            }
            catch (Exception ex)
            {
                Label1.Text = ex.Message.ToString();

            }
        }

    }
}