using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using System.Timers;

public partial class s_updateimage : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

       if (!IsPostBack)
        {

            Image1.ImageUrl = "../student_images/default.jpg";
        }

        Datbase_ClassesDataContext db = new Datbase_ClassesDataContext();

        var img_url = (from p in db.Students
                      where p.Student_ID == Session["UserLogin"]
                      select p.img_url).Single();
        Image1.ImageUrl = img_url.ToString();

    }
    private object _dataItem = null;

    protected void RadButton1_Click(object sender, EventArgs e)
    {
       
        Image1.Visible = false;
        String url = Image1.ImageUrl;
        Image1.ImageUrl = url;
        Image1.Visible = true;

        String url1 = url.Remove(0, 3);
       // Image1.Attributes.Add("src", url1 + "?ts=" + System.DateTime.Now.Millisecond);


    }
    protected void RadAsyncUpload1_FileUploaded(object sender, Telerik.Web.UI.FileUploadedEventArgs e)
    {
        Datbase_ClassesDataContext db = new Datbase_ClassesDataContext();

        var img_url = (from p in db.Students
                       where p.Student_ID == Session["UserLogin"]
                       select p.img_url).Single();

        string photo_id = get_the_phots_id(Session["UserLogin"].ToString());

        String photo_path = "~/student_images/" + photo_id + e.File.GetExtension() + "?id=" + DateTime.Now.Millisecond;
        Image1.ImageUrl = photo_path;
        String photo_path1 = photo_path.Remove(0, 2);
        if (RadAsyncUpload1.UploadedFiles.Count != 0)
        {
            string targetFolder = RadAsyncUpload1.TargetFolder;
            e.File.SaveAs(Path.Combine(Server.MapPath(targetFolder), photo_id + e.File.GetExtension()));
        }

        SqlConnection connection = new SqlConnection(
        ConfigurationManager.ConnectionStrings["tandp_db_connection_string"].ConnectionString);


        try
        {

            String sqlstmt = " UPDATE Students SET img_url='" + photo_path + "' WHERE Student_ID='" + Session["UserLogin"].ToString() + "'";
            connection.Open();
            SqlCommand s1 = new SqlCommand(sqlstmt, connection);
            s1.ExecuteNonQuery();

            Label1.Text = "Successfully Updated!!!";
        }
        catch (Exception ex1)
        {
            Label1.Text = ex1.ToString();
        }
        connection.Close();
        
    }
    #region Web Form Designer generated code
    override protected void OnInit(EventArgs e)
    {
        //
        // CODEGEN: This call is required by the ASP.NET Web Form Designer.
        //

        base.OnInit(e);
    }

    /// <summary>
    ///        Required method for Designer support - do not modify
    ///        the contents of this method with the code editor.
    /// </summary>
    private void InitializeComponent()
    {


    }
    #endregion

    public object DataItem
    {
        get
        {
            return this._dataItem;
        }
        set
        {
            this._dataItem = value;
        }
    }

    public string get_the_phots_id(string strChange)
    {
        byte[] pass = Encoding.ASCII.GetBytes(strChange);
        String st = System.Convert.ToBase64String(pass, 0, pass.Length);
        return st;
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        Image1.Visible = false;
        String url = Image1.ImageUrl;
        Image1.ImageUrl = url;
        Image1.Visible = true;

        //String url1 = url.Remove(0, 3);
        //Image1.Attributes.Add("src", url1 + "?ts=" + System.DateTime.Now.Millisecond);
        Datbase_ClassesDataContext db = new Datbase_ClassesDataContext();

        var img_url = (from p in db.Students
                       where p.Student_ID == Session["UserLogin"]
                       select p.img_url).Single();
        Image1.ImageUrl = img_url.ToString();


    }
}