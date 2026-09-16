<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="fornecedores.aspx.cs" Inherits="fornecedores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 82px;
            height: 54px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DataList ID="DataList1" runat="server" DataKeyField="For_Codigo" DataSourceID="SqlDataSource1fornecedores">
        <ItemTemplate>
            <strong>
            <img alt="" class="auto-style1" src="imagens/Logotipo/<%# Eval("For_Codigo") %>.jpg" />
            <br />
            Codigo:</strong>
            <asp:Label ID="For_CodigoLabel" runat="server" Text='<%# Eval("For_Codigo") %>' />
            <br />
            <strong>Nome: </strong>
            <asp:Label ID="For_NomeLabel" runat="server" Text='<%# Eval("For_Nome") %>' />
            <br />
            <br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1fornecedores" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [For_Codigo], [For_Nome] FROM [Fornecedores] ORDER BY [For_Codigo]"></asp:SqlDataSource>
</asp:Content>