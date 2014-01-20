using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

public partial class admin_Setup_Primary_Data : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void RadGrid1_ItemUpdated(object source, GridUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.KeepInEditMode = true;
            e.ExceptionHandled = true;
            DisplayMessage_f("Course " + e.Item["ID"].Text + " cannot be updated. Reason: " + e.Exception.Message);
        }
        else
        {
            DisplayMessage_s("Course " + e.Item["ID"].Text + " updated");
        }

        
    }

    protected void RadGrid1_ItemInserted(object source, GridInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            e.KeepInInsertMode = true;
            DisplayMessage_f("Course cannot be inserted. Reason: " + e.Exception.Message);
        }
        else
        {
            DisplayMessage_s("Product inserted");
        }
    }

    protected void RadGrid1_ItemDeleted(object source, GridDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            DisplayMessage_f("Course " + e.Item["ID"].Text + " cannot be deleted. Reason: " + e.Exception.Message);
        }
        else
        {
            DisplayMessage_s("Course " + e.Item["ID"].Text + " deleted");
        }
    }

    private void DisplayMessage_s(string text)
      {
          string sid = "<span class='grid_msg'>" + text + "</sapn>";
           RadGrid1.Controls.Add(new LiteralControl(sid));
    
      }

    private void DisplayMessage_f(string text)
    {
        string sid = "<span class='grid_msg_f'>" + text + "</sapn>";
        RadGrid1.Controls.Add(new LiteralControl(sid));

    }
    private void DisplayMessage_s_2(string text)
    {
        string sid = "<span class='grid_msg'>" + text + "</sapn>";
        RadGrid2.Controls.Add(new LiteralControl(sid));

    }

    private void DisplayMessage_f_2(string text)
    {
        string sid = "<span class='grid_msg_f'>" + text + "</sapn>";
        RadGrid2.Controls.Add(new LiteralControl(sid));

    }

    private void DisplayMessage_s_3(string text)
    {
        string sid = "<span class='grid_msg'>" + text + "</sapn>";
        RadGrid3.Controls.Add(new LiteralControl(sid));

    }

    private void DisplayMessage_f_3(string text)
    {
        string sid = "<span class='grid_msg_f'>" + text + "</sapn>";
        RadGrid3.Controls.Add(new LiteralControl(sid));

    }


    protected void RadGrid2_ItemUpdated(object source, GridUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.KeepInEditMode = true;
            e.ExceptionHandled = true;
            DisplayMessage_f_2("Course " + e.Item["ID"].Text + " cannot be updated. Reason: " + e.Exception.Message);
        }
        else
        {
            DisplayMessage_s_2("Course " + e.Item["ID"].Text + " updated");
        }


    }

    protected void RadGrid2_ItemInserted(object source, GridInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            e.KeepInInsertMode = true;
            DisplayMessage_f_2("Department cannot be inserted. Reason: " + e.Exception.Message);
        }
        else
        {
            DisplayMessage_s_2("Department inserted");
        }
    }

    protected void RadGrid2_ItemDeleted(object source, GridDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            DisplayMessage_f_2("Department " + e.Item["ID"].Text + " cannot be deleted. Reason: " + e.Exception.Message);
        }
        else
        {
            DisplayMessage_s_2("Department " + e.Item["ID"].Text + " deleted");
        }
    }





    protected void RadGrid3_ItemUpdated(object source, GridUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.KeepInEditMode = true;
            e.ExceptionHandled = true;
            DisplayMessage_f_3("Year " + e.Item["Year1"].Text + " cannot be updated. Reason: " + e.Exception.Message);
        }
        else
        {
            DisplayMessage_s_3("Year " + e.Item["Year1"].Text + " updated");
        }


    }

    protected void RadGrid3_ItemInserted(object source, GridInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            e.KeepInInsertMode = true;
            DisplayMessage_f_3("Year cannot be inserted. Reason: " + e.Exception.Message);
        }
        else
        {
            DisplayMessage_s_3("Year inserted");
        }
    }

    protected void RadGrid3_ItemDeleted(object source, GridDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            DisplayMessage_f_3("Year " + e.Item["Year1"].Text + " cannot be deleted. Reason: " + e.Exception.Message);
        }
        else
        {
            DisplayMessage_s_3("Year " + e.Item["Year1"].Text + " deleted");
        }
    }
}