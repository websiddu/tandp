using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.IO;
using System.Text;
using System.Web.Security;

public partial class admin_bulk_upload_students : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
      

    }

    private string GetConnectionString()
    {

        return System.Configuration.ConfigurationManager.ConnectionStrings["tandp_db_connection_string"].ConnectionString;

    }


    private void LoadDataToDatabase(string tableName, string fileFullPath, string delimeter,int count)
    {

        string sqlQuery = string.Empty;
        //StringBuilder sb = new StringBuilder();
        //sb.AppendFormat(string.Format("BULK INSERT {0} ", tableName));
        //sb.AppendFormat(string.Format(" FROM '{0}'", fileFullPath));
        //sb.AppendFormat(string.Format(" WITH ( FIELDTERMINATOR = '{0}' , ROWTERMINATOR = '\n' )", delimeter));
        //sqlQuery = sb.ToString();
        sqlQuery = "BULK INSERT Students  FROM '" + fileFullPath + "' WITH ( FIRSTROW = 2, MAXERRORS = 0,FIELDTERMINATOR = ',' , ROWTERMINATOR = '\n' )";
        using (SqlConnection sqlConn = new SqlConnection(GetConnectionString()))
        {
            sqlConn.Open();
            try
            {
                SqlCommand sqlCmd = new SqlCommand(sqlQuery, sqlConn);
                sqlCmd.ExecuteNonQuery();
                Label1.Text = string.Format("({0}) records has been loaded to the table {1}.", count, tableName);
            }
            catch (Exception ex)
            {
                Label2.Text = ex.Message.ToString();
                
            }
            sqlConn.Close();
        }


    }
    protected void BTNImport_Click(object sender, EventArgs e)
    {



        if (FileUpload1.HasFile)
        {

            FileInfo fileInfo = new FileInfo(FileUpload1.PostedFile.FileName);

            if (fileInfo.Name.Contains(".csv"))
            {

                string fileName = fileInfo.Name.Replace(".csv", "").ToString();

                string csvFilePath = Server.MapPath("~\\UploadedCSVFiles") + "\\" + fileInfo.Name;



                //Save the CSV file in the Server inside 'MyCSVFolder' 

                FileUpload1.SaveAs(csvFilePath);
                //Fetch the location of CSV file
                /*   string course = Convert.ToString(Request["course"]);
                string section = Convert.ToString(Request["section"]);



                string[] text = System.IO.File.ReadAllLines(csvFilePath);
                StringBuilder newFile = new StringBuilder();
                   foreach (string line in text)
                   {


                       String temp = line + "," + course + "," + section;
                       newFile.Append(temp + "\n");


                   }

                   File.WriteAllText(csvFilePath, newFile.ToString());*/



                string filePath = Server.MapPath("~\\UploadedCSVFiles") + "\\";

                string strSql = "SELECT * FROM [" + fileInfo.Name + "]";
                string strSql1 = "SELECT Student_ID,Password,Email,Course,Department,Year FROM [" + fileInfo.Name + "]";
                string strCSVConnString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + filePath + ";" + "Extended Properties='text;HDR=YES;'";
                // load the data from CSV to DataTable 
                OleDbDataAdapter adapter = new OleDbDataAdapter(strSql, strCSVConnString);
                OleDbDataAdapter adapter1 = new OleDbDataAdapter(strSql1, strCSVConnString);
                DataTable dtCSV = new DataTable();
                DataTable dtCSV1 = new DataTable();
                DataTable dtSchema = new DataTable();
                DataTable dtSchema1 = new DataTable();
                adapter.FillSchema(dtCSV, SchemaType.Mapped);
                adapter.Fill(dtCSV);
                adapter1.FillSchema(dtCSV1, SchemaType.Mapped);
                adapter1.Fill(dtCSV1);
               
                Boolean flag = true;
                Boolean flag_uniqkey = true;
                Datbase_ClassesDataContext db = new Datbase_ClassesDataContext();
                foreach (DataRow dr in dtCSV1.Rows)
                {
                   
                        if (dr[0].ToString() == "" || dr[1].ToString() == "" || dr[2].ToString() == "" || dr[3].ToString() == "" || dr[4].ToString() == "")
                        {
                            flag = false;

                        }
                        else
                        {
                            
                             var s1 = (from p in db.Students
                                    where p.Student_ID == dr[0].ToString() 
                                          select p).Count();
                             var s2 = (from p in db.Courses
                                       where p.ID == Convert.ToInt32(dr[3])
                                       select p).Count();
                             var s3 = (from p in db.Departments
                                       where p.ID == Convert.ToInt32(dr[4])
                                       select p).Count();
                             var s4 = (from p in db.Years
                                       where p.Year1 == Convert.ToInt32(dr[5])
                                       select p).Count();
                             if (s1 != 0 || s2 != 1 ||s3 != 1 || s4 != 1)
                             {
                                flag_uniqkey = false;
                            }

                        }
                    
                }

                if (flag == true && flag_uniqkey == true)
                {

                    if (dtCSV.Rows.Count > 0)
                    {
                        //CreateDatabaseTable(dtCSV, fileName);
                        //LBLError.Text = string.Format("The table ({0}) has been successfully created to the database.", fileName);
                        string fileFullPath = filePath + fileInfo.Name;
                        foreach (DataRow dr in dtCSV1.Rows)
                        {
                            try
                            {
                                Membership.CreateUser(dr[0].ToString(), dr[1].ToString(), dr[2].ToString());
                                Roles.AddUserToRole(dr[0].ToString(), "student");
                            }
                            catch
                            {
                                Label2.Text = "Some Error in the file unable to upload.. only few of the files users uploaded";

                            }
                        }
                        LoadDataToDatabase("Students", fileFullPath, ",", dtCSV.Rows.Count);
                        RadGrid1.DataSource = dtCSV1;
                        RadGrid1.DataBind();

                    }

                    else
                    {

                        Label2.Text = "File is empty.";

                    }

                }
                else
                {
                    if(flag == false){
                    Label2.Text += "Some Required Fields are missing; ";
                    }
                    if(flag_uniqkey == false){
                        Label2.Text += "Some user exists will same name!!!";

                }

                }

            }

            else
            {
                Label2.Text = "Unable to recognize file.";
            }
        }
        else
        {

            Label2.Text = "no file ";
        }
    }
}