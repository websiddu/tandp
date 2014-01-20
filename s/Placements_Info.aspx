<%@ Page Title="" Language="C#" MasterPageFile="~/student.master" AutoEventWireup="true" CodeFile="Placements_Info.aspx.cs" Inherits="s_Placements_Info" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="sidebartop_placeholder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="sidebarbottom_placeholder" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="content_heading" Runat="Server">
Placements Information<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="content_placeholder" Runat="Server">
<div style="margin:10px">
    <span style="font-size:14px"> &nbsp;</span><asp:PlaceHolder ID="PlaceHolder1" runat="server">

   

        
    
    
    </asp:PlaceHolder>
    <div style="width:400px">
<h3 class="h3block">You are placed in </h3>

    <telerik:RadGrid ID="RadGrid1" runat="server" 
        DataSourceID="SqlDataSource1" GridLines="None" Skin="Windows7" 
            ondeletecommand="RadGrid1_DeleteCommand">
<MasterTableView AutoGenerateColumns="False" DataKeyNames="ID,Student_ID,Placed_In,Expr1" 
            DataSourceID="SqlDataSource1">
<CommandItemSettings ExportToPdfText="Export to Pdf"></CommandItemSettings>

<RowIndicatorColumn>
<HeaderStyle Width="20px"></HeaderStyle>
</RowIndicatorColumn>

<ExpandCollapseColumn>
<HeaderStyle Width="20px"></HeaderStyle>
</ExpandCollapseColumn>
    <Columns>
        <telerik:GridBoundColumn DataField="ID" DataType="System.Int64" HeaderText="ID" 
            ReadOnly="True" SortExpression="ID" UniqueName="ID" Visible="false">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="Student_ID" HeaderText="Student_ID" 
            ReadOnly="True" SortExpression="Student_ID" UniqueName="Student_ID"  Visible="false">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="Placed_In" DataType="System.Int32" 
            HeaderText="Placed_In" ReadOnly="True" SortExpression="Placed_In" 
            UniqueName="Placed_In"  Visible="false">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="Expr1" DataType="System.Int32"  Visible="false"
            HeaderText="Expr1" ReadOnly="True" SortExpression="Expr1" UniqueName="Expr1">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="Company_Name" HeaderText="Company_Name" 
            SortExpression="Company_Name" UniqueName="Company_Name">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="Address" HeaderText="Address" 
            SortExpression="Address" UniqueName="Address"  Visible="false">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="Other" HeaderText="Other" 
            SortExpression="Other" UniqueName="Other"  Visible="false" >
        </telerik:GridBoundColumn>
        <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Delete" 
            Text="Delete" UniqueName="column">
        </telerik:GridButtonColumn>
    </Columns>
</MasterTableView>

<HeaderContextMenu EnableImageSprites="True" CssClass="GridContextMenu GridContextMenu_Default"></HeaderContextMenu>
    </telerik:RadGrid>



     <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:tandp_db_connection_string %>" 
        SelectCommand="SELECT Placements.ID, Placements.Student_ID, Placements.Placed_In, Companies.ID AS Expr1, Companies.Company_Name, Companies.Address, Companies.Other FROM Placements INNER JOIN Companies ON Placements.Placed_In = Companies.ID WHERE (Placements.Student_ID = @Student_ID)">
         <SelectParameters>
             <asp:SessionParameter Name="Student_ID" SessionField="UserLogin" />
         </SelectParameters>
    </asp:SqlDataSource>

    </div>

     <asp:LinqDataSource ID="LinqDataSource2" runat="server" 
        ContextTypeName="Datbase_ClassesDataContext" EntityTypeName="" 
        TableName="Placements" Where="Student_ID == @Student_ID">
         <WhereParameters>
             <asp:SessionParameter Name="Student_ID" SessionField="UserLogin" 
                 Type="String" />
         </WhereParameters>
    </asp:LinqDataSource>

    <br /><br /><br /><br /><br /><br /><br />
    <div style="width:400px">
    <h3 class="h3block" >Add Company that Offered you.. </h3>
     <table>
    <tr>
    <td>
       Company :
    </td>
        <td>
            <asp:DropDownList ID="DropDownList1" runat="server" 
                DataSourceID="LinqDataSource1" DataTextField="Company_Name" DataValueField="ID">
            </asp:DropDownList>
            <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
                ContextTypeName="Datbase_ClassesDataContext" EntityTypeName="" 
                TableName="Companies">
            </asp:LinqDataSource>
        </td>
    </tr>
    <tr>
    <td></td>
    <td>
        <asp:Button ID="Button1" runat="server" Text="Add" onclick="Button1_Click" />
        </td>
    </tr>
    </table>
    </div>
    <div style= "padding:8px; margin:20px; color:#fff; background-color:#EF6868;font-size:15px; display:block;">
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    </div>
    
</div>

</asp:Content>

