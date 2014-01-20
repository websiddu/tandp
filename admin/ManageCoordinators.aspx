<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="ManageCoordinators.aspx.cs" Inherits="admin_ManageCoordinators" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="sidebartop_placeholder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="sidebarbottom_placeholder" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="content_heading" Runat="Server">
    Manage Coordinators<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="content_placeholder" Runat="Server">
    <div style="width:600px">
    <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
    

    <h3 class="h3block">Add a Coordinator</h3>
    <table>
        <tr>
            <td>
                Coordinator ID :
            </td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
            <td style="color:Red">
                <asp:RequiredFieldValidator ControlToValidate="TextBox1"  
                    ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Required" 
                    ValidationGroup="1"></asp:RequiredFieldValidator>

            </td>
        </tr>
        <tr>
            <td>
                Coordinator Name :
            </td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </td>
            <td style="color:Red">
                <asp:RequiredFieldValidator  ControlToValidate="TextBox2"  
                    ID="RequiredFieldValidator2" runat="server" ErrorMessage="* Required" 
                    ValidationGroup="1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
               Password :
            </td>
            <td>
                <asp:TextBox ID="TextBox3"  TextMode="Password" runat="server"></asp:TextBox>
            </td>
            <td style="color:Red">
                <asp:RequiredFieldValidator ControlToValidate="TextBox3" 
                    ID="RequiredFieldValidator3" runat="server" ErrorMessage="* Required" 
                    ValidationGroup="1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
            Department :
            </td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" 
                    DataSourceID="SqlDataSource1" DataTextField="Department" DataValueField="ID">
                </asp:DropDownList> 
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:tandp_db_connection_string %>" 
                    SelectCommand="SELECT * FROM [Departments]"></asp:SqlDataSource>
            </td>
            <td style="color:Red">
            <asp:RequiredFieldValidator  ControlToValidate="DropDownList1" 
                    ID="RequiredFieldValidator4" runat="server" ErrorMessage="* Required" 
                    ValidationGroup="1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
            
            </td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Create." onclick="Button1_Click" 
                    ValidationGroup="1" />
            </td>
        </tr>
    </table>

    <h3 class="h3block_r">
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    </h3>

    <br />

    <h3 class="h3block">
        Edit Coordinator
    </h3>
    <table>
    <tr>
        <td>
            Coordinator :
        </td>
        <td>
            <asp:DropDownList ID="DropDownList2" runat="server" 
                DataSourceID="SqlDataSource2" DataTextField="Co_ID" DataValueField="Co_ID" 
                AutoPostBack="True" onselectedindexchanged="DropDownList2_SelectedIndexChanged"
                 AppendDataBoundItems="true"
                >
                <asp:ListItem Text="-Select Coordinator-" Value="0"></asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:tandp_db_connection_string %>" 
                SelectCommand="SELECT * FROM [Coordinators]"></asp:SqlDataSource>
        </td>
        <td>
            <asp:RequiredFieldValidator  ControlToValidate="DropDownList2" ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
        Name :
        </td>
        <td>
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        </td>

    </tr>
    <tr>
        <td>
        New Password :
        </td>
        <td>
            <asp:TextBox ID="TextBox5" TextMode="Password" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
        
        </td>
        <td>
            <asp:Button ID="Button2" runat="server" Text="Update" onclick="Button2_Click" />
        </td>
    </tr>
    </table>
    <h3 class="h3block_r">
        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
    </h3>
    <br />

    <h3 class="h3block">
    Delete Coordinator
    </h3>
    <div >
        <telerik:RadGrid ID="RadGrid1" runat="server" AutoGenerateDeleteColumn="True" 
            DataSourceID="SqlDataSource3" GridLines="None" 
            ondeletecommand="RadGrid1_DeleteCommand" Skin="Hay">
            <MasterTableView AutoGenerateColumns="False" DataKeyNames="Co_ID" 
                DataSourceID="SqlDataSource3">
                <CommandItemSettings ExportToPdfText="Export to Pdf" />
                <RowIndicatorColumn>
                    <HeaderStyle Width="20px" />
                </RowIndicatorColumn>
                <ExpandCollapseColumn>
                    <HeaderStyle Width="20px" />
                </ExpandCollapseColumn>
                <Columns>
                    <telerik:GridBoundColumn DataField="Co_ID" HeaderText="Co_ID" ReadOnly="True" 
                        SortExpression="Co_ID" UniqueName="Co_ID">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Name" HeaderText="Name" 
                        SortExpression="Name" UniqueName="Name">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Department" HeaderText="Department" 
                        SortExpression="Department" UniqueName="Department">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
            <HeaderContextMenu CssClass="GridContextMenu GridContextMenu_Default" 
                EnableImageSprites="True">
            </HeaderContextMenu>
        </telerik:RadGrid> 
    
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:tandp_db_connection_string %>" 
            SelectCommand="SELECT Coordinators.*, Departments.Department FROM Coordinators INNER JOIN Departments ON Coordinators.Dept = Departments.ID">
        </asp:SqlDataSource>
    
    </div>
    </telerik:RadAjaxPanel>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default">
    </telerik:RadAjaxLoadingPanel>
</div>

</asp:Content>

