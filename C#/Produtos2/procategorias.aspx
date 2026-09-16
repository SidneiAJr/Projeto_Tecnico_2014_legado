<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="procategorias.aspx.cs" Inherits="procategorias" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style4 {
            width: 73px;
            height: 74px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourcCategoria" DataTextField="Cat_Nome" DataValueField="Cat_Codigo">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSourcCategoria" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [Cat_Codigo], [Cat_Nome] FROM [Tab_Categorias]"></asp:SqlDataSource>
    <asp:DataList ID="DataList1" runat="server" DataKeyField="Pro_Codigo" DataSourceID="SqlDataSourceprodutos">
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
    <asp:SqlDataSource ID="SqlDataSourceprodutos" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [Pro_Codigo], [Pro_Nome], [Pro_Valor] FROM [Tab_Produtos] WHERE ([Pro_CodCategoria] = ?)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="Pro_CodCategoria" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>