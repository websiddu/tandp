<%@ Page Title="" Language="C#" MasterPageFile="~/student.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="s_Default" %>

<%@ Register src="performance.ascx" tagname="performance" tagprefix="uc1" %>

<%@ Register src="ann.ascx" tagname="ann" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="sidebartop_placeholder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="sidebarbottom_placeholder" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="content_heading" Runat="Server">
    Welcome 
    <asp:LoginName ID="LoginName1" runat="server" />

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="content_placeholder" Runat="Server">
    <div style="overflow:hidden;">
<div style="width:400px; float:left; margin:0px 20px;">
<h3 class="h3block">
    Your Performance
</h3>


    <uc1:performance ID="performance1" runat="server" />

</div>
<div style="width:400px; float:left;">
<h3 class="h3block_r">Announcements</h3>

    <uc2:ann ID="ann1" runat="server" />

</div>
<br class="clearfix" />
<div style="width:400px; float:left;">
<h3 class="h3block">Alerts</h3>
<div style="font-size:15px; padding:0px 20px;">
Your Overall Percentage : 
    <span class="aler_g"><asp:Label ID="Label1" runat="server" Text=""></asp:Label></span>
    <br /><br />
You have 
    <span class="aler_r"><asp:Label ID="Label2" runat="server" Text=""></asp:Label></span> backlogs.
    </div>
</div>

</div>
</asp:Content>

