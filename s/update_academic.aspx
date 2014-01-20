<%@ Page Title="" Language="C#" MasterPageFile="~/student.master" AutoEventWireup="true" CodeFile="update_academic.aspx.cs" Inherits="s_update_academic" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="sidebartop_placeholder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="sidebarbottom_placeholder" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="content_heading" Runat="Server">
    Update Academic Details<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="content_placeholder" Runat="Server">
    <div style="margin:10px">
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="Student_ID" 
        DataSourceID="SqlDataSource1" DefaultMode="Edit" 
        onitemcommand="FormView1_ItemCommand" 
        onitemupdated="FormView1_ItemUpdated">
        <EditItemTemplate>
 

        <h3 class="h3block">Academic Details</h3>
            <table border=1>
	<tr class="row-a">
		<td>10th/CBSE Percentage </td>
		<td><telerik:RadNumericTextBox ID="_10thTextBox" runat="server" Text='<%# Bind("tenth") %>' MaxValue="100" MinValue="0"/></td>
	</tr>
	<tr class="row-b">
		<td>Inter/+2 Percentage</td>
		<td><telerik:RadNumericTextBox ID="InterTextBox" runat="server" MaxValue="100" MinValue="0" Text='<%# Bind("Inter") %>' /></td>
	</tr>
	<tr class="row-a">
		<td>Eamcet Rank/Graduation %</td>
		<td><telerik:RadNumericTextBox ID="Eamcet_RankTextBox" runat="server" 
                Text='<%# Bind("Eamcet_Rank") %>' >
            <NumberFormat DecimalDigits="0" GroupSeparator="" />
            </telerik:RadNumericTextBox>
        </td>
	</tr>
