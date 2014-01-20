<%@ Page Title="" Language="C#" MasterPageFile="~/c.master" AutoEventWireup="true" CodeFile="Confirm_Std_Changes.aspx.cs" Inherits="c_Confirm_Std_Changes" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="sidebartop_placeholder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="sidebarbottom_placeholder" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="content_heading" Runat="Server">
    Confirm Student Changes<asp:ScriptManager ID="ScriptManager1" runat="server">
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
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
<div style="padding:10px">

<table>
	<tr>
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
                Where="Department == @Department">
				<WhereParameters>
				    <asp:SessionParameter Name="Department" SessionField="Department" 
                        Type="Int32" />
				</WhereParameters>
			</asp:LinqDataSource>
		</td>
        <td>
            <asp:RequiredFieldValidator ControlToValidate="RadComboBox1" ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Student_ID Required."></asp:RequiredFieldValidator>   
            
            </td>
   
	</tr>

</table>
<br />
 <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1">
        <EditItemTemplate>
            Student_ID:
            <asp:TextBox ID="Student_IDTextBox" runat="server" 
                Text='<%# Bind("Student_ID") %>' />
            <br />
            Course:
            <asp:TextBox ID="CourseTextBox" runat="server" Text='<%# Bind("Course") %>' />
            <br />
            Department:
            <asp:TextBox ID="DepartmentTextBox" runat="server" 
                Text='<%# Bind("Department") %>' />
            <br />
            Year:
            <asp:TextBox ID="YearTextBox" runat="server" Text='<%# Bind("Year") %>' />
            <br />
            Year_of_Joining:
            <asp:TextBox ID="Year_of_JoiningTextBox" runat="server" 
                Text='<%# Bind("Year_of_Joining") %>' />
            <br />
            Email:
            <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
            <br />
            First_Name:
            <asp:TextBox ID="First_NameTextBox" runat="server" 
                Text='<%# Bind("First_Name") %>' />
            <br />
            Last_Name:
            <asp:TextBox ID="Last_NameTextBox" runat="server" 
                Text='<%# Bind("Last_Name") %>' />
            <br />
            Current_Address:
            <asp:TextBox ID="Current_AddressTextBox" runat="server" 
                Text='<%# Bind("Current_Address") %>' />
            <br />
            Per_Address:
            <asp:TextBox ID="Per_AddressTextBox" runat="server" 
                Text='<%# Bind("Per_Address") %>' />
            <br />
            Mobile_Number:
            <asp:TextBox ID="Mobile_NumberTextBox" runat="server" 
                Text='<%# Bind("Mobile_Number") %>' />
            <br />
            Land_Line:
            <asp:TextBox ID="Land_LineTextBox" runat="server" 
                Text='<%# Bind("Land_Line") %>' />
            <br />
            tenth:
            <asp:TextBox ID="tenthTextBox" runat="server" Text='<%# Bind("tenth") %>' />
            <br />
            Inter:
            <asp:TextBox ID="InterTextBox" runat="server" Text='<%# Bind("Inter") %>' />
            <br />
            Eamcet_Rank:
            <asp:TextBox ID="Eamcet_RankTextBox" runat="server" 
                Text='<%# Bind("Eamcet_Rank") %>' />
            <br />
            Sem1:
            <asp:TextBox ID="Sem1TextBox" runat="server" Text='<%# Bind("Sem1") %>' />
            <br />
            Sem2:
            <asp:TextBox ID="Sem2TextBox" runat="server" Text='<%# Bind("Sem2") %>' />
            <br />
            Sem3:
            <asp:TextBox ID="Sem3TextBox" runat="server" Text='<%# Bind("Sem3") %>' />
            <br />
            Sem4:
            <asp:TextBox ID="Sem4TextBox" runat="server" Text='<%# Bind("Sem4") %>' />
            <br />
            Sem5:
            <asp:TextBox ID="Sem5TextBox" runat="server" Text='<%# Bind("Sem5") %>' />
            <br />
            Sem6:
            <asp:TextBox ID="Sem6TextBox" runat="server" Text='<%# Bind("Sem6") %>' />
            <br />
            Sem7:
            <asp:TextBox ID="Sem7TextBox" runat="server" Text='<%# Bind("Sem7") %>' />
            <br />
            Sem8:
            <asp:TextBox ID="Sem8TextBox" runat="server" Text='<%# Bind("Sem8") %>' />
            <br />
            Sem1_backlogs:
            <asp:TextBox ID="Sem1_backlogsTextBox" runat="server" 
                Text='<%# Bind("Sem1_backlogs") %>' />
            <br />
            Sem2_backlogs:
            <asp:TextBox ID="Sem2_backlogsTextBox" runat="server" 
                Text='<%# Bind("Sem2_backlogs") %>' />
            <br />
            Sem3_backlogs:
            <asp:TextBox ID="Sem3_backlogsTextBox" runat="server" 
                Text='<%# Bind("Sem3_backlogs") %>' />
            <br />
            Sem4_backlogs:
            <asp:TextBox ID="Sem4_backlogsTextBox" runat="server" 
                Text='<%# Bind("Sem4_backlogs") %>' />
            <br />
            Sem5_backlogs:
            <asp:TextBox ID="Sem5_backlogsTextBox" runat="server" 
                Text='<%# Bind("Sem5_backlogs") %>' />
            <br />
            Sem6_backlogs:
            <asp:TextBox ID="Sem6_backlogsTextBox" runat="server" 
                Text='<%# Bind("Sem6_backlogs") %>' />
            <br />
            Sem7_backlogs:
            <asp:TextBox ID="Sem7_backlogsTextBox" runat="server" 
                Text='<%# Bind("Sem7_backlogs") %>' />
            <br />
            Sem8_backlogs:
            <asp:TextBox ID="Sem8_backlogsTextBox" runat="server" 
                Text='<%# Bind("Sem8_backlogs") %>' />
            <br />
            img_url:
            <asp:TextBox ID="img_urlTextBox" runat="server" Text='<%# Bind("img_url") %>' />
            <br />
            achivements:
            <asp:TextBox ID="achivementsTextBox" runat="server" 
                Text='<%# Bind("achivements") %>' />
            <br />
            Remarks:
            <asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' />
            <br />
            Password:
            <asp:TextBox ID="PasswordTextBox" runat="server" 
                Text='<%# Bind("Password") %>' />
            <br />
            Gender:
            <asp:CheckBox ID="GenderCheckBox" runat="server" 
                Checked='<%# Bind("Gender") %>' />
            <br />
            Expr1:
            <asp:TextBox ID="Expr1TextBox" runat="server" Text='<%# Bind("Expr1") %>' />
            <br />
            Expr2:
            <asp:TextBox ID="Expr2TextBox" runat="server" Text='<%# Bind("Expr2") %>' />
            <br />
            Expr3:
            <asp:TextBox ID="Expr3TextBox" runat="server" Text='<%# Bind("Expr3") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            Student_ID:
            <asp:TextBox ID="Student_IDTextBox" runat="server" 
                Text='<%# Bind("Student_ID") %>' />
            <br />
            Course:
            <asp:TextBox ID="CourseTextBox" runat="server" Text='<%# Bind("Course") %>' />
            <br />
            Department:
            <asp:TextBox ID="DepartmentTextBox" runat="server" 
                Text='<%# Bind("Department") %>' />
            <br />
            Year:
            <asp:TextBox ID="YearTextBox" runat="server" Text='<%# Bind("Year") %>' />
            <br />
            Year_of_Joining:
            <asp:TextBox ID="Year_of_JoiningTextBox" runat="server" 
                Text='<%# Bind("Year_of_Joining") %>' />
            <br />
            Email:
            <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
            <br />
            First_Name:
            <asp:TextBox ID="First_NameTextBox" runat="server" 
                Text='<%# Bind("First_Name") %>' />
            <br />
            Last_Name:
            <asp:TextBox ID="Last_NameTextBox" runat="server" 
                Text='<%# Bind("Last_Name") %>' />
            <br />
            Current_Address:
            <asp:TextBox ID="Current_AddressTextBox" runat="server" 
                Text='<%# Bind("Current_Address") %>' />
            <br />
            Per_Address:
            <asp:TextBox ID="Per_AddressTextBox" runat="server" 
                Text='<%# Bind("Per_Address") %>' />
            <br />
            Mobile_Number:
            <asp:TextBox ID="Mobile_NumberTextBox" runat="server" 
                Text='<%# Bind("Mobile_Number") %>' />
            <br />
            Land_Line:
            <asp:TextBox ID="Land_LineTextBox" runat="server" 
                Text='<%# Bind("Land_Line") %>' />
            <br />
            tenth:
            <asp:TextBox ID="tenthTextBox" runat="server" Text='<%# Bind("tenth") %>' />
            <br />
            Inter:
            <asp:TextBox ID="InterTextBox" runat="server" Text='<%# Bind("Inter") %>' />
            <br />
            Eamcet_Rank:
            <asp:TextBox ID="Eamcet_RankTextBox" runat="server" 
                Text='<%# Bind("Eamcet_Rank") %>' />
            <br />
            Sem1:
            <asp:TextBox ID="Sem1TextBox" runat="server" Text='<%# Bind("Sem1") %>' />
            <br />
            Sem2:
            <asp:TextBox ID="Sem2TextBox" runat="server" Text='<%# Bind("Sem2") %>' />
            <br />
            Sem3:
            <asp:TextBox ID="Sem3TextBox" runat="server" Text='<%# Bind("Sem3") %>' />
            <br />
            Sem4:
            <asp:TextBox ID="Sem4TextBox" runat="server" Text='<%# Bind("Sem4") %>' />
            <br />
            Sem5:
            <asp:TextBox ID="Sem5TextBox" runat="server" Text='<%# Bind("Sem5") %>' />
            <br />
            Sem6:
            <asp:TextBox ID="Sem6TextBox" runat="server" Text='<%# Bind("Sem6") %>' />
            <br />
            Sem7:
            <asp:TextBox ID="Sem7TextBox" runat="server" Text='<%# Bind("Sem7") %>' />
            <br />
            Sem8:
            <asp:TextBox ID="Sem8TextBox" runat="server" Text='<%# Bind("Sem8") %>' />
            <br />
            Sem1_backlogs:
            <asp:TextBox ID="Sem1_backlogsTextBox" runat="server" 
                Text='<%# Bind("Sem1_backlogs") %>' />
            <br />
            Sem2_backlogs:
            <asp:TextBox ID="Sem2_backlogsTextBox" runat="server" 
                Text='<%# Bind("Sem2_backlogs") %>' />
            <br />
            Sem3_backlogs:
            <asp:TextBox ID="Sem3_backlogsTextBox" runat="server" 
                Text='<%# Bind("Sem3_backlogs") %>' />
            <br />
            Sem4_backlogs:
            <asp:TextBox ID="Sem4_backlogsTextBox" runat="server" 
                Text='<%# Bind("Sem4_backlogs") %>' />
            <br />
            Sem5_backlogs:
            <asp:TextBox ID="Sem5_backlogsTextBox" runat="server" 
                Text='<%# Bind("Sem5_backlogs") %>' />
            <br />
            Sem6_backlogs:
            <asp:TextBox ID="Sem6_backlogsTextBox" runat="server" 
                Text='<%# Bind("Sem6_backlogs") %>' />
            <br />
            Sem7_backlogs:
            <asp:TextBox ID="Sem7_backlogsTextBox" runat="server" 
                Text='<%# Bind("Sem7_backlogs") %>' />
            <br />
            Sem8_backlogs:
            <asp:TextBox ID="Sem8_backlogsTextBox" runat="server" 
                Text='<%# Bind("Sem8_backlogs") %>' />
            <br />
            img_url:
            <asp:TextBox ID="img_urlTextBox" runat="server" Text='<%# Bind("img_url") %>' />
            <br />
            achievements:
            <asp:TextBox ID="achivementsTextBox" runat="server" 
                Text='<%# Bind("achivements") %>' />
            <br />
            Remarks:
            <asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' />
            <br />
            Password:
            <asp:TextBox ID="PasswordTextBox" runat="server" 
                Text='<%# Bind("Password") %>' />
            <br />
            Gender:
            <asp:CheckBox ID="GenderCheckBox" runat="server" 
                Checked='<%# Bind("Gender") %>' />
            <br />
            Expr1:
            <asp:TextBox ID="Expr1TextBox" runat="server" Text='<%# Bind("Expr1") %>' />
            <br />
            Expr2:
            <asp:TextBox ID="Expr2TextBox" runat="server" Text='<%# Bind("Expr2") %>' />
            <br />
            Expr3:
            <asp:TextBox ID="Expr3TextBox" runat="server" Text='<%# Bind("Expr3") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
               <div style="width:500px">
    <h3 class="h3block">General Details</h3>
        <table>
        <tr>
            <td>Name</td>
            <td style="font-size:18px; font-weight:600;"><asp:Label ID="Label3" runat="server" Text='<%# Bind("First_Name") %>' /> <asp:Label ID="Label2" runat="server" Text='<%# Bind("Last_Name") %>' /></td>
        </tr>
        <tr>
        <td>Gender</td>
            <td><asp:Label ID="Label1" runat="server" Text='<%# (Boolean)Eval("Gender") ? "Male":"Female"%>' /> </td>
        </tr>
	<tr class="row-a">
		<td>Admission Number</td>
		<td><asp:Label ID="Student_IDLabel" runat="server" Text='<%# Eval("Student_ID") %>' /></td>
	</tr>
	<tr class="row-b">
		<td>Course</td>
		<td><asp:Label ID="CourseLabel" runat="server" Text='<%# Bind("Course1") %>' /></td>
	</tr>
	<tr class="row-a">
		<td>Department</td>
		<td><asp:Label ID="DepartmentLabel" runat="server" Text='<%# Bind("Department1") %>' /></td>
	</tr>
	<tr class="row-b">
		<td>Year of</td>
		<td><asp:Label ID="YearLabel" runat="server" Text='<%# Bind("Year1") %>' /></td>
	</tr>
	<tr class="row-a">
		<td>Joining Year</td>
		<td><asp:Label ID="Year_of_JoiningLabel" runat="server" Text='<%# Bind("Year_of_Joining") %>' /></td>
	</tr>
	
