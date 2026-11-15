using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class simulacao : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        // Calcula o valor aproximado baseado na hospedagem selecionada e quantidade de pessoas
        int qtdPessoas = int.Parse(DropDownList5.SelectedValue);
        // A lógica de cálculo depende do valor da tarifa no banco de dados
        // Por ora exibe uma mensagem orientativa
        Label2.Text = "Selecione uma hospedagem para calcular o valor total para " + qtdPessoas + " pessoa(s).";
    }
}
