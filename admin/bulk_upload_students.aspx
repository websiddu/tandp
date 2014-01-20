<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="bulk_upload_students.aspx.cs" Inherits="admin_bulk_upload_students" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
     
     /* form elements */
.form {
	margin:12px 15px; padding: 0;
	border: 1px solid #eee; 
	font: normal 12px/1em 'Trebuchet MS', sans-serif;
	background-color: #FAFAFA; 
}
label {
	display:block;
	font: normal 12px/1em 'Trebuchet MS', sans-serif;
	font-weight:bold;
	margin:5px 0;
}
input {
	padding: 2px;
	border:1px solid #eee;
	font: normal 12px/1em 'Trebuchet MS', sans-serif;
	color:#777;
}
textarea {
	width:400px;
	padding:2px;
	border:1px solid #eee;
	height:100px;
	display:block;
	color:#777;
}
input.button  
{
    display:inline-block;
    font: normal 12px/1em 'Trebuchet MS', sans-serif;
	margin: 0; 
	border: 1px solid #CCC;
	background: #FFF; 
	padding: 5px 10px;
	color: #333;	
	border-radius:4px;
	cursor:pointer;
}
input.button:hover
{
    background-color:#333;
    color:#fff;
    border-radius:4px;
}
.button1{
text-decoration:none;
border:1px solid #dedede;
border-right:1px solid #bbb;
border-bottom:1px solid #bfbfbf;
cursor:pointer;
color:#464646;
-webkit-border-radius:5px;
-moz-border-radius:5px;
border-radius:5px;
-webkit-box-shadow:rgba(0,0,0,.15) 0 1px 3px;
-moz-box-shadow:rgba(0,0,0,.15) 0 1px 3px;
-o-box-shadow:rgba(0,0,0,.15) 0 1px 3px;
box-shadow:rgba(0,0,0,.15) 0 1px 3px;
float:none;
display:inline-block;
padding:3px 10px;
}
.button1:hover {
border:1px solid #999;
color:#000;
}


button.active, .button1:active {
-webkit-box-shadow:none;
-moz-box-shadow:none;
-o-box-shadow:none;
box-shadow:none;
border-color:#ccc;
}

#stuff
{
    padding:10px;
    margin:10px;
   background-color:#eee;
   border:solid 1px #d2d2d2;
   color:Red;
}
 
 </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="sidebartop_placeholder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="sidebarbottom_placeholder" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="content_heading" Runat="Server">
    Bulk Upload Students
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="content_placeholder" Runat="Server">

        <asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>

        <div id="top_form" class="form">
        <table>
        <tr>
        <td>
          <asp:FileUpload ID="FileUpload1" runat="server" />
        </td> 
        <td>
            <asp:Button ID="Button1" runat="server" Text="Upload.." CssClass="button1" 
                onclick="BTNImport_Click" /> 
        </td>
        </tr>    
            
            </table>
        
        </div>

        <div id="stuff">
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
            <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
        </div>
        <div id="box">
            <ul>
            <li>Download the sample csv file, <a href="example.csv">click here</a></li>
            <li>Use the only the ID's of the Cours and Department that should be in the primary data.</li>
            <li>Year must be in the primary data year table</li>
            <li>The Student_ID, Course ID, Department ID and Password are required for all the rows. </li>
            </ul>
        </div>

        <h3>Uploaded Users..</h3>
    <telerik:RadGrid ID="RadGrid1" runat="server" GridLines="None">
        <ClientSettings>
            <Scrolling AllowScroll="True" UseStaticHeaders="True" />
        </ClientSettings>
<MasterTableView>
<CommandItemSettings ExportToPdfText="Export to Pdf"></CommandItemSettings>

<RowIndicatorColumn>
<HeaderStyle Width="20px"></HeaderStyle>
</RowIndicatorColumn>

<ExpandCollapseColumn>
<HeaderStyle Width="20px"></HeaderStyle>
</ExpandCollapseColumn>
</MasterTableView>

<HeaderContextMenu EnableImageSprites="True" CssClass="GridContextMenu GridContextMenu_Default"></HeaderContextMenu>
    </telerik:RadGrid>
    
 
</asp:Content>

