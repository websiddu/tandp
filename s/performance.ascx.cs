using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using System.Collections;
using Telerik.Charting;
using Telerik.Web.UI;

public partial class s_performance : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Datbase_ClassesDataContext db = new Datbase_ClassesDataContext();

        var y = from p in db.Students
                where p.Student_ID == Session["UserLogin"].ToString()
                select new
                {
                    p.tenth,
                    p.Inter,
                    p.Eamcet_Rank,
                    p.Sem1,
                    p.Sem2,
                    p.Sem3,
                    p.Sem4,
                    p.Sem5,
                    p.Sem6,
                    p.Sem7,
                    p.Sem8
                };
        ArrayList yaxis = new ArrayList();
        ArrayList xaxis = new ArrayList();
        ChartSeries chartSeries = new ChartSeries();
        chartSeries.Name = "%";
        chartSeries.Type = ChartSeriesType.Line;
        // add new items to the series,
        // passing a value and a label string
        foreach (var v in y)
        {
            if (v.tenth != 0 || v.tenth != null)
            {
                yaxis.Add(v.tenth);
                chartSeries.AddItem(Convert.ToDouble(v.tenth), "ssc");
                xaxis.Add("ssc/matriculation");
            }
            if (v.Inter != 0 || v.Inter != null)
            {
                yaxis.Add(v.Inter);
                chartSeries.AddItem(Convert.ToDouble(v.Inter), "+2");
                xaxis.Add("Inter/+1");
            }
            if (v.Eamcet_Rank != 0 || v.Eamcet_Rank != null)
            {
                yaxis.Add(v.Eamcet_Rank);
                if (Convert.ToDouble(v.Eamcet_Rank) < 100)
                {
                    chartSeries.AddItem(Convert.ToDouble(v.Eamcet_Rank), "Graduation");
                }
                xaxis.Add("Graduation");
            }
            if (v.Sem1 != 0 || v.Sem1 != null)
            {
                yaxis.Add(v.Sem1);
                chartSeries.AddItem(Convert.ToDouble(v.Sem1), "Sem1");
                xaxis.Add("Sem1");
            }
            if (v.Sem2 != 0 || v.Sem2 != null)
            {
                yaxis.Add(v.Sem2);
                chartSeries.AddItem(Convert.ToDouble(v.Sem2), "Sem2");
                xaxis.Add("Sem2");
            }
            if (v.Sem3 != 0 || v.Sem3 != null)
            {
                yaxis.Add(v.Sem3);
                chartSeries.AddItem(Convert.ToDouble(v.Sem3), "Sem3");
                xaxis.Add("Sem3");
            }
            if (v.Sem4 != 0 || v.Sem4 != null)
            {
                yaxis.Add(v.Sem4);
                chartSeries.AddItem(Convert.ToDouble(v.Sem4), "Sem4");
                xaxis.Add("Sem4");
            }
            if (v.Sem5 != 0 || v.Sem5 != null)
            {
                yaxis.Add(v.Sem5);
                chartSeries.AddItem(Convert.ToDouble(v.Sem5), "Sem5");
                xaxis.Add("Sem5");
            }
            if (v.Sem6 != 0 || v.Sem6 != null)
            {
                yaxis.Add(v.Sem6);
                chartSeries.AddItem(Convert.ToDouble(v.Sem6), "Sem6");
                xaxis.Add("Sem6");
            }
            if (v.Sem7 != 0 || v.Sem7 != null)
            {
                yaxis.Add(v.Sem7);
                chartSeries.AddItem(Convert.ToDouble(v.Sem7), "Sem7");
                xaxis.Add("Sem7");
            }
            if (v.Sem8 != 0 || v.Sem8 != null)
            {
                yaxis.Add(v.Sem8);
                chartSeries.AddItem(Convert.ToDouble(v.Sem8), "Sem8");
                xaxis.Add("Sem8");
            }


        }

        //RadChart1.DataSource = yaxis;
        RadChart1.ChartTitle.TextBlock.Text = "Your Performance";
        RadChart1.Series.Add(chartSeries);


    }
    protected void RadChart1_Click(object sender, Telerik.Charting.ChartClickEventArgs args)
    {

    }
}