using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBoxEmail.Text == "" || TextBoxPassword.Text == "")
        {
            LabelWarning.Text = "Empty Email or Password";
        }
        else
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginConnectionString"].ConnectionString);
            con.Open();

            String test = "select count(*) from LoginInformation where Email='" + TextBoxEmail.Text + "'";
            SqlCommand com = new SqlCommand(test, con);
            int temp = Convert.ToInt32(com.ExecuteScalar().ToString());

            if (temp == 1)
            {
                test = "select Password from LoginInformation where Email='" + TextBoxEmail.Text + "'";
                com = new SqlCommand(test, con);
                String userPassword = com.ExecuteScalar().ToString().Replace(" ", "");
                if (userPassword == TextBoxPassword.Text)
                {
                    Session["new"] = TextBoxEmail.Text;
                    LabelWarning.Text = "";
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    LabelWarning.Text = "Incorrect Password";
                }
            }
            else
            {
                LabelWarning.Text = "Incorrect Email";
            }
            con.Close();
        }

        
    }
}