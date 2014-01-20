<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="Reports.aspx.cs" Inherits="admin_Reports" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register src="reports/Report1.ascx" tagname="Report1" tagprefix="uc1" %>

<%@ Register src="reports/placements.ascx" tagname="placements" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="sidebartop_placeholder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="sidebarbottom_placeholder" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="content_heading" Runat="Server">
    Reports
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="content_placeholder" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <telerik:RadTabStrip ID="RadTabStrip1" runat="server" Skin="Windows7" 
        MultiPageID="RadMultiPage1" SelectedIndex="0">
        <Tabs>
            <telerik:RadTab runat="server" PageViewID="RadPageView1" Selected="True" 
                Text="General Reports">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="Placement Reports" PageViewID="RadPageView2"> 
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="Custome Reports" PageViewID="RadPageView3">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>

    <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0">
        <telerik:RadPageView ID="RadPageView1" runat="server">
            <uc1:Report1 ID="Report1" runat="server" />
            
       </telerik:RadPageView>
       <telerik:RadPageView ID="RadPageView2" runat="server">
            <uc2:placements ID="placements1" runat="server" />
            
       </telerik:RadPageView>

       <telerik:RadPageView ID="RadPageView3" runat="server">
            mail to siddu.siddhartha@gmail.com
            
       </telerik:RadPageView>
    </telerik:RadMultiPage>
</asp:Content>

