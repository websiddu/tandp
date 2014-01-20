<%@ Page Title="" Language="C#" MasterPageFile="~/c.master" AutoEventWireup="true" CodeFile="Manage_Students.aspx.cs" Inherits="c_Manage_Students" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register src="Report1.ascx" tagname="Report1" tagprefix="uc1" %>

<%@ Register src="placements.ascx" tagname="placements" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="sidebartop_placeholder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="sidebarbottom_placeholder" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="content_heading" Runat="Server">
    Manage Students<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
&nbsp;
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="content_placeholder" Runat="Server">
    <div style="padding:10px">
    <telerik:radtabstrip runat="server" Skin="Windows7" SelectedIndex="0" 
        MultiPageID="RadMultiPage1">
        <tabs>
            <telerik:RadTab runat="server" Text="General Reports" Selected="True" 
                PageViewID="RadPageView1">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="Placemnet Reports" 
                PageViewID="RadPageView2">
            </telerik:RadTab>
        </tabs>
    </telerik:radtabstrip>
    <telerik:radmultipage ID="RadMultiPage1" runat="server" SelectedIndex="0">
    <telerik:RadPageView runat="server" id="RadPageView1">
    <uc1:Report1 ID="Report11" runat="server" />
    </telerik:RadPageView>
    <telerik:RadPageView runat="server" id="RadPageView2">
        <uc2:placements ID="placements1" runat="server" />


    </telerik:RadPageView>
   </telerik:radmultipage>
    

</div>
</asp:Content>

