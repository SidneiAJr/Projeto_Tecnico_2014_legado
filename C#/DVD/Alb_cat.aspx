<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Alb_cat.aspx.cs" Inherits="Alb_cat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            width: 106px;
            height: 109px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1alb_cat" DataTextField="cat_nome" DataValueField="id">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1alb_cat" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [id], [cat_nome] FROM [CATEGORIAS]"></asp:SqlDataSource>
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1albgrava" DataKeyField="id">
        <ItemTemplate>
            <strong>
            <img alt="" class="auto-style3" src="Imagens1/<%# Eval("id") %>.jpg" />
            <br />
            Codigo:</strong>
            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
            <br />
            <strong>Nome:</strong>
            <asp:Label ID="alb_nomeLabel" runat="server" Text='<%# Eval("alb_nome") %>' />
            <br />
            <strong>Valor:</strong>
            <asp:Label ID="alb_valorLabel" runat="server" Text='<%# Eval("alb_valor") %>' />
            <br />
            <strong>Descricao: </strong>
            <asp:Label ID="alb_descricaoLabel" runat="server" Text='<%# Eval("alb_descricao") %>' />
            <br />
            <strong>Codigo_categoria:</strong>
            <asp:Label ID="alb_codcategoriaLabel" runat="server" Text='<%# Eval("alb_codcategoria") %>' />
            <br />
            <strong>Codigo_gravadora: </strong>
            <asp:Label ID="alb_codgravadoraLabel" runat="server" Text='<%# Eval("alb_codgravadora") %>' />
            <br />
            <br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1albgrava" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [id], [alb_nome], [alb_valor], [alb_descricao], [alb_codcategoria], [alb_codgravadora] FROM [ALBUNS] WHERE ([alb_codcategoria] = ?)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="alb_codcategoria" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>