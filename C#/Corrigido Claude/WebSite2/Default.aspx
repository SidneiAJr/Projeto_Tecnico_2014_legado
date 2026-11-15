<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 65px;
            height: 93px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourcGenero" DataTextField="Gen_Nome" DataValueField="Gen_Codigo" style="margin-left: 3px">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSourcGenero" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [Gen_Codigo], [Gen_Nome] FROM [Tabela_GENEROS] ORDER BY [Gen_Nome]"></asp:SqlDataSource>
        Escolha o Genero do Filme:<asp:DataList ID="DataList1" runat="server" DataKeyField="Dvd_Codigo" DataSourceID="SqlDataSource1Filmes">
            <ItemTemplate>
                <strong>
                <img alt="" class="auto-style1" src="Imagens/<%# Eval("Dvd_Codigo") %>.jpg" />
                <br />
                Código:</strong>
                <asp:Label ID="Dvd_CodigoLabel" runat="server" Text='<%# Eval("Dvd_Codigo") %>' />
                <br />
                <strong>Titulo: </strong>
                <asp:Label ID="Dvd_TituloLabel" runat="server" Text='<%# Eval("Dvd_Titulo") %>' />
                <br />
                <strong>Preco:</strong>
                <asp:Label ID="Dvd_PrecoLabel" runat="server" Text='<%# Eval("Dvd_Preco", "{0:C}") %>' />
                <br />
                <strong>Atores</strong>:
                <asp:Label ID="Dvd_AtoresLabel" runat="server" Text='<%# Eval("Dvd_Atores") %>' />
                <br />
                <strong>Sinopse</strong>:
                <asp:Label ID="Dvd_SinopseLabel" runat="server" Text='<%# Eval("Dvd_Sinopse") %>' />
                <br />
                <strong>Duração</strong>:
                <asp:Label ID="Dvd_DuracaoLabel" runat="server" Text='<%# Eval("Dvd_Duracao") %>' />
                <br />
                <strong>Censura</strong>:
                <asp:Label ID="Dvd_CensuraLabel" runat="server" Text='<%# Eval("Dvd_Censura") %>' />
                <br />
<br />
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1Filmes" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [Dvd_Codigo], [Dvd_Titulo], [Dvd_Preco], [Dvd_Atores], [Dvd_Sinopse], [Dvd_Duracao], [Dvd_Censura] FROM [Tabela_DVD] WHERE ([Dvd_Genero] = ?) ORDER BY [Dvd_Titulo]">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="Dvd_Genero" PropertyName="SelectedValue" Type="Byte" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
    
    </div>
    </form>
</body>
</html>
