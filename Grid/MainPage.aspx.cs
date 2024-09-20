using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Grid
{
    public partial class MainPage : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                int empid =Convert.ToInt32(Request.QueryString["empid"]);
                string name = Request.QueryString["name"];
                if (empid > 0 && name!=null)
                {
                    LoadData(empid);
                    btnSumbit.Visible = false;
                    rdl.Enabled = true;
                    rd2.Enabled = true;
                }
                else if (empid > 0)
                {
                    LoadData(empid);
                    btnSumbit.Visible = false;
                    rdl.Enabled = false;
                    rd2.Enabled = false;
                }
                else
                {
                    btnUpdate.Visible = false;
                    btnCancel.Visible = false;
                }
                BindCountries();
            }
        }
        private void LoadData(int empid)
        {
            SqlConnection sc = new SqlConnection(conn);
            SqlCommand cmd = new SqlCommand("GetEmployeeDetails", sc);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@empid", empid);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            txtName.Text = dt.Rows[0][0].ToString();
            string gender = dt.Rows[0][1].ToString();
            if (gender == "Female")
            {
                RdFemale.Checked = true;
                
            }
            else if(gender=="Male")
            {
                RdMale.Checked = true;
            }
            else
            {
                RdOthers.Checked = true;
            }
            ddlROle.SelectedValue = dt.Rows[0][2].ToString();
            ddlCountry.SelectedItem.Text = dt.Rows[0][3].ToString();
            ddlState.SelectedItem.Text = dt.Rows[0][4].ToString();
            ddlCity.SelectedItem.Text = dt.Rows[0][5].ToString();
            txtUsername.Text = dt.Rows[0][6].ToString();
            txtPassword.Text = dt.Rows[0][7].ToString();
            string status = dt.Rows[0][8].ToString();
            if(status=="Active")
            {
                rdl.Checked = true;
            }
            else 
            {
                rd2.Checked = true;
            }
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string gender;
            if (RdFemale.Checked)
            {
                gender = "Female";
            }
            else if (RdMale.Checked)
            {
                gender = "Male";
            }
            else
            {
                gender = "Others";
            }
            int status;
            if (rdl.Checked)
            {
                status = 1;
            }
            else
            {
                status = 0;
            }
            int empid = Convert.ToInt32(Request.QueryString["empid"]);
            SqlConnection sc = new SqlConnection(conn);
            SqlCommand cmd = new SqlCommand("UpdateEmploye", sc);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            sc.Open();
            cmd.Parameters.AddWithValue("@empid", empid);
            cmd.Parameters.AddWithValue("@empName",txtName.Text);
            cmd.Parameters.AddWithValue("@Gender",gender);
            cmd.Parameters.AddWithValue("@empRole",ddlROle.SelectedValue);
            cmd.Parameters.AddWithValue("@username", txtUsername.Text);
            cmd.Parameters.AddWithValue("@password", txtPassword.Text);
            cmd.Parameters.AddWithValue("@countryid",ddlCountry.SelectedValue );
            cmd.Parameters.AddWithValue("@stateid", ddlState.SelectedValue);
            cmd.Parameters.AddWithValue("@cityid", ddlCity.SelectedValue);
            cmd.Parameters.AddWithValue("@id", status);
            cmd.ExecuteNonQuery();
            sc.Close();
            Response.Redirect("Gridview.aspx");
        }



        protected void btn_Sumbit_Click(object sender, EventArgs e)
        {
            string gender;
            if (RdFemale.Checked)
            {
                gender = "Female";
            }
            else if (RdMale.Checked)
            {
                gender = "Male";
            }
            else
            {
                gender = "others";
            }
            int status;
            if (rdl.Checked)
            {
                status = 1;
            }
            else
            {
                status = 0;
            }
            try
            {
                SqlConnection sc = new SqlConnection(conn);
                SqlCommand cmd = new SqlCommand("AddEmploye", sc);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@empName", txtName.Text);
                SqlParameter sqlParameter = cmd.Parameters.AddWithValue("@Gender", gender);
                cmd.Parameters.AddWithValue("@empRole", ddlROle.SelectedValue);
                cmd.Parameters.AddWithValue("@username", txtUsername.Text);
                cmd.Parameters.AddWithValue("@password", txtPassword.Text);
                cmd.Parameters.AddWithValue("@cityid", Convert.ToInt32(ddlCity.SelectedValue));
                cmd.Parameters.AddWithValue("@stateid", Convert.ToInt32(ddlState.SelectedValue));
                cmd.Parameters.AddWithValue("@countryid", Convert.ToInt32(ddlCountry.SelectedValue));
                cmd.Parameters.AddWithValue("@id", status);
                sc.Open();
                cmd.ExecuteNonQuery();
                sc.Close();

            }
            catch (Exception ex)
            {
                throw (ex);
            }

            //Response.Redirect("Gridview.aspx");
        }
        protected void BindCountries()
        {
            SqlConnection sc = new SqlConnection(conn);
            SqlCommand cmd = new SqlCommand("GetAllCountries", sc);

            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            sc.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            ddlCountry.DataSource = dr;
            ddlCountry.DataTextField = "Country";
            ddlCountry.DataValueField = "Countryid";
            ddlCountry.DataBind();
            ddlCountry.Items.Insert(0, new ListItem("Select Country", "0"));

        }
        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(ddlCountry.SelectedValue);
            if (id > 0)
            {
                BindStates(id);
            }
            else
            {
                ddlState.Items.Clear();
                ddlState.Items.Add(new ListItem("Select State", "0"));
                ddlCity.Items.Clear();
                ddlCity.Items.Add(new ListItem("Select City", "0"));
            }
        }
        protected void BindStates(int id)
        {
            SqlConnection sc = new SqlConnection(conn);
            SqlCommand cmd = new SqlCommand("GetAllStates", sc);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", id);
            sc.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            ddlState.DataSource = dr;
     
            ddlState.DataTextField = "state";
            ddlState.DataValueField = "StateId";
            ddlState.DataBind();
            ddlState.Items.Insert(0, new ListItem("--Select State--", "0"));
        }

        protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(ddlState.SelectedValue);
            if (id > 0)
            {
                BindCities(id);
            }
            else
            {
                ddlCity.Items.Clear();
                ddlCity.Items.Add(new ListItem("Select City", "0"));
            }
        }

        protected void BindCities(int id)
        {
            SqlConnection sc = new SqlConnection(conn);
            SqlCommand cmd = new SqlCommand("GetAllCities", sc);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Stateid", id);
            sc.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            ddlCity.DataSource = dr;
            ddlCity.DataTextField = "city";
            ddlCity.DataValueField = "Cityid";
            ddlCity.DataBind();
            ddlCity.Items.Insert(0, new ListItem("--Select City--", "0"));
        }
    }
}
