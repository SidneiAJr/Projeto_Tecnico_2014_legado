using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

public partial class ADDHOSPEDAGEM : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string meusql = "INSERT INTO [HOSPEDAGEM] ([hospedagem], [tarifa], [codpacote]) VALUES (?, ?, ?)";
        OleDbConnection conn = new OleDbConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        OleDbCommand cmd = new OleDbCommand(meusql, conn);
        cmd.Parameters.Add(new OleDbParameter("hospedagem", TextBox1.Text));
        cmd.Parameters.Add(new OleDbParameter("tarifa", TextBox2.Text));
        cmd.Parameters.Add(new OleDbParameter("codpacote", DropDownList1.SelectedValue));
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        Response.Redirect("hospedagem.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("hospedagem.aspx");
    }
}
