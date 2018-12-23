using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class ProjectDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            divAddTask.Visible = false;
            divComment.Visible = false;
            divAddComment.Visible = false;
        }

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginConnectionString"].ConnectionString);
        con.Open();

        String test = "select Name from ProjectInformation where Name='" + Session["project"] + "'";
        SqlCommand com = new SqlCommand(test, con);
        String temp = com.ExecuteScalar().ToString().Trim();
        LProjectName.Text = temp;

        test = "select CodeName from ProjectInformation where Name='" + Session["project"] + "'";
        com = new SqlCommand(test, con);
        temp = com.ExecuteScalar().ToString().Trim();
        LCodeName.Text = temp;

        test = "select Description from ProjectInformation where Name='" + Session["project"] + "'";
        com = new SqlCommand(test, con);
        temp = com.ExecuteScalar().ToString().Trim();
        LProjectDescription.Text = temp;

        test = "select StartDate from ProjectInformation where Name='" + Session["project"] + "'";
        com = new SqlCommand(test, con);
        temp = com.ExecuteScalar().ToString().Trim();
        LStartDate.Text = temp;

        test = "select EndDate from ProjectInformation where Name='" + Session["project"] + "'";
        com = new SqlCommand(test, con);
        temp = com.ExecuteScalar().ToString().Trim();
        LEndDate.Text = temp;

        test = "select Duration from ProjectInformation where Name='" + Session["project"] + "'";
        com = new SqlCommand(test, con);
        temp = com.ExecuteScalar().ToString().Trim();
        LDuration.Text = temp;

        test = "select Status from ProjectInformation where Name='" + Session["project"] + "'";
        com = new SqlCommand(test, con);
        temp = com.ExecuteScalar().ToString().Trim();
        LProjectStatus.Text = temp;

        con.Close();


            string cs = ConfigurationManager.ConnectionStrings["LoginConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("Select ResourcePerson as Name, Designation from ProjectResourcePerson where ProjectName='" + Session["project"] + "'", conn);
                //SqlCommand cmd = new SqlCommand("Select * from TimeTable", con);
                conn.Open();
                ProjectResourcePerson.DataSource = cmd.ExecuteReader();
                ProjectResourcePerson.DataBind();
                conn.Close();
            }


            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("Select Description, AssignedTo, AssignedBy, Priority, DueDate from ProjectTask where ProjectName='" + Session["project"] + "'", conn);
                //SqlCommand cmd = new SqlCommand("Select * from TimeTable", con);
                conn.Open();
                ProjectTask.DataSource = cmd.ExecuteReader();
                ProjectTask.DataBind();
                conn.Close();
            }
       

        
    }
    protected void btnCreateTask_Click(object sender, EventArgs e)
    {
        divAddTask.Visible = true;
        divAddComment.Visible = false;
        divComment.Visible = false;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginConnectionString"].ConnectionString);
        con.Open();
        String test = "select ResourcePerson from ProjectResourcePerson where ProjectName='"+ Session["project"] +"'";
        SqlCommand com = new SqlCommand(test, con);
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds);  // fill dataset
        TaskAssignTo.DataTextField = ds.Tables[0].Columns["ResourcePerson"].ToString(); // text field name of table dispalyed in dropdown
        /*ProjectList.DataValueField = ds.Tables[0].Columns["id"].ToString();             // to retrive specific  textfield name */
        TaskAssignTo.DataSource = ds.Tables[0];      //assigning datasource to the dropdownlist
        TaskAssignTo.DataBind();

        con.Close();
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void SaveTask_Click(object sender, EventArgs e)
    {
        if (TaskDescription.Text == "" || TaskDueDate.Text == "")
        {
            labelWarning4.Text = "Fill all the field!";
        }
        else
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginConnectionString"].ConnectionString);
            con.Open();
            String temp = "select Name from LoginInformation where Email='" + Session["new"] + "'";
            SqlCommand com = new SqlCommand(temp, con);
            String name = com.ExecuteScalar().ToString();
            String test = "insert into ProjectTask (ProjectName, Description, AssignedTo, AssignedBy, Priority, DueDate) values('"+ Session["project"] +"', '"+ TaskDescription.Text +"', '"+ TaskAssignTo.SelectedItem.ToString() +"', '"+ name +"', '"+ TaskPriority.SelectedItem.ToString() +"', '" + TaskDueDate.Text +"')";
            com = new SqlCommand(test, con);
            com.ExecuteNonQuery();
            con.Close();
            labelWarning4.Text = "Task Added Successfully!";
            Response.Redirect("ProjectDetails.aspx");
        }
    }
    protected void TaskProject_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void TaskComments_Click(object sender, EventArgs e)
    {
        divComment.Visible = true;
        divAddTask.Visible = false;
        divAddComment.Visible = false;


        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginConnectionString"].ConnectionString);
        con.Open();
        String test = "select Description from ProjectTask where ProjectName='" + Session["project"] + "'";
        SqlCommand com = new SqlCommand(test, con);
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds);  // fill dataset
        TaskList.DataTextField = ds.Tables[0].Columns["Description"].ToString(); // text field name of table dispalyed in dropdown
        /*ProjectList.DataValueField = ds.Tables[0].Columns["id"].ToString();             // to retrive specific  textfield name */
        TaskList.DataSource = ds.Tables[0];      //assigning datasource to the dropdownlist
        TaskList.DataBind();
        con.Close();


    }
    protected void TaskAddComment_Click(object sender, EventArgs e)
    {
        divComment.Visible = false;
        divAddTask.Visible = false;
        divAddComment.Visible = true;


        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginConnectionString"].ConnectionString);
        con.Open();
        String test = "select Description from ProjectTask where ProjectName='"+ Session["project"] +"'";
        SqlCommand com = new SqlCommand(test, con);
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataSet ds = new DataSet();
        da.Fill(ds);  // fill dataset
        TaskList2.DataTextField = ds.Tables[0].Columns["Description"].ToString(); // text field name of table dispalyed in dropdown
        /*ProjectList.DataValueField = ds.Tables[0].Columns["id"].ToString();             // to retrive specific  textfield name */
        TaskList2.DataSource = ds.Tables[0];      //assigning datasource to the dropdownlist
        TaskList2.DataBind();
        con.Close();

    }
    protected void SaveComment_Click(object sender, EventArgs e)
    {
        if (TaskList2.SelectedIndex != -1 || TaskComment.Text != "")
        {
            String currentTime = DateTime.Now.ToString();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginConnectionString"].ConnectionString);
            con.Open();
            String temp = "select Name from LoginInformation where Email='" + Session["new"] + "'";
            SqlCommand com = new SqlCommand(temp, con);
            String user = com.ExecuteScalar().ToString();
            String test = "insert into TaskComment (ProjectName, TaskName, Comment, CommentedBy, DateTime) values ('"+ Session["project"] +"', '"+ TaskList2.SelectedItem.ToString() +"', '"+ TaskComment.Text +"', '"+ user +"', '"+ currentTime +"')";
            com = new SqlCommand(test, con);
            com.ExecuteNonQuery();
            labelWarning5.Text = "Comment Added successfully";
            con.Close();
        }
        else
        {
            labelWarning5.Text = "Not enough information!";
        }
    }
    protected void ShowComment_Click(object sender, EventArgs e)
    {
        if(TaskList.SelectedIndex != -1) 
        {
            string cs = ConfigurationManager.ConnectionStrings["LoginConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("Select Comment, CommentedBy, DateTime from TaskComment where TaskName='" + TaskList.SelectedItem.ToString() + "'", conn);
                //SqlCommand cmd = new SqlCommand("Select * from TimeTable", con);
                conn.Open();
                CommentList.DataSource = cmd.ExecuteReader();
                CommentList.DataBind();
                conn.Close();
            }
        }
    }
}