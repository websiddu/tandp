<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="Advanced Reports.aspx.cs" Inherits="admin_Advanced_Reports" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="sidebartop_placeholder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="sidebarbottom_placeholder" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="content_heading" Runat="Server">
    Advanced Reports
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="content_placeholder" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
        <telerik:RadFilter ID="RadFilter1" runat="server" 
            CssClass="RadFilter RadFilter_Windows7 RadFilter RadFilter_Default " 
            Skin="Windows7" FilterContainerID="RadGrid1">
        </telerik:RadFilter> 

        <br />

        <telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDataSource1" 
            GridLines="None" Skin="Windows7" AllowFilteringByColumn="True" 
            AllowPaging="True" AllowSorting="True" EnableHeaderContextMenu="True" 
            ShowGroupPanel="True">
            <ExportSettings FileName="sid_exported" ExportOnlyData="True" 
                HideStructureColumns="True" IgnorePaging="True" OpenInNewWindow="True">
                <Pdf PageWidth="17in" Producer="Siddhartha" 
                    Title="Training and Placemnet Cell" />
            </ExportSettings>
            <ClientSettings AllowDragToGroup="True">
                <Selecting AllowRowSelect="True" />
                <Scrolling AllowScroll="True" UseStaticHeaders="True" />
            </ClientSettings>
            <MasterTableView AutoGenerateColumns="False" 
                DataSourceID="SqlDataSource1" CommandItemDisplay="Top">
                <CommandItemSettings ExportToPdfText="Export to Pdf" 
                    ShowAddNewRecordButton="False" ShowExportToCsvButton="True" 
                    ShowExportToWordButton="True" ShowExportToExcelButton="True" 
                    ShowExportToPdfButton="True" />
                <RowIndicatorColumn>
                    <HeaderStyle Width="20px" />
                </RowIndicatorColumn>
                <ExpandCollapseColumn>
                    <HeaderStyle Width="20px" />
                </ExpandCollapseColumn>
                <Columns>
                    <telerik:GridBoundColumn DataField="Student_ID" HeaderText="Student_ID" 
                        ReadOnly="True" SortExpression="Student_ID" UniqueName="Student_ID">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Year_of_Joining" DataType="System.Int32" 
                        HeaderText="YOJ" SortExpression="Year_of_Joining" 
                        UniqueName="Year_of_Joining">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Email" HeaderText="Email" 
                        SortExpression="Email" UniqueName="Email">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="First_Name" HeaderText="First_Name" 
                        SortExpression="First_Name" UniqueName="First_Name">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Last_Name" 
                        HeaderText="Last_Name" SortExpression="Last_Name" 
                        UniqueName="Last_Name">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Expr1" HeaderText="Course" 
                        SortExpression="Expr1" UniqueName="Expr1">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Expr2" HeaderText="Department" 
                        SortExpression="Expr2" UniqueName="Expr2">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Expr3" DataType="System.Int32" 
                        HeaderText="Year" SortExpression="Expr3" UniqueName="Expr3">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Current_Address" HeaderText="Current_Address" 
                        SortExpression="Current_Address" UniqueName="Current_Address">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Mobile_Number" 
                        HeaderText="Mobile_Number" SortExpression="Mobile_Number" 
                        UniqueName="Mobile_Number">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="tenth" DataType="System.Double" 
                        HeaderText="tenth" SortExpression="tenth" UniqueName="tenth">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Inter" DataType="System.Double" 
                        HeaderText="Inter" SortExpression="Inter" UniqueName="Inter">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Eamcet_Rank" DataType="System.Double" 
                        HeaderText="Eamcet_Rank" SortExpression="Eamcet_Rank" 
                        UniqueName="Eamcet_Rank">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Sem1" DataType="System.Double" 
                        HeaderText="Sem1" SortExpression="Sem1" UniqueName="Sem1">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Sem2" DataType="System.Double" 
                        HeaderText="Sem2" SortExpression="Sem2" UniqueName="Sem2">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Sem3" DataType="System.Double" 
                        HeaderText="Sem3" SortExpression="Sem3" UniqueName="Sem3">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Sem4" DataType="System.Double" 
                        HeaderText="Sem4" SortExpression="Sem4" UniqueName="Sem4">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Sem5" DataType="System.Double" 
                        HeaderText="Sem5" SortExpression="Sem5" UniqueName="Sem5">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Sem6" DataType="System.Double" 
                        HeaderText="Sem6" SortExpression="Sem6" UniqueName="Sem6">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Sem7" DataType="System.Double" 
                        HeaderText="Sem7" SortExpression="Sem7" UniqueName="Sem7">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Sem8" DataType="System.Double" 
                        HeaderText="Sem8" SortExpression="Sem8" UniqueName="Sem8">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="achivements" HeaderText="achivements" 
                        SortExpression="achivements" UniqueName="achivements">
                    </telerik:GridBoundColumn>
                    <telerik:GridCheckBoxColumn DataField="Gender" DataType="System.Boolean" 
                        HeaderText="Gender" SortExpression="Gender" UniqueName="Gender">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridBoundColumn DataField="Overall" DataType="System.Double" 
                        HeaderText="Overall %" SortExpression="Overall" UniqueName="Overall">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="total_baklogs" DataType="System.Int32" 
                        HeaderText="Total backlogs" SortExpression="total_baklogs" 
                        UniqueName="total_baklogs">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
            <HeaderContextMenu CssClass="GridContextMenu GridContextMenu_Default" 
                EnableImageSprites="True">
            </HeaderContextMenu>
        </telerik:RadGrid>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:tandp_db_connection_string %>" 
            SelectCommand="SELECT Students.Student_ID, Students.Course, Students.Department, Students.Year, Students.Year_of_Joining, Students.Email, Students.Password, Students.First_Name, Students.Last_Name, Students.Current_Address, Students.Per_Address, Students.Mobile_Number, Students.Land_Line, Students.tenth, Students.Inter, Students.Eamcet_Rank, Students.Sem1, Students.Sem2, Students.Sem3, Students.Sem4, Students.Sem5, Students.Sem6, Students.Sem7, Students.Sem8, Students.Sem1_backlogs, Students.Sem2_backlogs, Students.Sem3_backlogs, Students.Sem4_backlogs, Students.Sem5_backlogs, Students.Sem6_backlogs, Students.Sem7_backlogs, Students.Sem8_backlogs, Students.img_url, Students.achivements, Students.Remarks, Students.Gender, Students.Overall, Students.total_baklogs, Courses.Course AS Expr1, Departments.Department AS Expr2, Years.Year AS Expr3 FROM Students INNER JOIN Departments ON Students.Department = Departments.ID INNER JOIN Courses ON Students.Course = Courses.ID INNER JOIN Years ON Students.Year = Years.Year">
        </asp:SqlDataSource>

        <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
            ContextTypeName="Datbase_ClassesDataContext" EntityTypeName="" 
            TableName="Students">
        </asp:LinqDataSource>


    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default">
    </telerik:RadAjaxLoadingPanel>
</asp:Content>

