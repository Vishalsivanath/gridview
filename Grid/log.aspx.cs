using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Grid
{
    public partial class log : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUser.Text;
            string password = txtPassword.Text;

            SqlConnection sc = new SqlConnection(conn);
            SqlCommand cmd = new SqlCommand("Log", sc);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@username", username);
            cmd.Parameters.AddWithValue("@password", password);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Session["username"] = txtUser.Text;
                Session["password"] = txtPassword.Text;
                Response.Redirect("DetailsPage.aspx");
            }
        }

        protected void Forget_Click(object sender, EventArgs e)
        {
            Response.Redirect("Password recovery.aspx");
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("Registration.aspx");
        }

    }
}