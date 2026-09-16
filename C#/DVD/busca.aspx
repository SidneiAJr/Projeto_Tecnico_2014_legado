<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="busca.aspx.cs" Inherits="busca" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DataList ID="DataList1" runat="server" DataKeyField="Dvd_Codigo" DataSourceID="SqlDataSourcebusca">
        <ItemTemplate>
            <strong>Sinopse:</strong>
            <asp:Label ID="Dvd_SinopseLabel" runat="server" Text='<%# Eval("Dvd_Sinopse") %>' />
            <br />
            <strong>Atores:</strong>
            <asp:Label ID="Dvd_AtoresLabel" runat="server" Text='<%# Eval("Dvd_Atores") %>' />
            <br />
            <strong>Preco:</strong>
            <asp:Label ID="Dvd_PrecoLabel" runat="server" Text='<%# Eval("Dvd_Preco") %>' />
            <br />
            <strong>Titulo: </strong>
            <asp:Label ID="Dvd_TituloLabel" runat="server" Text='<%# Eval("Dvd_Titulo") %>' />
            <br />
            <strong>Genero:</strong>
            <asp:Label ID="Dvd_GeneroLabel" runat="server" Text='<%# Eval("Dvd_Genero") %>' />
            <br />
            <strong>Codigo: </strong>
            <asp:Label ID="Dvd_CodigoLabel" runat="server" Text='<%# Eval("Dvd_Codigo") %>' />
            <br />
            <strong>Duracao:</strong>
            <asp:Label ID="Dvd_DuracaoLabel" runat="server" Text='<%# Eval("Dvd_Duracao") %>' />
            <br />
            <strong>Censura:</strong>
            <asp:Label ID="Dvd_CensuraLabel" runat="server" Text='<%# Eval("Dvd_Censura") %>' />
            <br />
            <br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSourcebusca" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [Dvd_Sinopse], [Dvd_Atores], [Dvd_Preco], [Dvd_Titulo], [Dvd_Genero], [Dvd_Codigo], [Dvd_Duracao], [Dvd_Censura] FROM [Tabela_DVD] WHERE (([Dvd_Sinopse] LIKE ?) OR ([Dvd_Atores] LIKE ?) OR ([Dvd_Titulo] LIKE ?))">
        <SelectParameters>
            <asp:SessionParameter Name="Dvd_Sinopse" SessionField="sfbusca" Type="String" DefaultValue="%" />
            <asp:SessionParameter Name="Dvd_Atores" SessionField="sfbusca" Type="String" DefaultValue="%" />
            <asp:SessionParameter Name="Dvd_Titulo" SessionField="sfbusca" Type="String" DefaultValue="%" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>