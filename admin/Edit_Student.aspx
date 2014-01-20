<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="Edit_Student.aspx.cs" Inherits="admin_Edit_Student" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="sidebartop_placeholder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="sidebarbottom_placeholder" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="content_heading" Runat="Server">
Edit Student Details<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="content_placeholder" Runat="Server">
<telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
<style type="text/css">
.rconf
{
    border: 0px solid #CCCCCC;
    border-radius:0;
    margin:0;
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
<table>
    <tr>
    <td>
        Year of :
    </td>
    <td>
        <telerik:RadComboBox ID="RadComboBox2" runat="server" AutoPostBack="True" 
            DataSourceID="LinqDataSource4" DataTextField="Year1" DataValueField="Year1" 
            Skin="Windows7" onselectedindexchanged="RadComboBox2_SelectedIndexChanged">
        </telerik:RadComboBox>
    </td>
        <td>
            Student ID :
        </td>
        <td>
            <telerik:RadComboBox ID="RadComboBox1" Runat="server" AutoPostBack="True" 
                DataSourceID="SqlDataSource1" DataTextField="Student_ID" 
                DataValueField="Student_ID"  CssClass="rconf" 
                Height="180px" Skin="Windows7" 
                EmptyMessage="Select a Person.."
                EnableAutomaticLoadOnDemand="true"
                ItemsPerRequest="15"
                ShowMoreResultsBox="true" 
                EnableVirtualScrolling="true" 
                Filter="Contains"
                >
            </telerik:RadComboBox>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:tandp_db_connection_string %>" 
                SelectCommand="SELECT [Student_ID] FROM [Students] WHERE ([Year] = @Year)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RadComboBox2" Name="Year" 
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
</table>
<br />
  <asp:FormView ID="FormView1" runat="server" DataKeyNames="Student_ID" 
            DataSourceID="LinqDataSource1" style="margin-right: 0px" 
            DefaultMode="Edit" onitemupdated="FormView1_ItemUpdated1">
            <EditItemTemplate>
                 <h3 class="h3block">General Details</h3>
        <table>
        <tr>
            <td>Name</td>
            <td style="font-size:18px; font-weight:600;">
             <asp:TextBox ID="First_NameTextBox" runat="server" 
                    Text='<%# Bind("First_Name") %>' />
            <asp:TextBox ID="Last_NameTextBox" runat="server" 
                    Text='<%# Bind("Last_Name") %>' />
            
            </td>
        </tr>
        <tr>
        <td>Gender</td>
            <td>
                <asp:DropDownList ID="DropDownList4" runat="server" 
                    SelectedValue='<%# Bind("Gender") %>'>
                    <asp:ListItem Value="True">Male</asp:ListItem>
                    <asp:ListItem Value="False">Female</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
    <tr class="row-a">
        <td>Admission Number</td>
        <td style="font-size:18px;">
        <asp:Label ID="Student_IDLabel1" runat="server" 
                    Text='<%# Bind("Student_ID") %>' />
    </td>
    </tr>
    <tr class="row-b">
        <td>Course</td>
        <td>
            <asp:DropDownList ID="DropDownList1" runat="server" 
                    DataSourceID="LinqDataSource2" DataTextField="Course1" DataValueField="ID" 
                    SelectedValue='<%# Bind("Course") %>'>
                </asp:DropDownList>
        </td>
    </tr>
    <tr class="row-a">
        <td>Department</td>
        <td>
           <asp:DropDownList ID="DropDownList2" runat="server" 
                    DataSourceID="LinqDataSource3" DataTextField="Department1" DataValueField="ID" 
                    SelectedValue='<%# Bind("Department") %>'>
                </asp:DropDownList>
        </td>
    </tr>
    <tr class="row-b">
        <td>Year of</td>
        <td>
         <asp:DropDownList ID="DropDownList3" runat="server" 
                    DataSourceID="LinqDataSource4" DataTextField="Year1" DataValueField="Year1" 
                    SelectedValue='<%# Bind("Year") %>'>
                </asp:DropDownList>
        </td>
    </tr>
    <tr class="row-a">
        <td>Joining Year</td>
        <td><telerik:RadNumericTextBox ID="Year_of_JoiningTextBox" runat="server" Text='<%# Bind("Year_of_Joining") %>' MinValue="0"> 
            <NumberFormat DecimalDigits="0" GroupSeparator=""/>
        </telerik:RadNumericTextBox></td>
    </tr>
    
</table>

<h3 class="h3block">Contact Details</h3>


           <table border=1>
    <tr class="row-a">
        <td>Current Address</td>
        <td style="height:80px; overflow-y:scroll;">
        <asp:TextBox ID="Current_AddressTextBox" runat="server" Text='<%# Bind("Current_Address") %>' Height="80px" TextMode="MultiLine" Width="320px"  />
       </td>
    </tr>
    <tr class="row-b">
        <td>Per Address</td>
        <td style="height:80px; overflow-y:scroll;"><asp:TextBox ID="Per_AddressTextBox" runat="server" Text='<%# Bind("Per_Address") %>' TextMode="MultiLine" Height="80px"  Width="320px" /></td>
    </tr>
    <tr class="row-a">
        <td>Email ID</td>
        <td><asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' /></td>
    </tr>
    <tr class="row-b">
        <td>Mobile Number</td>
        <td><asp:TextBox ID="Mobile_NumberTextBox" runat="server" Text='<%# Bind("Mobile_Number") %>' /></td>
    </tr>
    
    <tr class="row-a">
        <td>Land Line</td>
        <td><asp:TextBox ID="Land_LineTextBox" runat="server" Text='<%# Bind("Land_Line") %>' /></td>
    </tr>
</table>

<h3 class="h3block">Academic Detials</h3>
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
        <td><telerik:RadNumericTextBox ID="Eamcet_RankTextBox" runat="server" Text='<%# Bind("Eamcet_Rank") %>' /></td>
    </tr>
</table>
<table width="350px">
    <tr class="row-a">
        <td>1st Semester %</td>
        <td><telerik:RadNumericTextBox  CssClass="width50" Width="50px"   MaxLength="50" MinValue="0" MaxValue="100"  ID="Sem1TextBox" runat="server" Text='<%# Bind("Sem1") %>' /></td>
        <td>backlogs</td>
        <td><telerik:RadNumericTextBox  CssClass="width50" Width="50px"   MaxLength="50" MinValue="0" MaxValue="100"  ID="Sem1_backlogsTextBox" runat="server" Text='<%# Bind("Sem1_backlogs") %>' /></td>
    </tr>
    <tr class="row-b">
        <td>2nd Semester %</td>
        <td><telerik:RadNumericTextBox  CssClass="width50" Width="50px"   MaxLength="50" MinValue="0" MaxValue="100"  ID="Sem2TextBox" runat="server" Text='<%# Bind("Sem2") %>' /></td>
        <td>backlogs</td>
        <td><telerik:RadNumericTextBox  CssClass="width50" Width="50px"   MaxLength="50" MinValue="0" MaxValue="100"  ID="Sem2_backlogsTextBox" runat="server" Text='<%# Bind("Sem2_backlogs") %>' /></td>
    </tr>
    <tr class="row-a">
        <td>3rd Semester %</td>
        <td><telerik:RadNumericTextBox  CssClass="width50" Width="50px"   MaxLength="50" MinValue="0" MaxValue="100"  ID="Sem3TextBox" runat="server" Text='<%# Bind("Sem3") %>' /></td>
        <td>backlogs</td>
        <td><telerik:RadNumericTextBox  CssClass="width50" Width="50px"   MaxLength="50" MinValue="0" MaxValue="100"  ID="Sem3_backlogsTextBox" runat="server" Text='<%# Bind("Sem3_backlogs") %>' /></td>
    </tr>
    <tr class="row-b">
        <td>4th Semester %</td>
        <td><telerik:RadNumericTextBox  CssClass="width50" Width="50px"   MaxLength="50" MinValue="0" MaxValue="100"  ID="Sem4TextBox" runat="server" Text='<%# Bind("Sem4") %>' /></td>
        <td>backlogs</td>
        <td><telerik:RadNumericTextBox  CssClass="width50" Width="50px"   MaxLength="50" MinValue="0" MaxValue="100"  ID="Sem4_backlogsTextBox" runat="server" Text='<%# Bind("Sem4_backlogs") %>' /></td>
    </tr>
    <tr class="row-a">
        <td>5th Semester %</td>
        <td><telerik:RadNumericTextBox  CssClass="width50" Width="50px"   MaxLength="50" MinValue="0" MaxValue="100"  ID="Sem5TextBox" runat="server" Text='<%# Bind("Sem5") %>' /></td>
        <td>backlogs</td>
        <td><telerik:RadNumericTextBox  CssClass="width50" Width="50px"   MaxLength="50" MinValue="0" MaxValue="100"  ID="Sem5_backlogsTextBox" runat="server" Text='<%# Bind("Sem5_backlogs") %>' /></td>
    </tr>
    <tr class="row-b">
        <td>6th Semester % </td>
        <td><telerik:RadNumericTextBox  CssClass="width50" Width="50px"   MaxLength="50" MinValue="0" MaxValue="100"  ID="Sem6TextBox" runat="server" Text='<%# Bind("Sem6") %>' /></td>
        <td>backlogs</td>
        <td><telerik:RadNumericTextBox  CssClass="width50" Width="50px"   MaxLength="50" MinValue="0" MaxValue="100"  ID="Sem6_backlogsTextBox" runat="server" Text='<%# Bind("Sem6_backlogs") %>' /></td>
    </tr>
    <tr class="row-a">
        <td>7th Semester %</td>
        <td><telerik:RadNumericTextBox  CssClass="width50" Width="50px"   MaxLength="50" MinValue="0" MaxValue="100"  ID="Sem7TextBox" runat="server" Text='<%# Bind("Sem7") %>' /></td>
        <td>backlogs</td>
        <td><telerik:RadNumericTextBox  CssClass="width50" Width="50px"   MaxLength="50" MinValue="0" MaxValue="100"  ID="Sem7_backlogsTextBox" runat="server" Text='<%# Bind("Sem7_backlogs") %>' /></td>
    </tr>
    <tr class="row-b">
        <td>8th Semester %</td>
        <td><telerik:RadNumericTextBox  CssClass="width50" Width="50px"   MaxLength="50" MinValue="0" MaxValue="100"  ID="Sem8TextBox" runat="server" Text='<%# Bind("Sem8") %>' /></td>
        <td>backlogs</td>
        <td><telerik:RadNumericTextBox  CssClass="width50" Width="50px"   MaxLength="50" MinValue="0" MaxValue="100"  ID="Sem8_backlogsTextBox" runat="server" Text='<%# Bind("Sem8_backlogs") %>' /></td>
    </tr>

    <tr class="row-a">
        <td>Overall Percentage</td>
        <td><telerik:RadNumericTextBox   CssClass="width50" Width="50px"   MaxLength="50" MinValue="0" MaxValue="100" ID="OverallTextBox" runat="server" Text='<%# Bind("Overall") %>' /></td>
        <td>Total Backlogs</td>
        <td><telerik:RadNumericTextBox CssClass="width50" Width="50px"   MaxLength="50" MinValue="0" MaxValue="100" ID="total_backlogsTextBox" runat="server" Text='<%# Bind("total_baklogs") %>' /></td>
    </tr>
</table>


<h3 class="h3block">Other Information</h3>
           <table>
           <tr>
           <td>
           
            Achievements
            </td>
            <td style="height:80px; overflow-y:scroll;">
            <asp:TextBox ID="achivementsTextBox" runat="server"  TextMode="MultiLine" Height="80px"  Width="320px"
                Text='<%# Bind("achivements") %>' />
            </td>
        </tr>
        <tr>
          <td>
            Remarks</td>
            <td style="height:80px; overflow-y:scroll;"><asp:TextBox TextMode="MultiLine" Height="80px"  Width="320px" ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' />
            </td>
    </tr>
           </table>
           <table>
            <tr>
              <td>
                <asp:Button id="Button1"
                  text="Update"
                  CausesValidation="True" 
                  commandname="Update"
                  runat="server"/>
              </td>
            </tr>
        </table>
            </div>
                
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
                Year1:
                <asp:TextBox ID="Year1TextBox" runat="server" Text='<%# Bind("Year1") %>' />
                <br />
                Department1:
                <asp:TextBox ID="Department1TextBox" runat="server" 
                    Text='<%# Bind("Department1") %>' />
                <br />
                Course1:
                <asp:TextBox ID="Course1TextBox" runat="server" Text='<%# Bind("Course1") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                Student_ID:
                <asp:Label ID="Student_IDLabel1" runat="server" 
                    Text='<%# Eval("Student_ID") %>' />
                <br />
                Course:
                <asp:Label ID="CourseLabel" runat="server" Text='<%# Bind("Course") %>' />
                <br />
                Department:
                <asp:Label ID="DepartmentLabel" runat="server" 
                    Text='<%# Bind("Department") %>' />
                <br />
                Year:
                <asp:Label ID="YearLabel" runat="server" Text='<%# Bind("Year") %>' />
                <br />
                Year_of_Joining:
                <asp:Label ID="Year_of_JoiningLabel" runat="server" 
                    Text='<%# Bind("Year_of_Joining") %>' />
                <br />
                Email:
                <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' />
                <br />
                First_Name:
                <asp:Label ID="First_NameLabel" runat="server" 
                    Text='<%# Bind("First_Name") %>' />
                <br />
                Last_Name:
                <asp:Label ID="Last_NameLabel" runat="server" Text='<%# Bind("Last_Name") %>' />
                <br />
                Current_Address:
                <asp:Label ID="Current_AddressLabel" runat="server" 
                    Text='<%# Bind("Current_Address") %>' />
                <br />
                Per_Address:
                <asp:Label ID="Per_AddressLabel" runat="server" 
                    Text='<%# Bind("Per_Address") %>' />
                <br />
                Mobile_Number:
                <asp:Label ID="Mobile_NumberLabel" runat="server" 
                    Text='<%# Bind("Mobile_Number") %>' />
                <br />
                Land_Line:
                <asp:Label ID="Land_LineLabel" runat="server" Text='<%# Bind("Land_Line") %>' />
                <br />
                tenth:
                <asp:Label ID="tenthLabel" runat="server" Text='<%# Bind("tenth") %>' />
                <br />
                Inter:
                <asp:Label ID="InterLabel" runat="server" Text='<%# Bind("Inter") %>' />
                <br />
                Eamcet_Rank:
                <asp:Label ID="Eamcet_RankLabel" runat="server" 
                    Text='<%# Bind("Eamcet_Rank") %>' />
                <br />
                Sem1:
                <asp:Label ID="Sem1Label" runat="server" Text='<%# Bind("Sem1") %>' />
                <br />
                Sem2:
                <asp:Label ID="Sem2Label" runat="server" Text='<%# Bind("Sem2") %>' />
                <br />
                Sem3:
                <asp:Label ID="Sem3Label" runat="server" Text='<%# Bind("Sem3") %>' />
                <br />
                Sem4:
                <asp:Label ID="Sem4Label" runat="server" Text='<%# Bind("Sem4") %>' />
                <br />
                Sem5:
                <asp:Label ID="Sem5Label" runat="server" Text='<%# Bind("Sem5") %>' />
                <br />
                Sem6:
                <asp:Label ID="Sem6Label" runat="server" Text='<%# Bind("Sem6") %>' />
                <br />
                Sem7:
                <asp:Label ID="Sem7Label" runat="server" Text='<%# Bind("Sem7") %>' />
                <br />
                Sem8:
                <asp:Label ID="Sem8Label" runat="server" Text='<%# Bind("Sem8") %>' />
                <br />
                Sem1_backlogs:
                <asp:Label ID="Sem1_backlogsLabel" runat="server" 
                    Text='<%# Bind("Sem1_backlogs") %>' />
                <br />
                Sem2_backlogs:
                <asp:Label ID="Sem2_backlogsLabel" runat="server" 
                    Text='<%# Bind("Sem2_backlogs") %>' />
                <br />
                Sem3_backlogs:
                <asp:Label ID="Sem3_backlogsLabel" runat="server" 
                    Text='<%# Bind("Sem3_backlogs") %>' />
                <br />
                Sem4_backlogs:
                <asp:Label ID="Sem4_backlogsLabel" runat="server" 
                    Text='<%# Bind("Sem4_backlogs") %>' />
                <br />
                Sem5_backlogs:
                <asp:Label ID="Sem5_backlogsLabel" runat="server" 
                    Text='<%# Bind("Sem5_backlogs") %>' />
                <br />
                Sem6_backlogs:
                <asp:Label ID="Sem6_backlogsLabel" runat="server" 
                    Text='<%# Bind("Sem6_backlogs") %>' />
                <br />
                Sem7_backlogs:
                <asp:Label ID="Sem7_backlogsLabel" runat="server" 
                    Text='<%# Bind("Sem7_backlogs") %>' />
                <br />
                Sem8_backlogs:
                <asp:Label ID="Sem8_backlogsLabel" runat="server" 
                    Text='<%# Bind("Sem8_backlogs") %>' />
                <br />
                img_url:
                <asp:Label ID="img_urlLabel" runat="server" Text='<%# Bind("img_url") %>' />
                <br />
                achivements:
                <asp:Label ID="achivementsLabel" runat="server" 
                    Text='<%# Bind("achivements") %>' />
                <br />
                Remarks:
                <asp:Label ID="RemarksLabel" runat="server" Text='<%# Bind("Remarks") %>' />
                <br />
                Password:
                <asp:Label ID="PasswordLabel" runat="server" Text='<%# Bind("Password") %>' />
                <br />
                Gender:
                <asp:CheckBox ID="GenderCheckBox" runat="server" 
                    Checked='<%# Bind("Gender") %>' />
                <br />
                Year1:
                <asp:Label ID="Year1Label" runat="server" Text='<%# Bind("Year1") %>' />
                <br />
                Department1:
                <asp:Label ID="Department1Label" runat="server" 
                    Text='<%# Bind("Department1") %>' />
                <br />
                Course1:
                <asp:Label ID="Course1Label" runat="server" Text='<%# Bind("Course1") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                    CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                    CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                    CommandName="New" Text="New" />
            </ItemTemplate>
        </asp:FormView>

   
    
    
        <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
            ContextTypeName="Datbase_ClassesDataContext" EnableDelete="True" 
            EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="Students" 
            Where="Student_ID == @Student_ID">
            <WhereParameters>
                <asp:ControlParameter ControlID="RadComboBox1" Name="Student_ID" 
                    PropertyName="SelectedValue" Type="String" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LinqDataSource2" runat="server" 
                    ContextTypeName="Datbase_ClassesDataContext" EntityTypeName="" 
                    TableName="Courses">
                </asp:LinqDataSource>
    <asp:LinqDataSource ID="LinqDataSource3" runat="server" 
                    ContextTypeName="Datbase_ClassesDataContext" EntityTypeName="" 
                    TableName="Departments">
                </asp:LinqDataSource>
                <asp:LinqDataSource ID="LinqDataSource4" runat="server" 
                    ContextTypeName="Datbase_ClassesDataContext" EntityTypeName="" 
                    TableName="Years">
                </asp:LinqDataSource>
   
        <div style="font-size:15px;margin:10px; background-color:#9CDF53; display:block;padding:10px;"><asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        </div>

     </telerik:RadAjaxPanel>


    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default">
    </telerik:RadAjaxLoadingPanel>

</asp:Content>

