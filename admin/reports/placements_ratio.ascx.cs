using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using Telerik.Charting;

public partial class admin_reports_placements_ratio : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Datbase_ClassesDataContext db = new Datbase_ClassesDataContext();

        var y = from p in db.Placements
                group p by p.Student.Year into g
                select new
                {
                    Count = g.Count(),
                    Year = g.Key
                    
                };

        ChartSeries chartSeries = new ChartSeries();
        chartSeries.Name = "Percentages";
        chartSeries.Type = ChartSeriesType.Line;
        string st = "";
        foreach (var v in y)
        {
            if (v.Count != 0 || v.Count != null)
            {
                st = v.Year + "(" + v.Count +")";
                chartSeries.AddItem(Convert.ToDouble(v.Count), st);
            }
        }
        RadChart1.ChartTitle.TextBlock.Text = "Your Performance";
        RadChart1.Series.Add(chartSeries);
        RadGrid1.DataSource = y;
        RadGrid1.DataBind();
    }
}