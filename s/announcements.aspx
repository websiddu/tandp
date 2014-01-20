<%@ Page Title="" Language="C#" MasterPageFile="~/student.master" AutoEventWireup="true" CodeFile="announcements.aspx.cs" Inherits="s_announcements" %>

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
&nbsp;
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="content_placeholder" Runat="Server">
    <telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDataSource1" 
        GridLines="None" Skin="Windows7" AllowPaging="True" AllowSorting="True">
        <ClientSettings>
            <Scrolling AllowScroll="True" UseStaticHeaders="True" />
        </ClientSettings>
<MasterTableView AutoGenerateColumns="False" DataKeyNames="ID" 
            DataSourceID="SqlDataSource1" EditMode="PopUp" >
<CommandItemSettings ExportToPdfText="Export to Pdf"></CommandItemSettings>

<RowIndicatorColumn>
<HeaderStyle Width="20px"></HeaderStyle>
</RowIndicatorColumn>

<ExpandCollapseColumn>
<HeaderStyle Width="20px"></HeaderStyle>
</ExpandCollapseColumn>
    <Columns>
    <telerik:GridBoundColumn DataField="date" DataType="System.DateTime" 
            HeaderText="Published On" SortExpression="date" UniqueName="date">
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="subject" HeaderText="subject" 
            SortExpression="subject" UniqueName="subject">
        </telerik:GridBoundColumn>
        <telerik:GridEditCommandColumn EditText="Details">
        </telerik:GridEditCommandColumn>
    </Columns>
     <EditFormSettings  EditFormType="WebUserControl"
                    UserControlName="anbd.ascx">
                    <EditColumn UniqueName="EditCommandColumn1">
                    </EditColumn>
                    <PopUpSettings  Modal="true" />
                </EditFormSettings>
</MasterTableView>

<HeaderContextMenu EnableImageSprites="True" CssClass="GridContextMenu GridContextMenu_Default"></HeaderContextMenu>
    </telerik:RadGrid>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:tandp_db_connection_string %>" 
        
        SelectCommand="SELECT * FROM [announcements] WHERE ([to] = @to) ORDER BY date desc">
        <SelectParameters>
            <asp:SessionParameter Name="to" SessionField="Year" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>


    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" 
        DefaultLoadingPanelID="RadAjaxLoadingPanel1">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadGrid1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadGrid1" 
                        LoadingPanelID="RadAjaxLoadingPanel1" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default">
    </telerik:RadAjaxLoadingPanel>
</asp:Content>