</table>
<table width="350px">
	<tr class="row-a">
		<td>1st Semester %</td>
		<td><telerik:RadNumericTextBox  CssClass="width50" Width="50px"   MaxLength="50" MinValue="0" MaxValue="100"  ID="Sem1TextBox" runat="server" Text='<%# Bind("Sem1") %>' /></td>
		<td>backlogs</td>
		<td><telerik:RadNumericTextBox  CssClass="width50" Width="50px"   MaxLength="50" MinValue="0" MaxValue="100"  ID="Sem1_backlogsTextBox" runat="server" Text='<%# Bind("Sem1_backlogs") %>' >
        <NumberFormat DecimalDigits="0" GroupSeparator="" />
        </telerik:RadNumericTextBox>
        </td>
	</tr>
	<tr class="row-b">
		<td>2nd Semester %</td>
		<td><telerik:RadNumericTextBox  CssClass="width50" Width="50px"   MaxLength="50" MinValue="0" MaxValue="100"  ID="Sem2TextBox" runat="server" Text='<%# Bind("Sem2") %>' /></td>
		<td>backlogs</td>
		<td><telerik:RadNumericTextBox  CssClass="width50" Width="50px"   MaxLength="50" MinValue="0" MaxValue="100"  ID="Sem2_backlogsTextBox" runat="server" Text='<%# Bind("Sem2_backlogs") %>' >
        <NumberFormat DecimalDigits="0" GroupSeparator="" />
        </telerik:RadNumericTextBox>
        </td>
	</tr>
	<tr class="row-a">
		<td>3rd Semester %</td>
		<td><telerik:RadNumericTextBox  CssClass="width50" Width="50px"   MaxLength="50" MinValue="0" MaxValue="100"  ID="Sem3TextBox" runat="server" Text='<%# Bind("Sem3") %>' /></td>
		<td>backlogs</td>
		<td><telerik:RadNumericTextBox  CssClass="width50" Width="50px"   MaxLength="50" MinValue="0" MaxValue="100"  ID="Sem3_backlogsTextBox" runat="server" Text='<%# Bind("Sem3_backlogs") %>' >
        <NumberFormat DecimalDigits="0" GroupSeparator="" />
        </telerik:RadNumericTextBox>
        </td>
	</tr>
	<tr class="row-b">
		<td>4th Semester %</td>
		<td><telerik:RadNumericTextBox  CssClass="width50" Width="50px"   MaxLength="50" MinValue="0" MaxValue="100"  ID="Sem4TextBox" runat="server" Text='<%# Bind("Sem4") %>' /></td>
		<td>backlogs</td>
		<td><telerik:RadNumericTextBox  CssClass="width50" Width="50px"   MaxLength="50" MinValue="0" MaxValue="100"  ID="Sem4_backlogsTextBox" runat="server" Text='<%# Bind("Sem4_backlogs") %>' >
        <NumberFormat DecimalDigits="0" GroupSeparator="" />
        </telerik:RadNumericTextBox>
        </td>
	</tr>
	<tr class="row-a">
		<td>5th Semester %</td>
		<td><telerik:RadNumericTextBox  CssClass="width50" Width="50px"   MaxLength="50" MinValue="0" MaxValue="100"  ID="Sem5TextBox" runat="server" Text='<%# Bind("Sem5") %>' >
        <NumberFormat DecimalDigits="0" GroupSeparator="" />
        </telerik:RadNumericTextBox>
        </td>
		<td>backlogs</td>
		<td><telerik:RadNumericTextBox  CssClass="width50" Width="50px"   MaxLength="50" MinValue="0" MaxValue="100"  ID="Sem5_backlogsTextBox" runat="server" Text='<%# Bind("Sem5_backlogs") %>' >
        <NumberFormat DecimalDigits="0" GroupSeparator="" />
        </telerik:RadNumericTextBox>
        </td>

	</tr>
	<tr class="row-b">
		<td>6th Semester % </td>
		<td><telerik:RadNumericTextBox  CssClass="width50" Width="50px"   MaxLength="50" MinValue="0" MaxValue="100"  ID="Sem6TextBox" runat="server" Text='<%# Bind("Sem6") %>' /></td>
		<td>backlogs</td>
		<td><telerik:RadNumericTextBox  CssClass="width50" Width="50px"   MaxLength="50" MinValue="0" MaxValue="100"  ID="Sem6_backlogsTextBox" runat="server" Text='<%# Bind("Sem6_backlogs") %>' >
        <NumberFormat DecimalDigits="0" GroupSeparator="" />
        </telerik:RadNumericTextBox>
        </td>
	</tr>
	<tr class="row-a">
		<td>7th Semester %</td>
		<td><telerik:RadNumericTextBox  CssClass="width50" Width="50px"   MaxLength="50" MinValue="0" MaxValue="100"  ID="Sem7TextBox" runat="server" Text='<%# Bind("Sem7") %>' /></td>
		<td>backlogs</td>
		<td><telerik:RadNumericTextBox  CssClass="width50" Width="50px"   MaxLength="50" MinValue="0" MaxValue="100"  ID="Sem7_backlogsTextBox" runat="server" Text='<%# Bind("Sem7_backlogs") %>' >
        <NumberFormat DecimalDigits="0" GroupSeparator="" />
        </telerik:RadNumericTextBox>
        </td>
	</tr>
	<tr class="row-b">
		<td>8th Semester %</td>
		<td><telerik:RadNumericTextBox  CssClass="width50" Width="50px"   MaxLength="50" MinValue="0" MaxValue="100"  ID="Sem8TextBox" runat="server" Text='<%# Bind("Sem8") %>' /></td>
		<td>backlogs</td>
		<td><telerik:RadNumericTextBox  CssClass="width50" Width="50px"   MaxLength="50" MinValue="0" MaxValue="100"  ID="Sem8_backlogsTextBox" runat="server" Text='<%# Bind("Sem8_backlogs") %>' >
        <NumberFormat DecimalDigits="0" GroupSeparator="" />
        </telerik:RadNumericTextBox>
        
        </td>
	</tr>

    <tr class="row-a">
		<td>Overall Percentage</td>
		<td><telerik:RadNumericTextBox   CssClass="width50" Width="50px"   MaxLength="50" MinValue="0" MaxValue="100" ID="OverallTextBox" runat="server" Text='<%# Bind("Overall") %>' /></td>
		<td>Total Backlogs</td>
		<td><telerik:RadNumericTextBox CssClass="width50" Width="50px"   MaxLength="50" MinValue="0" MaxValue="100" ID="total_backlogsTextBox" runat="server" Text='<%# Bind("total_baklogs") %>' >
        <NumberFormat DecimalDigits="0" GroupSeparator="" />
        </telerik:RadNumericTextBox>
        </td>
	</tr>
