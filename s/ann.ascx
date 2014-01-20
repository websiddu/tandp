<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ann.ascx.cs" Inherits="s_ann" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
 <telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDataSource1" 
        GridLines="None" Skin="Windows7" AllowPaging="True" 
    AllowSorting="True" Width="400px">
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
        <telerik:GridTemplateColumn DataField="date" DataType="System.DateTime" 
            HeaderText="Subject " SortExpression="date" UniqueName="date">
            <EditItemTemplate>

           
                <asp:TextBox ID="dateTextBox" runat="server" Text='<%# Bind("date") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
              <asp:Label ID="subjectLabel" runat="server" Text='<%# Eval("subject") %>'></asp:Label>
              <br />
              <span style="font-size:12px; font-style:italic">
                <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>'></asp:Label>
                </span>
            </ItemTemplate>
        </telerik:GridTemplateColumn>
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