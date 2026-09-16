<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="promarcas.aspx.cs" Inherits="promarcas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style4 {
            width: 100px;
            height: 99px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceMarcas" DataTextField="Mar_Nome" DataValueField="Mar_Codigo">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSourceMarcas" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [Mar_Codigo], [Mar_Nome] FROM [Tab_Marcas]"></asp:SqlDataSource>
    <asp:DataList ID="DataList1" runat="server" DataKeyField="Pro_Codigo" DataSourceID="SqlDataSourceProdutos">
        <ItemTemplate>
            <strong>
            <img alt="" class="auto-style4" src="Imagens/<%# Eval("Pro_Codigo") %>.jpg" />
            <br />
            <br />
            Codigo:</strong>
            <asp:Label ID="Pro_CodigoLabel" runat="server" Text='<%# Eval("Pro_Codigo") %>' />
            <br />
            <strong>Nome:</strong>
            <asp:Label ID="Pro_NomeLabel" runat="server" Text='<%# Eval("Pro_Nome") %>' />
            <br />
            <strong>Valor:</strong>
            <asp:Label ID="Pro_ValorLabel" runat="server" Text='<%# Eval("Pro_Valor", "{0:C}") %>' />
            <br />
            <br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSourceProdutos" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [Pro_Codigo], [Pro_Nome], [Pro_Valor] FROM [Tab_Produtos] WHERE ([Pro_CodMarca] = ?)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="Pro_CodMarca" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>