<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Compose.aspx.cs" Inherits="admin_communication_Compose" %>

<%@ Register TagPrefix="telerik" Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Compose a Personal Mail</title>
</head>
<body style="font-family:Trebuchet MS,Verdana; font-size:12px;">
    
    
	<form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
    <div style="float:left;">
    <table>
    <tr>
    <td>
    To :
    </td>
    
        <td>
            &nbsp;</td>
            <td>
            <telerik:RadComboBox ID="RadComboBox1" runat="server" MarkFirstMatch="True" 
                    Filter="Contains" DataSourceID="SqlDataSource1" DataTextField="Student_ID" 
                    DataValueField="Student_ID" Skin="Windows7"
                   EmptyMessage = "Select a Student"
                 EnableAutomaticLoadOnDemand="true"
                     Height="300px"
                      ShowMoreResultsBox ="true"
                    >
        </telerik:RadComboBox>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:tandp_db_connection_string %>" 
                    SelectCommand="SELECT Student_ID FROM [Students] ">
                </asp:SqlDataSource>
        </td>
        <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2"  ControlToValidate="RadComboBox1" runat="server" ErrorMessage="To address is required.."></asp:RequiredFieldValidator>
        </td>
        </tr>
        <tr>
            <td>
            Subject :
            </td>
            <td colspan="2">
                <telerik:RadTextBox ID="RadTextBox1" runat="server" Width="500px">
                </telerik:RadTextBox>
                </td>
               <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="RadTextBox1" runat="server" 
                    ErrorMessage="Subject field is required."></asp:RequiredFieldValidator>
            </td>
        </tr>
        </table>
        
    </div>
    <div style="clear:both">
	<telerik:radeditor id="RadEditor1" width="800px" height="300px"
		runat="server" imagemanager-viewpaths="~/Uploads/Uploads/Img" imagemanager-uploadpaths="~/Uploads/Img"
		imagemanager-deletepaths="~/Uploads/Img" imagemanager-maxuploadfilesize="512000" documentmanager-deletepaths="~/Uploads/Documents"
		flashmanager-deletepaths="~/Uploads/Flash" 
        mediamanager-deletepaths="~/Uploads/Flash" templatemanager-deletepaths="~/Uploads/Documents"
		documentmanager-viewpaths="~/Uploads/Documents" documentmanager-uploadpaths="~/Uploads/Documents"
		flashmanager-uploadpaths="~/Uploads/Flash" 
        mediamanager-uploadpaths="~/Uploads/Flash" templatemanager-uploadpaths="~/Uploads/Documents"
		flashmanager-viewpaths="~/Uploads/Flash" 
        mediamanager-viewpaths="~/Uploads/Media" enableresize="False"
		editmodes="Design" Skin="Windows7">
		<Modules>  
        <telerik:EditorModule Name="fakeModule" />  
    </Modules> 
<Content>
</Content>

<ImageManager ViewPaths="~/Uploads/Uploads/Img" UploadPaths="~/Uploads/Img" 
            DeletePaths="~/Uploads/Img" MaxUploadFileSize="512000"></ImageManager>

<DocumentManager ViewPaths="~/Uploads/Documents" UploadPaths="~/Uploads/Documents" 
            DeletePaths="~/Uploads/Documents"></DocumentManager>

<FlashManager ViewPaths="~/Uploads/Flash" UploadPaths="~/Uploads/Flash" 
            DeletePaths="~/Uploads/Flash"></FlashManager>

<MediaManager ViewPaths="~/Uploads/Media" UploadPaths="~/Uploads/Flash" 
            DeletePaths="~/Uploads/Flash"></MediaManager>

<TemplateManager UploadPaths="~/Uploads/Documents" DeletePaths="~/Uploads/Documents"></TemplateManager>
	</telerik:radeditor>
    </div>
	<div id="composeActions">
		<asp:Button ID="Button1" runat="server" Style="width: 75px" Text="Send" 
             onclick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" Style="width: 75px" Text="Cancel" />
	
        <asp:Label ID="Label1" runat="server" Text="" ForeColor="#009900"></asp:Label>
    </div>
	
	 </telerik:RadAjaxPanel>
    </form>

   
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default">
    </telerik:RadAjaxLoadingPanel>
</body>
</html>