</table>

<h3 class="h3block">Contact Details</h3>


           <table border=1>
	<tr class="row-a">
		<td>Current Address</td>
		<td style="height:80px; overflow-y:scroll;"><asp:Label ID="Current_AddressLabel" runat="server" Text='<%# Bind("Current_Address") %>' /></td>
	</tr>
	<tr class="row-b">
		<td>Per Address</td>
		<td style="height:80px; overflow-y:scroll;"><asp:Label ID="Per_AddressLabel" runat="server" Text='<%# Bind("Per_Address") %>' /></td>
	</tr>
    <tr class="row-a">
		<td>Email ID</td>
		<td><asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' /></td>
	</tr>
	<tr class="row-b">
		<td>Mobile Number</td>
		<td><asp:Label ID="Mobile_NumberLabel" runat="server" Text='<%# Bind("Mobile_Number") %>' /></td>
	</tr>
    
	<tr class="row-a">
		<td>Land Line</td>
		<td><asp:Label ID="Land_LineLabel" runat="server" Text='<%# Bind("Land_Line") %>' /></td>
	</tr>
</table>

<h3 class="h3block">Academic Details</h3>
            <table border=1>
	<tr class="row-a">
		<td>10th/CBSE Percentage </td>
		<td><asp:Label ID="_10thLabel" runat="server" Text='<%# Bind("tenth") %>' /></td>
	</tr>
	<tr class="row-b">
		<td>Inter/+2 Percentage</td>
		<td><asp:Label ID="InterLabel" runat="server" Text='<%# Bind("Inter") %>' /></td>
	</tr>
	<tr class="row-a">
		<td>Eamcet Rank/Graduation %</td>
		<td><asp:Label ID="Eamcet_RankLabel" runat="server" Text='<%# Bind("Eamcet_Rank") %>' /></td>
	</tr>
