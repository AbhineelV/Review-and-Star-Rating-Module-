using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Connectivity_First_Prog
{
    public partial class Task_Review : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand com;
        SqlDataReader dr;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string path = @"Data Source=DESKTOP-K59HESF\SQLEXPRESS;Initial Catalog=Rating;Integrated Security=True";

            //Access Database Path from Config File
            //string path = ConfigurationManager.AppSettings["myDB"];
            con = new SqlConnection(path);
            con.Open();

            string k = "INSERT INTO Rating (id, name, email, rating, comment) VALUES (@id, @name, @email,@rating, @comment)";
            com = new SqlCommand(k, con);
            com.Parameters.AddWithValue("@id", TextBox1.Text);
            com.Parameters.AddWithValue("@name", TextBox2.Text);
            com.Parameters.AddWithValue("@email", TextBox3.Text);
            com.Parameters.AddWithValue("@rating", DropDownList1.Text);
            com.Parameters.AddWithValue("@comment", TextBox4.Text);

            com.ExecuteNonQuery();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string path = @"Data Source=DESKTOP-K59HESF\SQLEXPRESS;Initial Catalog=Rating;Integrated Security=True";
            con = new SqlConnection(path);
            con.Open();

            string k = "SELECT * FROM Rating";
            com = new SqlCommand(k, con);

            dr = com.ExecuteReader();

            //Data Binding With Repeater
            Repeater1.DataSource = dr;
            Repeater1.DataBind();



            for (int i = 0; i < Repeater1.Items.Count; i++)
            {
                //Find Control
               
                Label l1 = Repeater1.Items[i].FindControl("Label1") as Label;

                Label l2 = Repeater1.Items[i].FindControl("Label2") as Label;

                Label l3 = Repeater1.Items[i].FindControl("Label3") as Label;
            }

       
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                int rating = Convert.ToInt32(DataBinder.Eval(e.Item.DataItem, "rating"));

                if (rating >= 1) ((Image)e.Item.FindControl("Image1")).Visible = true;
                if (rating >= 2) ((Image)e.Item.FindControl("Image2")).Visible = true;
                if (rating >= 3) ((Image)e.Item.FindControl("Image3")).Visible = true;
                if (rating >= 4) ((Image)e.Item.FindControl("Image4")).Visible = true;
            }
        }
    }
}