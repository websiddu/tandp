<%@ Page Title="" Language="C#" MasterPageFile="~/c.master" AutoEventWireup="true" CodeFile="Reset_User_Password.aspx.cs" Inherits="c_Reset_User_Password" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="sidebartop_placeholder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="sidebarbottom_placeholder" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="content_heading" Runat="Server">
    Reset User Password<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="content_placeholder" Runat="Server">
	<style type="text/css">
.rconf
{
	border: 0px solid #CCCCCC;
	border-radius:0;
	margin:0;
	line-height: 20px;
	padding: 2px;
}
input[type="text"], input[type="password"], input[type="file"], select {
	border: 1px solid #CCCCCC;
	border-radius: 3px;
	font-weight: bold;
	margin:0;
	padding: 2px;
}
</style>
<div style="padding:10px">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
<table>
	<tr>
	<td>
		Year :
	</td>
	<td>
		<telerik:RadComboBox ID="RadComboBox2" runat="server" AutoPostBack="True" 
			DataSourceID="LinqDataSource2" DataTextField="Year1" DataValueField="Year1"
			 CausesValidation=false
			CssClass= "rconf" 
			Skin="Windows7">
		</telerik:RadComboBox>
		<asp:LinqDataSource ID="LinqDataSource2" runat="server" 
			ContextTypeName="Datbase_ClassesDataContext" EntityTypeName="" 
			TableName="Years">
		</asp:LinqDataSource>
	</td>
		<td>
			Student_ID
		</td>
		<td>
			<telerik:RadComboBox ID="RadComboBox1" runat="server" 
				DataSourceID="LinqDataSource1" DataTextField="Student_ID" 
				DataValueField="Student_ID" Filter="Contains" MarkFirstMatch="True" 
				 AutoPostBack="True"
				 CssClass= "rconf"
				 Height="180px" Skin="Windows7" 
				EmptyMessage="Select a Person.."
				EnableAutomaticLoadOnDemand="true"
				ItemsPerRequest="15"
				ShowMoreResultsBox="true" 
				EnableVirtualScrolling="true" 
	   
				>
			</telerik:RadComboBox>
			<asp:LinqDataSource ID="LinqDataSource1" runat="server" 
				ContextTypeName="Datbase_ClassesDataContext" EntityTypeName="" 
				Select="new (Student_ID)" TableName="Students" 
                Where="Year == @Year &amp;&amp; Department == @Department">
				<WhereParameters>
					<asp:ControlParameter ControlID="RadComboBox2" Name="Year" 
						PropertyName="SelectedValue" Type="Int32" />
				    <asp:SessionParameter Name="Department" SessionField="Department" 
                        Type="Int32" />
				</WhereParameters>
			</asp:LinqDataSource>
		</td>
   
	</tr>
</table>
<br />
<table>
	<tr>
		<td>
			New Password :
		</td>
		<td>
			<asp:TextBox ID="TextBox1" runat="server" TextMode="Password"></asp:TextBox>
		</td>

	</tr>
	<tr>
		<td>
			Confirm New Password :
		</td>
		<td>
		<asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
		</td>

	</tr>
	<tr>
		<td>
			
		</td>
		<td>
			<asp:Button ID="Button1" runat="server" Text="Reset" onclick="Button1_Click" />
		</td>
		 
	</tr>
</table>

<h3 class="h3block">
	<asp:Label ID="Label1" runat="server" Text=""></asp:Label>  
</h3>
</ContentTemplate>
<Triggers>
    <asp:AsyncPostBackTrigger ControlID="RadComboBox1" />
</Triggers>
    </asp:UpdatePanel>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" 
        AssociatedUpdatePanelID="UpdatePanel1">
    </asp:UpdateProgress>

</div>
</asp:Content>

