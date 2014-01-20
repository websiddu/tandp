using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class s_update_academic : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void FormView1_ItemCommand(object sender, FormViewCommandEventArgs e)
    {

    }
    protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        Label1.Text = "In order to update the changes into the main database, You must ask your Dept Coordinator to confirm the changes.. ";
    }
}