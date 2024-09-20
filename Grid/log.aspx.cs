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
            string password = txtpassword.Text;

            SqlConnection sc = new SqlConnection(conn);
            SqlCommand cmd = new SqlCommand("Log", sc);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@username", username);
            cmd.Parameters.AddWithValue("@password", password);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count > 0 && username == dt.Rows[0][4].ToString() && password == dt.Rows[0][5].ToString() && dt.Rows[0][9].ToString() == "Active")
            {
                Session["username"] = txtUser.Text;
                Session["password"] = txtpassword.Text;
                Response.Redirect("DetailsPage.aspx");
            }
           else if (dt.Rows.Count > 0 && username == dt.Rows[0][4].ToString() &&  password == dt.Rows[0][5].ToString() && dt.Rows[0][9].ToString() == "Inactive")
            {
                
                lbme.Text = "U Account is blocked Contact Admin";

            }
            else
            {
                lbme.Text = "Invalid Account";
            }
            
        }

        protected void Forget_Click(object sender, EventArgs e)
        {
            Response.Redirect("Password recovery.aspx");
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("MainPage.aspx");
        }

    }
}