</table>
<br />
<br />

            <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:Button>

           
        </EditItemTemplate>
        <InsertItemTemplate>

        </InsertItemTemplate>
        <ItemTemplate>
          
        </ItemTemplate>
    </asp:FormView>

<h3 class="h3block_r">
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
</h3>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:tandp_db_connection_string %>" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [Students] WHERE ([Student_ID] = @Student_ID)" 
        UpdateCommand="UPDATE [Students] SET [tenth] = @tenth, [Inter] = @Inter, [Eamcet_Rank] = @Eamcet_Rank, [Sem1] = @Sem1, [Sem2] = @Sem2, [Sem3] = @Sem3, [Sem4] = @Sem4, [Sem5] = @Sem5, [Sem6] = @Sem6, [Sem7] = @Sem7, [Sem8] = @Sem8, [Sem1_backlogs] = @Sem1_backlogs, [Sem2_backlogs] = @Sem2_backlogs, [Sem3_backlogs] = @Sem3_backlogs, [Sem4_backlogs] = @Sem4_backlogs, [Sem5_backlogs] = @Sem5_backlogs, [Sem6_backlogs] = @Sem6_backlogs, [Sem7_backlogs] = @Sem7_backlogs, [Sem8_backlogs] = @Sem8_backlogs,[Overall] = @Overall, [total_baklogs] = @total_baklogs, [Checked] = 0, [TimeStamp] = getdate() WHERE [Student_ID] = @original_Student_ID">

        <SelectParameters>
            <asp:SessionParameter Name="Student_ID" SessionField="UserLogin" 
                Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="tenth" Type="Double" />
            <asp:Parameter Name="Inter" Type="Double" />
            <asp:Parameter Name="Eamcet_Rank" Type="Double" />
            <asp:Parameter Name="Sem1" Type="Double" />
            <asp:Parameter Name="Sem2" Type="Double" />
            <asp:Parameter Name="Sem3" Type="Double" />
            <asp:Parameter Name="Sem4" Type="Double" />
            <asp:Parameter Name="Sem5" Type="Double" />
            <asp:Parameter Name="Sem6" Type="Double" />
            <asp:Parameter Name="Sem7" Type="Double" />
            <asp:Parameter Name="Sem8" Type="Double" />
            <asp:Parameter Name="Sem1_backlogs" Type="Int32" />
            <asp:Parameter Name="Sem2_backlogs" Type="Int32" />
            <asp:Parameter Name="Sem3_backlogs" Type="Int32" />
            <asp:Parameter Name="Sem4_backlogs" Type="Int32" />
            <asp:Parameter Name="Sem5_backlogs" Type="Int32" />
            <asp:Parameter Name="Sem6_backlogs" Type="Int32" />
            <asp:Parameter Name="Sem7_backlogs" Type="Int32" />
            <asp:Parameter Name="Sem8_backlogs" Type="Int32" />
            <asp:Parameter Name="img_url" Type="String" />
            <asp:Parameter Name="achivements" Type="String" />
            <asp:Parameter Name="Remarks" Type="String" />
            <asp:Parameter Name="Overall" Type="Double" />
            <asp:Parameter Name="total_baklogs" Type="Int32" />
            <asp:Parameter Name="Checked" Type="Boolean" />
            <asp:Parameter Name="TimeStamp" Type="DateTime" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" 
        DefaultLoadingPanelID="RadAjaxLoadingPanel1">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="FormView1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="FormView1" 
                        LoadingPanelID="RadAjaxLoadingPanel1" />
                    <telerik:AjaxUpdatedControl ControlID="Label1" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" Runat="server" 
        Skin="Default">
    </telerik:RadAjaxLoadingPanel>
    </div>


</asp:Content>

