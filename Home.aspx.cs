using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            divShowMine.Visible = false;
            divAdmin.Visible = false;
            divAddUpdateUser.Visible = false;
            divShowProjects.Visible = false;
            divProjectManager.Visible = false;
            divAddProject.Visible = false;
            divAssignResourcePerson.Visible = false;
        }
        if (Session["new"] == null)
        {
            Response.Redirect(Request.UrlReferrer.ToString());
        }
        else
        {
            
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginConnectionString"].ConnectionString);
            con.Open();

            String test = "select Designation from LoginInformation where Email='" + Session["new"] + "'";
            SqlCommand com = new SqlCommand(test, con);
            String designation = com.ExecuteScalar().ToString().Trim();

            test = "select Name from LoginInformation where Email='" + Session["new"] + "'";
            com = new SqlCommand(test, con);
            String name = com.ExecuteScalar().ToString().Trim();


            welcomeLabel.Text = "Welcome [" + name+"]";
            if (designation == "IT Admin")
            {
                divAdmin.Visible = true;
            }

            else if (designation == "Project Manager")
            {
                divProjectManager.Visible = true;
            }
            else
            {
                divProjectManager.Visible = true;
                AssignUser.Visible = false;
                AddProject.Visible = false;
            }


            con.Close();
        }
    }
    protected void AddUpdateUser_Click(object sender, EventArgs e)
    {
        divAddUpdateUser.Visible = true;
        divShowProjects.Visible = false;
    }
    protected void ShowProjects_Click(object sender, EventArgs e)
    {
        divAddUpdateUser.Visible = false;
        divShowProjects.Visible = true;
    }
    protected void SaveUser_Click(object sender, EventArgs e)
    {
        if (UserName.Text == "" || UserEmail.Text == "" || UserPassword.Text == "")
        {
            labelWarning.Text = "*Empty Fields";
        }

        else if (UserStatus.SelectedIndex == -1)
        {
            labelWarning.Text = "*Status not selected";
        }
        else if (UserDesignation.SelectedIndex == -1)
        {
            labelWarning.Text = "*Designation not selected";
        }
        else
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginConnectionString"].ConnectionString);
            con.Open();

            String test = "select count(*) from LoginInformation where Email='" + UserEmail.Text + "'";
            SqlCommand com = new SqlCommand(test, con);
            int temp = Convert.ToInt32(com.ExecuteScalar().ToString().Trim());
            if (temp == 1)
            {
                labelWarning.Text = "User already exist!";
            }
            else
            {
                test = "insert into LoginInformation (Name, Email, Password, Status, Designation) values (@name, @email, @password, @status, @designation)";
                com = new SqlCommand(test, con);
                com.Parameters.AddWithValue("@name", UserName.Text);
                com.Parameters.AddWithValue("@email", UserEmail.Text);
                com.Parameters.AddWithValue("@password", UserPassword.Text);
                com.Parameters.AddWithValue("@status", UserStatus.SelectedItem.ToString());
                com.Parameters.AddWithValue("@designation", UserDesignation.SelectedItem.ToString());
                com.ExecuteNonQuery();
                labelWarning.Text = "User added successfully";
            }
            



            con.Close();
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        UserPassword.Text = UserEmail.Text + "123";
    }
    protected void UpdateUser_Click(object sender, EventArgs e)
    {
        if (UserName.Text == "" || UserEmail.Text == "" || UserPassword.Text == "")
        {
            labelWarning.Text = "*Empty Fields";
        }

        else if (UserStatus.SelectedIndex == -1)
        {
            labelWarning.Text = "*Status not selected";
        }
        else if (UserDesignation.SelectedIndex == -1)
        {
            labelWarning.Text = "*Designation not selected";
        }
        else
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginConnectionString"].ConnectionString);
            con.Open();

            String test = "select count(*) from LoginInformation where Email='" + UserEmail.Text + "'";
            SqlCommand com = new SqlCommand(test, con);
            int temp = Convert.ToInt32(com.ExecuteScalar().ToString().Trim());
            if (temp == 1)
            {

                test = "update LoginInformation set Name='" + UserName.Text + "', Password='" + UserPassword.Text + "', Status='" + UserStatus.SelectedItem.ToString() +"', Designation='" +UserDesignation.SelectedItem.ToString()+ "' where Email='" +UserEmail.Text+ "'";
                com = new SqlCommand(test, con);
                com.ExecuteNonQuery();
                labelWarning.Text = "User updated successfully";
            }
            else
            {
                labelWarning.Text = "User doesn't exist!";
            }
            con.Close();
        }




        
    }
    protected void logoutUser_Click(object sender, EventArgs e)
    {
        Session["new"] = null;
        Response.Redirect("Login.aspx");
    }
    protected void ShowMine_Click(object sender, EventArgs e)
    {
        divAddProject.Visible = false;
        divAssignResourcePerson.Visible = false;
        divShowMine.Visible = true;

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginConnectionString"].ConnectionString);
        con.Open();
        String ss = Session["new"].ToString().Trim() ;
        String test = "select ProjectName from ProjectResourcePerson where ResourcePerson In (select Name from LoginInformation where Email='"+ Session["new"] +"')";
        SqlCommand com = new SqlCommand(test, con);
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds);  // fill dataset
        ProjectList3.DataTextField = ds.Tables[0].Columns["ProjectName"].ToString(); // text field name of table dispalyed in dropdown
        /*ProjectList.DataValueField = ds.Tables[0].Columns["id"].ToString();             // to retrive specific  textfield name */
        ProjectList3.DataSource = ds.Tables[0];      //assigning datasource to the dropdownlist
        ProjectList3.DataBind();
        con.Close();

        string cs = ConfigurationManager.ConnectionStrings["LoginConnectionString"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("select ProjectResourcePerson.ProjectName, ProjectInformation.CodeName, ProjectInformation.Description, ProjectInformation.Duration, ProjectInformation.Status from ProjectResourcePerson JOIN ProjectInformation ON ProjectResourcePerson.ProjectName=ProjectInformation.Name and ProjectResourcePerson.ResourcePerson In (select Name from LoginInformation where Email='" + Session["new"] + "')", conn);
            //SqlCommand cmd = new SqlCommand("Select * from TimeTable", con);
            conn.Open();
            MyProjectList.DataSource = cmd.ExecuteReader();
            MyProjectList.DataBind();
            conn.Close();
        }
        

    }
    protected void AddProject_Click(object sender, EventArgs e)
    {
        divAddProject.Visible = true;
        divAssignResourcePerson.Visible = false;
        divShowMine.Visible = false;
    }


    protected void AssignUser_Click(object sender, EventArgs e)
    {
        divAddProject.Visible = false;
        divAssignResourcePerson.Visible = true;
        divShowMine.Visible = false;

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginConnectionString"].ConnectionString);
        con.Open();

        String test = "select Name from ProjectInformation";
        SqlCommand com = new SqlCommand(test, con);
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds);  // fill dataset
        ProjectList.DataTextField = ds.Tables[0].Columns["Name"].ToString(); // text field name of table dispalyed in dropdown
        /*ProjectList.DataValueField = ds.Tables[0].Columns["id"].ToString();             // to retrive specific  textfield name */
        ProjectList.DataSource = ds.Tables[0];      //assigning datasource to the dropdownlist
        ProjectList.DataBind();

        test = "select Name from ProjectInformation";
        com = new SqlCommand(test, con);
        da = new SqlDataAdapter(com);
        ds = new DataSet();
        da.Fill(ds);  // fill dataset
        ProjectList2.DataTextField = ds.Tables[0].Columns["Name"].ToString(); // text field name of table dispalyed in dropdown
        /*ProjectList.DataValueField = ds.Tables[0].Columns["id"].ToString();             // to retrive specific  textfield name */
        ProjectList2.DataSource = ds.Tables[0];      //assigning datasource to the dropdownlist
        ProjectList2.DataBind();

        test = "select Name, Designation from LoginInformation where Designation not in('IT Admin')";
        com = new SqlCommand(test, con);
        da = new SqlDataAdapter(com);
        ds = new DataSet();
        da.Fill(ds);  // fill dataset
        ResourcePersonList.DataTextField = ds.Tables[0].Columns["Name"].ToString(); // text field name of table dispalyed in dropdown
        /*ProjectList.DataValueField = ds.Tables[0].Columns["id"].ToString();             // to retrive specific  textfield name */
        ResourcePersonList.DataSource = ds.Tables[0];      //assigning datasource to the dropdownlist
        ResourcePersonList.DataBind();


        con.Close();

    }
    protected void AddProjectDescription_Click(object sender, EventArgs e)
    {
        if (ProjectName.Text == "" || ProjectCodeName.Text == "" || ProjectDescription.Text == "")
        {
            labelWarning2.Text = "*fill all the fields!";
        }
        else if (StartDate.Text == "" || EndDate.Text == "")
        {
            labelWarning2.Text = "*Select a start and end date!";
        }
        else if (ProjectStatus.SelectedIndex == -1)
        {
            labelWarning2.Text = "Select a status!";
        }
        else
        {
            Dictionary<String, int> cal = new Dictionary<String, int>();
            cal.Add("Jan", 1);
            cal.Add("Feb", 2);
            cal.Add("Mar", 3);
            cal.Add("Apr", 4);
            cal.Add("May", 5);
            cal.Add("Jun", 6);
            cal.Add("Jul", 7);
            cal.Add("Aug", 8);
            cal.Add("Sep", 9);
            cal.Add("Oct", 10);
            cal.Add("Nov", 11);
            cal.Add("Dec", 12);
            String startDate = StartDate.Text.Trim();
            String endDate = EndDate.Text.Trim();
            String month1;
            String day1;
            String year1;
            String month2;
            String day2;
            String year2;
            char[] chars = { startDate[4], startDate[5], startDate[6] };
            month1 = new String(chars);
            char[] chars2 = { endDate[4], endDate[5], endDate[6] };
            month2 = new String(chars2);
            char[] chars3 = { startDate[8], startDate[9]};
            day1 = new String(chars3);
            char[] chars4 = { endDate[8], endDate[9]};
            day2 = new String(chars4);
            char[] chars5 = { startDate[11], startDate[12], startDate[13], startDate[14] };
            year1 = new String(chars5);
            char[] chars6 = { endDate[11], endDate[12], endDate[13], endDate[14] };
            year2 = new String(chars6);
            DateTime sDate = new DateTime(Convert.ToInt32(year1), Convert.ToInt32(cal[month1]), Convert.ToInt32(day1));
            DateTime eDate = new DateTime(Convert.ToInt32(year2), Convert.ToInt32(cal[month2]), Convert.ToInt32(day2));
            int totalDays = (eDate - sDate).Days;
            //Response.Write(month1 + month2 + day1 + day2 + year1 + year2 + totalDays.ToString());
            ProjectDuration.Text = totalDays.ToString();






            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginConnectionString"].ConnectionString);
            con.Open();

            String test = "select count(*) from ProjectInformation where Name='" + ProjectName.Text + "'";
            SqlCommand com = new SqlCommand(test, con);
            int temp = Convert.ToInt32(com.ExecuteScalar().ToString().Trim());
            if (temp == 1)
            {
                labelWarning2.Text = "Project already Exist!";
                
            }
            else
            {
                test = "insert into ProjectInformation (Name, CodeName, Description, StartDate, EndDate, Duration, Status) values (@name, @codeName, @description, @startDate, @endDate, @duration, @status)";
                com = new SqlCommand(test, con);
                com.Parameters.AddWithValue("@name", ProjectName.Text);
                com.Parameters.AddWithValue("@codeName", ProjectCodeName.Text);
                com.Parameters.AddWithValue("@description", ProjectDescription.Text);
                com.Parameters.AddWithValue("@startDate", StartDate.Text);
                com.Parameters.AddWithValue("@endDate", EndDate.Text);
                com.Parameters.AddWithValue("@duration", ProjectDuration.Text);
                com.Parameters.AddWithValue("@status", ProjectStatus.SelectedItem.ToString());
                com.ExecuteNonQuery();
                labelWarning2.Text = "Project added successfully";
            }
            con.Close();
        }

    }
    protected void UpdateProjectDescription_Click(object sender, EventArgs e)
    {
        if (ProjectName.Text == "" || ProjectCodeName.Text == "" || ProjectDescription.Text == "")
        {
            labelWarning2.Text = "*fill all the fields!";
        }
        else if (StartDate.Text == "" || EndDate.Text == "")
        {
            labelWarning2.Text = "*Select a start and end date!";
        }
        else if (ProjectStatus.SelectedIndex == -1)
        {
            labelWarning2.Text = "Select a status!";
        }
        else
        {
            Dictionary<String, int> cal = new Dictionary<String, int>();
            cal.Add("Jan", 1);
            cal.Add("Feb", 2);
            cal.Add("Mar", 3);
            cal.Add("Apr", 4);
            cal.Add("May", 5);
            cal.Add("Jun", 6);
            cal.Add("Jul", 7);
            cal.Add("Aug", 8);
            cal.Add("Sep", 9);
            cal.Add("Oct", 10);
            cal.Add("Nov", 11);
            cal.Add("Dec", 12);
            String startDate = StartDate.Text.Trim();
            String endDate = EndDate.Text.Trim();
            String month1;
            String day1;
            String year1;
            String month2;
            String day2;
            String year2;
            char[] chars = { startDate[4], startDate[5], startDate[6] };
            month1 = new String(chars);
            char[] chars2 = { endDate[4], endDate[5], endDate[6] };
            month2 = new String(chars2);
            char[] chars3 = { startDate[8], startDate[9] };
            day1 = new String(chars3);
            char[] chars4 = { endDate[8], endDate[9] };
            day2 = new String(chars4);
            char[] chars5 = { startDate[11], startDate[12], startDate[13], startDate[14] };
            year1 = new String(chars5);
            char[] chars6 = { endDate[11], endDate[12], endDate[13], endDate[14] };
            year2 = new String(chars6);
            DateTime sDate = new DateTime(Convert.ToInt32(year1), Convert.ToInt32(cal[month1]), Convert.ToInt32(day1));
            DateTime eDate = new DateTime(Convert.ToInt32(year2), Convert.ToInt32(cal[month2]), Convert.ToInt32(day2));
            int totalDays = (eDate - sDate).Days;
            //Response.Write(month1 + month2 + day1 + day2 + year1 + year2 + totalDays.ToString());
            ProjectDuration.Text = totalDays.ToString();






            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginConnectionString"].ConnectionString);
            con.Open();

            String test = "select count(*) from ProjectInformation where Name='" + ProjectName.Text + "'";
            SqlCommand com = new SqlCommand(test, con);
            int temp = Convert.ToInt32(com.ExecuteScalar().ToString().Trim());
            if (temp == 1)
            {
                test = "update ProjectInformation set Name='" + ProjectName.Text + "', CodeName='"+ ProjectCodeName.Text +"', Description='"+ ProjectDescription.Text +"', StartDate='"+ StartDate.Text +"', EndDate='"+ EndDate.Text +"', Duration='"+ totalDays +"', Status='"+ ProjectStatus.SelectedItem.ToString() +"' where name='"+ ProjectName.Text +"'";
                //test = "insert into ProjectInformation (Name, CodeName, Description, StartDate, EndDate, Duration, Status) values (@name, @codeName, @description, @startDate, @endDate, @duration, @status)";
                com = new SqlCommand(test, con);
                com.ExecuteNonQuery();
                labelWarning2.Text = "Project updated successfully";

            }
            else
            {
               
                labelWarning2.Text = "There has no project with this name";
            }
            con.Close();
        }
    }
    protected void browseFile_Click(object sender, EventArgs e)
    {

    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Dictionary<String, int> cal = new Dictionary<String, int>();
        cal.Add("Jan", 1);
        cal.Add("Feb", 2);
        cal.Add("Mar", 3);
        cal.Add("Apr", 4);
        cal.Add("May", 5);
        cal.Add("Jun", 6);
        cal.Add("Jul", 7);
        cal.Add("Aug", 8);
        cal.Add("Sep", 9);
        cal.Add("Oct", 10);
        cal.Add("Nov", 11);
        cal.Add("Dec", 12);
        String startDate = StartDate.Text.Trim();
        String endDate = EndDate.Text.Trim();
        String month1;
        String day1;
        String year1;
        String month2;
        String day2;
        String year2;
        char[] chars = { startDate[4], startDate[5], startDate[6] };
        month1 = new String(chars);
        char[] chars2 = { endDate[4], endDate[5], endDate[6] };
        month2 = new String(chars2);
        char[] chars3 = { startDate[8], startDate[9] };
        day1 = new String(chars3);
        char[] chars4 = { endDate[8], endDate[9] };
        day2 = new String(chars4);
        char[] chars5 = { startDate[11], startDate[12], startDate[13], startDate[14] };
        year1 = new String(chars5);
        char[] chars6 = { endDate[11], endDate[12], endDate[13], endDate[14] };
        year2 = new String(chars6);
        DateTime sDate = new DateTime(Convert.ToInt32(year1), Convert.ToInt32(cal[month1]), Convert.ToInt32(day1));
        DateTime eDate = new DateTime(Convert.ToInt32(year2), Convert.ToInt32(cal[month2]), Convert.ToInt32(day2));
        int totalDays = (eDate - sDate).Days;
        //Response.Write(month1 + month2 + day1 + day2 + year1 + year2 + totalDays.ToString());
        ProjectDuration.Text = totalDays.ToString();
    }
    protected void AddPerson_Click(object sender, EventArgs e)
    {
        String proName = ProjectList.SelectedItem.ToString();
        String ResPerson = ResourcePersonList.SelectedItem.ToString();




        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginConnectionString"].ConnectionString);
        con.Open();

        String temp = "select count(*) from ProjectResourcePerson where ProjectName='" +proName+ "' and ResourcePerson='" +ResPerson+ "'";
        SqlCommand com = new SqlCommand(temp, con);
        int val = Convert.ToInt32(com.ExecuteScalar().ToString());
        if (val == 1)
        {
            labelWarning3.Text = "Resource Person Already Added";
        }
        else
        {

            String test = "select Email from LoginInformation where Name='" + ResPerson + "'";
            com = new SqlCommand(test, con);
            String email = com.ExecuteScalar().ToString().Trim();
            test = "select Designation from LoginInformation where Name='" + ResPerson + "'";
            com = new SqlCommand(test, con);
            String designation = com.ExecuteScalar().ToString().Trim();

            test = "insert into ProjectResourcePerson (ProjectName, ResourcePerson, Email, Designation) values ('" + proName + "', '" + ResPerson + "', '" + email + "', '" + designation + "')";
            com = new SqlCommand(test, con);
            com.ExecuteNonQuery();
            labelWarning3.Text = "Resource Person Added successfully";
        }


        con.Close();
    }


    protected void btnViewMember_Click(object sender, EventArgs e)
    {
        string cs = ConfigurationManager.ConnectionStrings["LoginConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("Select ResourcePerson, Email, Designation from ProjectResourcePerson where ProjectName='" +ProjectList2.Text.ToString()+ "'", con);
            //SqlCommand cmd = new SqlCommand("Select * from TimeTable", con);
            con.Open();
            ViewMember.DataSource = cmd.ExecuteReader();
            ViewMember.DataBind();
        }
    }
    protected void btnDetails_Click(object sender, EventArgs e)
    {
        Session["project"] = ProjectList3.SelectedItem.ToString().Trim();
        Response.Redirect("ProjectDetails.aspx");
    }
}