<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Especialidades.aspx.cs" Inherits="Especialidades" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DataList ID="DataList1" runat="server" DataKeyField="Esp_Codigo" DataSourceID="SqlDataSource1especialidades">
    <ItemTemplate>
        <strong>Codigo:</strong>
        <asp:Label ID="Esp_CodigoLabel" runat="server" Text='<%# Eval("Esp_Codigo") %>' />
        <br />
        <strong>Descricao:</strong>
        <asp:Label ID="Esp_DescricaoLabel" runat="server" Text='<%# Eval("Esp_Descricao") %>' />
        <br />
        <br />
    </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1especialidades" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [Esp_Codigo], [Esp_Descricao] FROM [TAB_ESPECIALIDADES] ORDER BY [Esp_Codigo]"></asp:SqlDataSource>
</asp:Content>