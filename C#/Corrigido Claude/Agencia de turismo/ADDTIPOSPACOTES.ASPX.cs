using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

public partial class ADDTIPOSPACOTES : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string meusql = "INSERT INTO [TIPOPACOTE] ([tipo]) VALUES (?)";
        OleDbConnection conn = new OleDbConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        OleDbCommand cmd = new OleDbCommand(meusql, conn);
        cmd.Parameters.Add(new OleDbParameter("tipo", TextBox1.Text));
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        Response.Redirect("tipospacotes.aspx");
    }
}
