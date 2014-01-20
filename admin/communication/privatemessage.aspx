<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="privatemessage.aspx.cs" Inherits="admin_communication_privatemessage" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">

	<telerik:RadWindowManager runat="Server" ID="RadWindowManager1" EnableViewState="false">
		<Windows>
			<telerik:RadWindow runat="server" ID="Edit" NavigateUrl="Reply.aspx" OnClientPageLoad="onWindowLoad"
				Width="870px" Height="550px" ReloadOnShow="true"
				ShowContentDuringLoad="false" Modal="True" Behaviors="Close,Move" VisibleStatusbar="false">
			</telerik:RadWindow>
            <telerik:RadWindow runat="server" ID="Compose" NavigateUrl="Compose.aspx"
				Width="870px" Height="550px" ReloadOnShow="true"
				ShowContentDuringLoad="false">
			</telerik:RadWindow>
		</Windows>
	</telerik:RadWindowManager>

</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="sidebartop_placeholder" Runat="Server"></asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="sidebarbottom_placeholder" Runat="Server"></asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="content_heading" Runat="Server">
Private Messages..     <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
	
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="content_placeholder" Runat="Server">
    <telerik:RadSplitter ID="RadSplitter0" runat="server" Width="100%" Height="800px">
        <telerik:RadPane ID="RadPane5" runat="server" Width="150px">
           <telerik:RadTreeView runat="Server" ID="RadTreeView1" OnNodeClick="RadTreeView1_NodeClick"
		EnableViewState="false" Skin="Windows7">
		<Nodes>
			<telerik:RadTreeNode Text="" Expanded="true" ImageUrl="~/assets/images/pm/mailbox.gif"
				PostBack="false">
				<Nodes>
					<telerik:RadTreeNode Text="Inbox" ImageUrl="~/assets/images/pm/inbox.gif" Expanded="true" Selected="True">
					</telerik:RadTreeNode>
					<telerik:RadTreeNode Text="OutBox" ImageUrl="~/assets/images/pm/sentmails.png"/>
				</Nodes>
			</telerik:RadTreeNode>
		</Nodes>
	</telerik:RadTreeView>

        </telerik:RadPane>
        <telerik:RadSplitBar ID="RadSplitBar1" runat="server">
        </telerik:RadSplitBar>
