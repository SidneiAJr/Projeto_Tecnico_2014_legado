<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="listageneros.aspx.cs" Inherits="listageneros" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DataList ID="DataList1" runat="server" DataKeyField="Gen_Codigo" DataSourceID="SqlDataSourcelistageneros">
    <ItemTemplate>
        <strong>Codigo:</strong>
        <asp:Label ID="Gen_CodigoLabel" runat="server" Text='<%# Eval("Gen_Codigo") %>' />
        <br />
        <strong>Nome: </strong>
        <asp:Label ID="Gen_NomeLabel" runat="server" Text='<%# Eval("Gen_Nome") %>' />
        <br />
        <br />
    </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSourcelistageneros" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Tabela_GENEROS]"></asp:SqlDataSource>
</asp:Content>