</table>
<table width="300px" class="tablea">
	<tr class="row-a">
		<td>1st Semester %</td>
		<td><asp:Label ID="Sem1Label" runat="server" Text='<%# Bind("Sem1") %>' /></td>
		<td>backlogs</td>
		<td><asp:Label ID="Sem1_backlogsLabel" runat="server" Text='<%# Bind("Sem1_backlogs") %>' /></td>
	</tr>
	<tr class="row-b">
		<td>2nd Semester %</td>
		<td><asp:Label ID="Sem2Label" runat="server" Text='<%# Bind("Sem2") %>' /></td>
		<td>backlogs</td>
		<td><asp:Label ID="Sem2_backlogsLabel" runat="server" Text='<%# Bind("Sem2_backlogs") %>' /></td>
	</tr>
	<tr class="row-a">
		<td>3rd Semester %</td>
		<td><asp:Label ID="Sem3Label" runat="server" Text='<%# Bind("Sem3") %>' /></td>
		<td>backlogs</td>
		<td><asp:Label ID="Sem3_backlogsLabel" runat="server" Text='<%# Bind("Sem3_backlogs") %>' /></td>
	</tr>
	<tr class="row-b">
		<td>4th Semester %</td>
		<td><asp:Label ID="Sem4Label" runat="server" Text='<%# Bind("Sem4") %>' /></td>
		<td>backlogs</td>
		<td><asp:Label ID="Sem4_backlogsLabel" runat="server" Text='<%# Bind("Sem4_backlogs") %>' /></td>
	</tr>
	<tr class="row-a">
		<td>5th Semester %</td>
		<td><asp:Label ID="Sem5Label" runat="server" Text='<%# Bind("Sem5") %>' /></td>
		<td>backlogs</td>
		<td><asp:Label ID="Sem5_backlogsLabel" runat="server" Text='<%# Bind("Sem5_backlogs") %>' /></td>
	</tr>
	<tr class="row-b">
		<td>6th Semester % </td>
		<td><asp:Label ID="Sem6Label" runat="server" Text='<%# Bind("Sem6") %>' /></td>
		<td>backlogs</td>
		<td><asp:Label ID="Sem6_backlogsLabel" runat="server" Text='<%# Bind("Sem6_backlogs") %>' /></td>
	</tr>
	<tr class="row-a">
		<td>7th Semester %</td>
		<td><asp:Label ID="Sem7Label" runat="server" Text='<%# Bind("Sem7") %>' /></td>
		<td>backlogs</td>
		<td><asp:Label ID="Sem7_backlogsLabel" runat="server" Text='<%# Bind("Sem7_backlogs") %>' /></td>
	</tr>
	<tr class="row-b">
		<td>8th Semester %</td>
		<td><asp:Label ID="Sem8Label" runat="server" Text='<%# Bind("Sem8") %>' /></td>
		<td>backlogs</td>
		<td><asp:Label ID="Sem8_backlogsLabel" runat="server" Text='<%# Bind("Sem8_backlogs") %>' /></td>
	</tr>
    <tr class="row-a" style="background-color:#AAC5E1;font-weight:bold;">
		<td>Overall Percentage</td>
		<td><asp:Label ID="Label4" runat="server" Text='<%# Bind("Overall") %>' /></td>
		<td>Total Backlogs</td>
		<td><asp:Label ID="Label5" runat="server" Text='<%# Bind("total_baklogs") %>' /></td>
	</tr>
