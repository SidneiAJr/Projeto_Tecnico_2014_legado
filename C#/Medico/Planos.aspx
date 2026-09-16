<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Planos.aspx.cs" Inherits="Planos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DataList ID="DataList1" runat="server" DataKeyField="PLA_CODIGO" DataSourceID="SqlDataSource1planos1">
    <ItemTemplate>
        <strong>Código:</strong>
        <asp:Label ID="PLA_CODIGOLabel" runat="server" Text='<%# Eval("PLA_CODIGO") %>' />
        <br />
        <strong>NOME:</strong>
        <asp:Label ID="PLA_NOMELabel" runat="server" Text='<%# Eval("PLA_NOME") %>' />
        <br />
        <br />
    </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1planos1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [PLA_CODIGO], [PLA_NOME] FROM [TAB_PLANOS] ORDER BY [PLA_NOME]"></asp:SqlDataSource>
</asp:Content>