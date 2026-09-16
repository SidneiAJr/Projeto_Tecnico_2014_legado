<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="filmesporgenero.aspx.cs" Inherits="filmesporgenero" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            width: 65px;
            height: 93px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourcegeneros" DataTextField="Gen_Nome" DataValueField="Gen_Codigo">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSourcegeneros" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [Gen_Codigo], [Gen_Nome] FROM [Tabela_GENEROS]"></asp:SqlDataSource>
    <asp:DataList ID="DataList1" runat="server" DataKeyField="Dvd_Codigo" DataSourceID="SqlDataSourcefilmesporgenero1">
        <ItemTemplate>
            <strong>
            <img alt="" class="auto-style3" src="imagens/<%# Eval("Dvd_Codigo") %>.jpg" />
            <br />
            Código:</strong>
            <asp:Label ID="Dvd_CodigoLabel" runat="server" Text='<%# Eval("Dvd_Codigo") %>' />
            <br />
            <strong>Genero</strong>:
            <asp:Label ID="Dvd_GeneroLabel" runat="server" Text='<%# Eval("Dvd_Genero") %>' />
            <br />
            <strong>Titulo:</strong>
            <asp:Label ID="Dvd_TituloLabel" runat="server" Text='<%# Eval("Dvd_Titulo") %>' />
            <br />
            <strong>Preço</strong>:
            <asp:Label ID="Dvd_PrecoLabel" runat="server" Text='<%# Eval("Dvd_Preco", "{0:C}") %>' />
            <br />
            <strong>Atores</strong>:
            <asp:Label ID="Dvd_AtoresLabel" runat="server" Text='<%# Eval("Dvd_Atores") %>' />
            <br />
            <strong>Sinopse:</strong>
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
    <asp:SqlDataSource ID="SqlDataSourcefilmesporgenero1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Tabela_DVD] WHERE ([Dvd_Genero] = ?)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="Dvd_Genero" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>