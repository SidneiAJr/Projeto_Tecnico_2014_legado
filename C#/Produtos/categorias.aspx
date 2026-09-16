<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="categorias.aspx.cs" Inherits="categorias" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
    <ItemTemplate>
        <strong>Codigo:</strong>
        <asp:Label ID="Cat_CodigoLabel" runat="server" Text='<%# Eval("Cat_Codigo") %>' />
        <br />
        <strong>Nome:</strong>
        <asp:Label ID="Cat_NomeLabel" runat="server" Text='<%# Eval("Cat_Nome") %>' />
        <br />
        <br />
    </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [Cat_Codigo], [Cat_Nome] FROM [Categorias] ORDER BY [Cat_Codigo]"></asp:SqlDataSource>
</asp:Content>