<%@ Page Title="" Language="C#" MasterPageFile="~/c.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="c_Default" %>

<%@ Register src="placements_ratio.ascx" tagname="placements_ratio" tagprefix="uc1" %>

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
<div style="width:400px; margin:10px;" >

    <uc1:placements_ratio ID="placements_ratio1" runat="server" />

</div>
</asp:Content>

