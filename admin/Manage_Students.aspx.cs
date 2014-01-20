using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using System.Web.Security;

public partial class admin_Manage_Students : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void RadGrid1_GridExporting(object sender, Telerik.Web.UI.GridExportingArgs e)
    {

    }
   
         protected void RadGrid1_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            
        }



         protected void RadGrid1_DeleteCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
         {
             GridDataItem item = (GridDataItem)e.Item;
             string ID = item.GetDataKeyValue("Student_ID").ToString();
             Datbase_ClassesDataContext db = new Datbase_ClassesDataContext();

             var t = from p in db.Students
                     where p.Student_ID == ID
                     select p;
             if (t.Count() != 0)
             {
                 db.Students.DeleteAllOnSubmit(t);
                 var t1 = from x in db.Placements
                          where x.Student_ID == ID
                          select x;
                 db.Placements.DeleteAllOnSubmit(t1);
                 Roles.RemoveUserFromRole(ID, "student");
                 Membership.DeleteUser(ID,true);
                 db.SubmitChanges();
             }
         }
}