</table>

<h3 class="h3block">Other Information</h3>
           <table>
           <tr>
           <td>
           
            Achievements
            </td>
            <td style="height:80px; overflow-y:scroll;">
            <asp:Label ID="achivementsLabel" runat="server" 
                Text='<%# Bind("achivements") %>' />
            </td>
        </tr>
        <tr>
          <td>
            Remarks</td>
            <td style="height:80px; overflow-y:scroll;"><asp:Label ID="RemarksLabel" runat="server" Text='<%# Bind("Remarks") %>' />
            </td>
    </tr>
           </table>
           
            </div>
            <div id="photo">
                <asp:Image ID="Image1" runat="server" Width="300px" ImageUrl='<%# Bind("img_url") %>' />
            </div>

        </ItemTemplate>
    </asp:FormView>
    
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:tandp_db_connection_string %>" 
        
        
        SelectCommand="SELECT Students.*, Courses.Course AS Course1, Departments.Department AS Department1, Years.Year AS Year1 FROM Students INNER JOIN Departments ON Students.Department = Departments.ID INNER JOIN Courses ON Students.Course = Courses.ID INNER JOIN Years ON Students.Year = Years.Year WHERE Students.Student_ID = @Student_ID">
        <SelectParameters>
            <asp:ControlParameter ControlID="RadComboBox1" Name="Student_ID" 
                PropertyName="SelectedValue" />
        </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />

        <asp:Button ID="Button1" runat="server" Text="Confirm" 
        onclick="Button1_Click" />
        <br />
        <h3 class="h3block">
    <asp:Label ID="Label6" runat="server" Text=""></asp:Label>
</h3>
        </ContentTemplate>


    </asp:UpdatePanel>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
    </asp:UpdateProgress>
</asp:Content>

