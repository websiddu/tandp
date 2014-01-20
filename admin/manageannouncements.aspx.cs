using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

public partial class admin_manageannouncements : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void RadGrid2_DeleteCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {

        GridDataItem item = (GridDataItem)e.Item;
        string ID = item.GetDataKeyValue("ID").ToString();
        Datbase_ClassesDataContext db = new Datbase_ClassesDataContext();

        var t = from p in db.announcements
                where p.ID == Convert.ToInt32(ID)
                select p;
        try
        {
            if (t.Count() != 0)
            {
                db.announcements.DeleteAllOnSubmit(t);
            }
            db.SubmitChanges();

            Label1.Text = "Deleted the announcement ID " + ID;

        }
        catch (Exception ex)
        {
            Label1.Text = ex.Message.ToString();
        }
    }
}