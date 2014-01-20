using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Telerik.Web.UI;

public partial class admin_communication_privatemessage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = "";
        if (!IsPostBack)
        {
            
            //RadGrid1.Rebind();
           // SelectFirstGridRow();

        }
        RadTreeView1.Nodes[0].Text = Page.User.Identity.Name.ToString();
    }
    protected void RadGrid1_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
    {

    }
    private void SelectFirstGridRow()
    {
        GridDataItem firstDataItem = RadGrid1.Items.OfType<GridDataItem>().FirstOrDefault();
        if (firstDataItem != null)
            firstDataItem.Selected = true;
    }

    protected void RadTreeView1_NodeClick(object sender, RadTreeNodeEventArgs e)
    {
    
            if (e.Node.Text == "OutBox")
        {
            RadGrid1.DataSourceID = "LinqDataSource2";
            foreach (GridColumn column in RadGrid1.MasterTableView.RenderColumns)
            {
                if (column is GridBoundColumn && column.UniqueName == "From")
                {
                    column.HeaderText = "To";
                    column.SortExpression = "To";
                    ((GridBoundColumn)column).DataField = "To";
                }
            }
            RadGrid1.Rebind();
        }
        if (e.Node.Text == "Inbox")
        {
            RadGrid1.DataSourceID = "LinqDataSource1";
            foreach (GridColumn column in RadGrid1.MasterTableView.RenderColumns)
            {
                if (column is GridBoundColumn && column.UniqueName == "From")
                {
                    column.HeaderText = "From";
                    column.SortExpression = "From";
                    ((GridBoundColumn)column).DataField = "From";
                }
            }
            RadGrid1.Rebind();
        }
        
            
        //SelectFirstGridRow();

    }
    protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
    {
        if (e.Item is GridDataItem)
        {
            //Get the instance of the right type
            GridDataItem dataBoundItem = e.Item as GridDataItem;

            //Check the formatting condition
            if (dataBoundItem.Cells[4].Text == "False")
            {
                dataBoundItem.CssClass = "unread";
            }
          
        }
       // RadGrid1.Rebind();

    }
    protected void RadGrid1_SelectedIndexChanged(object sender, EventArgs e)
    {
       
        try
        {
            String msg_id = "";
            String frm ="";
            String id = "";
            GridItemCollection items = RadGrid1.SelectedItems;
            foreach (GridItem item in items)
            {
                msg_id = item.Cells[3].Text;
                frm = item.Cells[5].Text;
                id = item.Cells[1].Text;
                if (frm != Page.User.Identity.Name.ToString())
                {
                    item.CssClass = "none";
                }
            }
            Datbase_ClassesDataContext db = new Datbase_ClassesDataContext();

            if (frm != Page.User.Identity.Name.ToString())
            {
                var selected = (from p in db.private_messagings
                                where p.MessageID == Convert.ToInt32(msg_id)
                                select p).Single();
            
                selected.Status = true;
                db.SubmitChanges();
            }
            
            //RadGrid1.Rebind();

        }
        catch (Exception ex) {
            Label1.Text = ex.Message.ToString();
        
        }

    }
   
}