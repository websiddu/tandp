<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="announcements.aspx.cs" Inherits="admin_announcements" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="sidebartop_placeholder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="sidebarbottom_placeholder" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="content_heading" Runat="Server">
    Announcements<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="content_placeholder" Runat="Server">
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default">
    </telerik:RadAjaxLoadingPanel>
    <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
   
    <div style="padding:10px">
<table>
   <tr>
    <td>
        To :
    </td>
    <td>
        <asp:DropDownList ID="DropDownList1" runat="server" 
            DataSourceID="SqlDataSource1" DataTextField="Year" DataValueField="Year">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:tandp_db_connection_string %>" 
            SelectCommand="SELECT * FROM [Years]"></asp:SqlDataSource>
    </td>
   </tr>
    <tr>
    <td>
        Subject :
    </td>
    <td>
        <asp:TextBox ID="TextBox1" runat="server" Width="615px"></asp:TextBox>
    </td>
    <td>
        <asp:RequiredFieldValidator ControlToValidate="TextBox1" ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Required"></asp:RequiredFieldValidator>
    </td>
   </tr>
     <tr>
    <td>
        &nbsp;</td>
    <td>
        <telerik:RadEditor ID="RadEditor1" runat="server"
         ImageManager-ViewPaths="~/uploads" 
    ImageManager-UploadPaths="~/uploads" 
    ImageManager-DeletePaths="~/uploads" 
        
        >
            <ExportSettings FileName="exproted">
            </ExportSettings>
            <Content>
</Content>
            <ImageManager 
            ViewPaths="~/uploads" 
        DeletePaths="~/uploads" 
        UploadPaths="~/uploads"
            />
            <DocumentManager 
              ViewPaths="~/uploads" 
        DeletePaths="~/uploads" 
        UploadPaths="~/uploads" MaxUploadFileSize="20000000" SearchPatterns="*.csv,*.pdf,*.doc,*.txt,*.docx,*.xls,*.xlsx"
            
            />
            <FlashManager UploadPaths="Uploads" />
            <SilverlightManager UploadPaths="Uploads" />
            <MediaManager UploadPaths="~/uploads/" />
            <TemplateManager UploadPaths="Uploads" />
        </telerik:RadEditor>
    </td>
   </tr>
   <tr>
    <td>
    
    </td>
    <td>
        <asp:Button ID="Button1" runat="server" Text="PostIt" onclick="Button1_Click" />
    </td>
   </tr>
</table>

<br />
<h3 class="h3block">
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
</h3>
</div>
 </telerik:RadAjaxPanel>
</asp:Content>

