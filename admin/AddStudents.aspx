<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="AddStudents.aspx.cs" Inherits="admin_AddStudents" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="sidebartop_placeholder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="sidebarbottom_placeholder" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="content_heading" Runat="Server">
Add Students<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="content_placeholder" Runat="Server">
    <h3 class="h3block" style="margin:0px 30px 0px 0px;">Add a Student</h3>
    
  <table>
    <tbody>
        <tr>
            <td>
                Year of :
            </td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" 
                    DataSourceID="LinqDataSource1" DataTextField="Year1" DataValueField="Year1">
                </asp:DropDownList>
                <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
                    ContextTypeName="Datbase_ClassesDataContext" EntityTypeName="" 
                    TableName="Years">
                </asp:LinqDataSource>
            </td>
        </tr>
        <tr>
            <td>
                Course :
            </td>
            <td>
                <asp:DropDownList ID="DropDownList2" runat="server" 
                    DataSourceID="LinqDataSource2" DataTextField="Course1" DataValueField="ID">
                </asp:DropDownList>
                <asp:LinqDataSource ID="LinqDataSource2" runat="server" 
                    ContextTypeName="Datbase_ClassesDataContext" EntityTypeName="" 
                    TableName="Courses">
                </asp:LinqDataSource>
            </td>
        </tr>
        <tr>
            <td>
                Department :
            </td>
            <td>
                <asp:DropDownList ID="DropDownList3" runat="server" 
                    DataSourceID="LinqDataSource3" DataTextField="Department1" DataValueField="ID">
                </asp:DropDownList>
                <asp:LinqDataSource ID="LinqDataSource3" runat="server" 
                    ContextTypeName="Datbase_ClassesDataContext" EntityTypeName="" 
                    TableName="Departments">
                </asp:LinqDataSource>
            </td>
        </tr>
        <tr>
            <td>
                Student ID :
            </td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Password :
            </td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </td>
        
        </tr>
        <tr>
            <td>
                Email :
            </td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </td>
        
        </tr>
        <tr>
            <td>
            
            </td>
            <td>
            
                <asp:Button ID="Button1" runat="server" Text="Create User." 
                    onclick="Button1_Click" />
            </td>
        </tr>
    
    </tbody>
  
  </table>


        <div style="font-size:15px;margin:10px; background-color:#9CDF53; display:block;padding:10px;"><asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        </div>
        <h3>
  <asp:HyperLink ID="HyperLink1" runat="server"  NavigateUrl="~/admin/bulk_upload_students.aspx">Bulk Upload Students</asp:HyperLink>
  </h3>
</asp:Content>

