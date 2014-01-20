using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

public partial class admin_Edit_Student : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    protected void FormView1_ItemUpdated1(object sender, FormViewUpdatedEventArgs e)
    {
        Label1.Text = "Updated Successfully";
    }
    protected void RadComboBox1_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
    {
        
    }
    protected void RadComboBox2_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
    {
        RadComboBox1.DataBind();
    }
}