<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="categoria.aspx.cs" Inherits="categoria" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DataList ID="DataList1" runat="server" DataKeyField="id" DataSourceID="SqlDataSource1Categoria">
    <ItemTemplate>
        <strong>id:</strong>
        <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
        <br />
        <strong>Nome:</strong>
        <asp:Label ID="cat_nomeLabel" runat="server" Text='<%# Eval("cat_nome") %>' />
        <br />
        <br />
    </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1Categoria" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [id], [cat_nome] FROM [CATEGORIAS]"></asp:SqlDataSource>
</asp:Content>