<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Reply.aspx.cs" Inherits="admin_communication_Reply" %>

<%@ Register TagPrefix="telerik" Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head id="Head1" runat="server">
	<title>Reply</title>
	
</head>
<body class="composeWindow" onload="page_load">
	<form id="form1" runat="server">
    
	<telerik:radscriptmanager id="ScriptManager" runat="server" />
	<telerik:radskinmanager runat="Server" id="SkinManager1" skin="Vista" persistencekey="Skin"
		persistencemode="Session">
	</telerik:radskinmanager>
	<telerik:radeditor id="RadEditor1" width="834px" height="460px"
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
	<div id="composeActions">
		<asp:Button ID="Button1" runat="server" Style="width: 75px" Text="Send" 
             onclick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" Style="width: 75px" Text="Cancel" OnClientClick="return cancel()" />
	
        <asp:Label ID="Label1" runat="server" Text="" ForeColor="#009900"></asp:Label>
    </div>
    <telerik:RadTextBox ID="RadTextBox1" runat="server" Enabled="false" Width="0px" Height="0px">
    </telerik:RadTextBox><telerik:RadTextBox ID="RadTextBox2" runat="server" Enabled="false"  Width="0px" Height="0px">
    </telerik:RadTextBox>
    
	<script type="text/javascript">

	    function page_load() {
	        
        }
        function setEditorContent(content,to,sub) {

            window.setTimeout(function () {

                var editor = $find("<%= RadEditor1.ClientID%>");
                editor.set_html(content);
                var textbox = $find("<%= RadTextBox1.ClientID%>");
                textbox.set_value(to);
                var textbox1 = $find("<%= RadTextBox2.ClientID%>");
                textbox1.set_value(sub);

            }, 0);
	    }

	    function save() {
	        var radWindow = window.radWindow ? window.radWindow : window.frameElement.radWindow;
	        var editor = $find("<%= RadEditor1.ClientID%>");
	        radWindow.close(editor.get_html());

	        return true;
	    }

	    function cancel() {
	        var radWindow = window.radWindow ? window.radWindow : window.frameElement.radWindow;
	        radWindow.close();

	        return false;
	    }
	</script>

	<telerik:radformdecorator runat="server" id="RadFormDecorator1" />
	</form>
</body>
</html>
