using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class s_Update_info : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {

    }
    protected void FormView1_ItemUpdated1(object sender, FormViewUpdatedEventArgs e)
    {
        Label1.Text = "Updated Successfully";
    }
}