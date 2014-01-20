<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Report1.ascx.cs" Inherits="admin_reports_Report1" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<script type="text/javascript" language="javascript">
    function onItemChecked(sender, e) {
        var item = e.get_item();
        var items = sender.get_items();
        var checked = item.get_checked();
        var firstItem = sender.getItem(0);
        if (item.get_text() == "All") {
            items.forEach(function (itm) { itm.set_checked(checked); });
        }
        else {
            if (sender.get_checkedItems().length == items.get_count() - 1) {
                firstItem.set_checked(!firstItem.get_checked());
            }
        }
    }
</script>
	<style type="text/css">
	    label {
    display:inline-block;
    font-size: 13px;
    padding: 4px;
}
.rconf
{
	border: 0px solid #CCCCCC;
	border-radius:0;
	margin:0;
	line-height: 20px;
	padding: 2px;
}
input[type="text"], input[type="password"], input[type="file"], select {
	border: 1px solid #CCCCCC;
	border-radius: 3px;
	font-weight: bold;
	margin:0;
	padding: 2px;
}
</style>


<div style="padding:10px;">
	<table>
		<tr>
			<td>
            Year of <br />
				<telerik:RadComboBox ID="RadComboBox1" runat="server"  CssClass="rconf"
					DataSourceID="YearsDataSource" DataTextField="Year1" DataValueField="Year1" 
					Skin="Windows7">
                   
				</telerik:RadComboBox>
				<asp:LinqDataSource ID="YearsDataSource" runat="server" 
					ContextTypeName="Datbase_ClassesDataContext" EntityTypeName="" 
					TableName="Years">
				</asp:LinqDataSource>
			</td>
			<td>
				&nbsp;</td>
			<td>
				&nbsp;</td>
            <td>
                Percentage > 
                <telerik:RadNumericTextBox ID="RadNumericTextBox1" runat="server" 
                    MaxValue="100" MinValue="0" ShowSpinButtons="True" Width="50px">
                    <NumberFormat GroupSeparator="" />
                </telerik:RadNumericTextBox>
                <br /><br />
                No. of backlogs < 
                <telerik:RadNumericTextBox ID="RadNumericTextBox2" runat="server"
                MaxValue="100" MinValue="0" ShowSpinButtons="True" Width="50px"
                ><NumberFormat GroupSeparator="" />
                </telerik:RadNumericTextBox>

                <br />
                <br />
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                    RepeatDirection="Horizontal">
                    <asp:ListItem Value="1">Placed</asp:ListItem>
                    <asp:ListItem Value="0">NotPlaced</asp:ListItem>
                    <asp:ListItem Value="2">Any</asp:ListItem>
                </asp:RadioButtonList>
            </td>

            <td>
                <asp:Button ID="Button1" runat="server" Text="Go." onclick="Button1_Click" />
            </td>
		</tr>
	
	</table>
    <h3 class="h3block">
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    </h3>

    <br />

    <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True" 
        AllowSorting="True" GridLines="None" ShowGroupPanel="True" Skin="Hay">
        <ExportSettings FileName="sid_exported">
            <Pdf Creator="Siddhartha Gudipati" PageHeight="297mm" PageWidth="15in" 
                PaperSize="A4" Subject="Exported Data" Title="Training and Placement Cell" />
        </ExportSettings>
        <ClientSettings AllowDragToGroup="True">
            <Selecting AllowRowSelect="True" />
            <Scrolling AllowScroll="True" UseStaticHeaders="True" />
        </ClientSettings>
<MasterTableView>
<CommandItemSettings ExportToPdfText="Export to Pdf" ShowAddNewRecordButton="False" 
        ShowExportToCsvButton="True" ShowExportToWordButton="True"></CommandItemSettings>

<RowIndicatorColumn>
<HeaderStyle Width="20px"></HeaderStyle>
</RowIndicatorColumn>

<ExpandCollapseColumn>
<HeaderStyle Width="20px"></HeaderStyle>
</ExpandCollapseColumn>
</MasterTableView>

<HeaderContextMenu EnableImageSprites="True" CssClass="GridContextMenu GridContextMenu_Default"></HeaderContextMenu>
    </telerik:RadGrid>
    <br />
    <asp:Button ID="Button2" runat="server" Text="Exprot to CSV" 
        onclick="Button2_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button3" runat="server" Text="Export to Excel" 
        onclick="Button3_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button4" runat="server" Text="Export to Pdf" 
        onclick="Button4_Click" />

</div>