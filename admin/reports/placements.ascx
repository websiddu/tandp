<%@ Control Language="C#" AutoEventWireup="true" CodeFile="placements.ascx.cs" Inherits="admin_reports_placements" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<div style="padding:10px">
<table>
    <tr>
        <td>
            Year :
        </td>
        <td>
            <telerik:RadComboBox ID="RadComboBox1" runat="server" 
                DataSourceID="SqlDataSource1" DataTextField="Year" DataValueField="Year" 
                Skin="Windows7">
            </telerik:RadComboBox>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:tandp_db_connection_string %>" 
                SelectCommand="SELECT [Year] FROM [Years]"></asp:SqlDataSource>
        </td>
        <td>
            Selected In:
        </td>
        <td>
            <telerik:RadListBox ID="RadListBox1" runat="server" DataKeyField="ID" 
                DataSortField="Company_Name" DataSourceID="SqlDataSource2" 
                DataTextField="Company_Name" DataValueField="ID" Skin="Windows7"

                onclientitemchecked="onItemChecked"
					  AppendDataBoundItems="true" CheckBoxes="True" style="top: 0px; left: 0px; width: 273px"
                    
                    >
                      <Items>
                        <telerik:RadListBoxItem runat="server" Text="All" Value="0" />
                    </Items>
            </telerik:RadListBox>  
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:tandp_db_connection_string %>" 
                SelectCommand="SELECT * FROM [Companies]"></asp:SqlDataSource>
        </td>
        <td>
            <asp:Button ID="Button1" runat="server" Text="Go." onclick="Button1_Click" />
        </td>
    </tr>
</table>
<br />
<br />
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