<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Alb_grav.aspx.cs" Inherits="Alb_grav" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            width: 113px;
            height: 114px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1alb_grav" DataTextField="GRA_NOME" DataValueField="ID">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1alb_grav" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [ID], [GRA_NOME] FROM [GRAVADORAS]"></asp:SqlDataSource>
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1alb_grav1" DataKeyField="id">
        <ItemTemplate>
            <strong>
            <img alt="" class="auto-style3" src="Imagens1/<%# Eval("id") %>.jpg" />
            <br />
            Codigo:</strong>
            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
            <br />
            <strong>nome: </strong>
            <asp:Label ID="alb_nomeLabel" runat="server" Text='<%# Eval("alb_nome") %>' />
            <br />
            <strong>valor:</strong>
            <asp:Label ID="alb_valorLabel" runat="server" Text='<%# Eval("alb_valor") %>' />
            <br />
            <strong>descricao: </strong>
            <asp:Label ID="alb_descricaoLabel" runat="server" Text='<%# Eval("alb_descricao") %>' />
            <br />
            <strong>codigo_categoria:</strong>
            <asp:Label ID="alb_codcategoriaLabel" runat="server" Text='<%# Eval("alb_codcategoria") %>' />
            <br />
            <strong>codigo_gravadora:</strong>
            <asp:Label ID="alb_codgravadoraLabel" runat="server" Text='<%# Eval("alb_codgravadora") %>' />
            <br />
            <br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1alb_grav1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [id], [alb_nome], [alb_valor], [alb_descricao], [alb_codcategoria], [alb_codgravadora] FROM [ALBUNS] WHERE ([alb_codgravadora] = ?)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="alb_codgravadora" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>