<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 79px;
            height: 97px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Selecione o cargo desejado: <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1CARGOS" DataTextField="Car_Descricao" DataValueField="Car_Codigo">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1CARGOS" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [CARGOS] ORDER BY [Car_Descricao]"></asp:SqlDataSource>
    
    </div>
        <asp:DataList ID="DataList1" runat="server" DataKeyField="Fun_Codigo" DataSourceID="SqlDataSource2FUNCIONARIOS" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
            <AlternatingItemStyle BackColor="#CCCCCC" />
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <ItemTemplate>
                <strong>
                <img alt="" class="auto-style1" src="Imagens/<%# Eval("Fun_Codigo") %>.jpg" />
                <br />
                Código</strong>:
                <asp:Label ID="Fun_CodigoLabel" runat="server" Text='<%# Eval("Fun_Codigo") %>' />
                <br />
                <strong>Nome:</strong>
                <asp:Label ID="Fun_NomeLabel" runat="server" Text='<%# Eval("Fun_Nome") %>' />
                <br />
                <strong>Salário: </strong>
                <asp:Label ID="Fun_SalarioLabel" runat="server" Text='<%# Eval("Fun_Salario", "{0:C}") %>' />
                <br />
<br />
            </ItemTemplate>
            <SelectedItemStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource2FUNCIONARIOS" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [Fun_Codigo], [Fun_Nome], [Fun_Salario] FROM [FUNCIONARIOS] WHERE ([Fun_Cargo] = ?) ORDER BY [Fun_Nome]">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="Fun_Cargo" PropertyName="SelectedValue" Type="Int16" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
    </form>
</body>
</html>
