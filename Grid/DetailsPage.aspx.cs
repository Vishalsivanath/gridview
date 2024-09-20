using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Grid
{
    public partial class DetailsPage : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                gridview();
            }
        }
        protected void gridview()
        {
            string un = Session["username"].ToString();
            string pw = Session["password"].ToString();
            SqlConnection sc = new SqlConnection(conn);
            SqlCommand cmd = new SqlCommand("Log", sc);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@username", un);
            cmd.Parameters.AddWithValue("@password", pw);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            SqlConnection sc = new SqlConnection(conn);
            SqlCommand cmd = new SqlCommand("employeDelete", sc);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@empid", id);
            sc.Open();
            cmd.ExecuteNonQuery();
            sc.Close();
            gridview();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("log.aspx");
        }

        //protected void btnedit_Click(object sender, EventArgs e)
        //{
        //    Button btn = (Button)sender;
        //    GridViewRow gvrow = (GridViewRow)btn.NamingContainer;
        //    Label lbl1 = (Label)gvrow.FindControl("lbltextId");
        //    Response.Redirect("MainPage.aspx?lbl1=" + lbl1.Text);
        //}


    }
}
