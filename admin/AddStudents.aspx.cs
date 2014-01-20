using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using System.Web.Security;

public partial class admin_AddStudents : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
 
    protected void Button1_Click(object sender, EventArgs e)
    {
        Datbase_ClassesDataContext db = new Datbase_ClassesDataContext();
        Student st = new Student();
        st.Student_ID = TextBox1.Text;
        st.Year = Convert.ToInt32(DropDownList1.SelectedValue);
        st.Course = Convert.ToInt32(DropDownList2.SelectedValue);
        st.Department = Convert.ToInt32(DropDownList3.SelectedValue);
        st.Email = TextBox3.Text;
        st.Password = TextBox2.Text;
        st.tenth = 0;
        st.Inter = 0;
        st.Eamcet_Rank = 0;
        st.Sem1 = 0;
        st.Sem2 = 0;
        st.Sem3 = 0;
        st.Sem4 = 0;
        st.Sem5 = 0;
        st.Sem6 = 0;
        st.Sem7 = 0;
        st.Sem8 = 0;
        st.Sem1_backlogs = 0;
        st.Sem2_backlogs = 0;
        st.Sem3_backlogs = 0;
        st.Sem4_backlogs = 0;
        st.Sem5_backlogs = 0;
        st.Sem6_backlogs = 0;
        st.Sem7_backlogs = 0;
        st.Sem8_backlogs = 0;
        st.total_baklogs = 0;
        st.Overall = 0;
        st.Gender = true;
        st.img_url = "~/student_images/default.jpg";

        try
        {
            db.Students.InsertOnSubmit(st);
            db.SubmitChanges();
            Membership.CreateUser(TextBox1.Text, TextBox2.Text, TextBox3.Text);
            Roles.AddUserToRole(TextBox1.Text, "student");
            Label1.Text = "Sucessfully Updated";
        }
        catch(Exception ex)
        {
            Label1.Text = ex.Message.ToString();

        }
    }
}