<telerik:RadPane ID="RadPane4" runat="server">
    <telerik:RadSplitter ID="RadSplitter1" runat="server"
     Width="100%" 
		BorderStyle="None" PanesBorderSize="0" Height="800px" Orientation="Horizontal"
    
    
    >
    <telerik:RadPane runat="server" ID="RadPane1" Height="32px" EnableViewState="false" Scrollable="false">
			<telerik:RadToolBar runat="server" ID="RadToolBar1" 
				OnClientButtonClicked="onButtonClicked" EnableViewState="false" Skin="Windows7">
				<Items>
				
					<telerik:RadToolBarButton Text="Compose" ImageUrl="~/assets/images/pm/compose.png" CommandName="compose" />
					<telerik:RadToolBarButton IsSeparator="true" />
					<telerik:RadToolBarButton Text="Reply" ImageUrl="~/assets/images/pm/reply.gif" CommandName="reply" />
				</Items>
			</telerik:RadToolBar>
		</telerik:RadPane>
        <telerik:RadPane ID="RadPane2" runat="server">
            <telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="LinqDataSource1"
             AutoGenerateColumns="False"
				GridLines="None"  BorderWidth="0px" AllowSorting="True" Style="outline: none"
				ShowGroupPanel="True"  Width="100%" Skin="Windows7" 
                onitemdatabound="RadGrid1_ItemDataBound" onselectedindexchanged="RadGrid1_SelectedIndexChanged" 
               
                >

            <ClientSettings Scrolling-AllowScroll="True" Scrolling-UseStaticHeaders="true" Selecting-AllowRowSelect="true"
					EnablePostBackOnRowClick="true" AllowDragToGroup="true" EnableRowHoverStyle="true"
					ClientEvents-OnRowSelected="onGridRowSelected">
				<Selecting AllowRowSelect="True" />
                <ClientEvents OnRowSelected="onGridRowSelected" />
                <Scrolling AllowScroll="True" UseStaticHeaders="True" />
				</ClientSettings>
                <MasterTableView AutoGenerateColumns="False" DataKeyNames="MessageID" 
                    DataSourceID="LinqDataSource1">
                    <CommandItemSettings ExportToPdfText="Export to Pdf" />
                    <GroupByExpressions>
						<telerik:GridGroupByExpression>
							<GroupByFields>
								<telerik:GridGroupByField FieldName="DateResult" HeaderValueSeparator=":" SortOrder="Descending" />
							</GroupByFields>
							<SelectFields>
								<telerik:GridGroupByField FieldName="DateResult" HeaderText="Date" FormatString="{0:D}" />
							</SelectFields>
						</telerik:GridGroupByExpression>
					</GroupByExpressions>
                    <Columns>
                    <telerik:GridBoundColumn DataField="MessageID" HeaderText="MessageID" GroupByExpression="MessageID" Visible="false">
						</telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Status" HeaderText="Status" GroupByExpression="Status" Visible="false">
						</telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="From" HeaderText="From1" GroupByExpression="From" Visible="false" UniqueName="frm">
						</telerik:GridBoundColumn>
						<telerik:GridBoundColumn DataField="From" HeaderText="From" HeaderStyle-Width="120px">
						    <HeaderStyle Width="120px" />
						</telerik:GridBoundColumn>
						<telerik:GridBoundColumn DataField="Subject" HeaderText="Subject" GroupByExpression="ConversationResult Conversation GROUP BY ConversationResult">
						</telerik:GridBoundColumn>
						<telerik:GridBoundColumn DataField="Received" HeaderText="Date" HeaderStyle-Width="150px" UniqueName="Received"
							GroupByExpression="DateResult Date GROUP BY DateResult" EditFormHeaderTextFormat="{0:d}" >
						    <HeaderStyle Width="150px" />
						</telerik:GridBoundColumn>
						<telerik:GridCalculatedColumn UniqueName="Date" DataType="System.DateTime"  DataFields="Received" DataFormatString="{0:d}"
							Expression="Received.Value.Date" HeaderText="Date" EditFormHeaderTextFormat="{0:d}:" Visible="false">
						</telerik:GridCalculatedColumn>
						<telerik:GridCalculatedColumn UniqueName="Conversation" DataType="System.String"
							DataFields="Subject" Expression='Subject.Replace("RE: ", "")' HeaderText="Conversation"
							Visible="false">
						</telerik:GridCalculatedColumn>
					    
					</Columns>
                </MasterTableView>
                <HeaderContextMenu CssClass="GridContextMenu GridContextMenu_Default" 
                    EnableImageSprites="True">
                </HeaderContextMenu>
            </telerik:RadGrid>

            <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
                ContextTypeName="Datbase_ClassesDataContext" EntityTypeName=""  
                TableName="private_messagings" Where="To == @To" OrderBy="Received desc">
                <WhereParameters>
                    <asp:SessionParameter Name="To" SessionField="UserLogin" Type="String" />
                </WhereParameters>
            </asp:LinqDataSource>

          

            <asp:LinqDataSource ID="LinqDataSource2" runat="server" 
                ContextTypeName="Datbase_ClassesDataContext" EntityTypeName="" 
                TableName="private_messagings" Where="From == @From" 
                OrderBy="Received desc">
                <WhereParameters>
                    <asp:SessionParameter Name="From" SessionField="UserLogin" Type="String" />
                </WhereParameters>
            </asp:LinqDataSource>

          

        </telerik:RadPane>
        <telerik:RadSplitBar runat="server" ID="RadSplitBar2" />
        <telerik:RadPane ID="RadPane3" runat="server"  Height="500px">
            <asp:DetailsView ID="DetailsView1" runat="server" Width="100%" CssClass="message-view"
                AutoGenerateRows="False" DataKeyNames="MessageID" DataSourceID="SqlDataSource2"
                GridLines="None" EnableViewState="false"
                
                >
                <Fields>
					<asp:TemplateField ShowHeader="false">
						<ItemTemplate>
                        <div style="padding:10px 5px;">
							<ul style="margin-bottom:10px;">
								<li><h2 id="subject"  style="font-size:20px; font-weight:normal;"><%# Eval("Subject") %></h2></li>
								<li style="margin:5px 0px;"><span id="from"><%# Eval("From") %></span></li>
								<li style="margin:0px 0px 5px 0px;">Sent: <span id="sent"><%# Eval("Received") %></span></li>
							</ul>
							<div id="message-body" style=" padding-left:10px;">
								<%# ((string)Eval("Body")).Replace("\n", "<br />") %>
							</div>
                            </div>
						</ItemTemplate>
					</asp:TemplateField>
				</Fields>
            </asp:DetailsView>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:tandp_db_connection_string %>" 
                SelectCommand="SELECT * FROM [private_messaging] WHERE ([MessageID] = @MessageID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ctl00$content_placeholder$RadGrid1" Name="MessageID" 
                       Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

        </telerik:RadPane>
    </telerik:RadSplitter>
</telerik:RadPane>
 </telerik:RadSplitter>
 <br />
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>

    <telerik:RadAjaxManagerProxy runat="server" ID="RadAjaxManagerProxy1">
		<AjaxSettings>
			<telerik:AjaxSetting AjaxControlID="RadGrid1">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="DetailsView1" LoadingPanelID="RadAjaxLoadingPanel1" />
                    <telerik:AjaxUpdatedControl ControlID="RadGrid1" LoadingPanelID="RadAjaxLoadingPanel1" />
				</UpdatedControls>
			</telerik:AjaxSetting>
			<telerik:AjaxSetting AjaxControlID="RadTreeView1">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="RadGrid1" LoadingPanelID="RadAjaxLoadingPanel1" />
					<telerik:AjaxUpdatedControl ControlID="RadToolBar1" />
					<telerik:AjaxUpdatedControl ControlID="DetailsView1" />
				</UpdatedControls>
			</telerik:AjaxSetting>
			<telerik:AjaxSetting AjaxControlID="RadAjaxManagerProxy1">
				<UpdatedControls>
					<telerik:AjaxUpdatedControl ControlID="RadGrid1" LoadingPanelID="RadAjaxLoadingPanel1" />
					<telerik:AjaxUpdatedControl ControlID="DetailsView1" LoadingPanelID="RadAjaxLoadingPanel1" />
				</UpdatedControls>
			</telerik:AjaxSetting>
		</AjaxSettings>
	</telerik:RadAjaxManagerProxy>
	<telerik:RadAjaxLoadingPanel runat="server" ID="RadAjaxLoadingPanel1">
	</telerik:RadAjaxLoadingPanel>
</asp:Content>
