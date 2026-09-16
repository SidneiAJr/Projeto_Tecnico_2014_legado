<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CDSBUSCA.ASPX.cs" Inherits="CDSBUSCA" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            width: 110px;
            height: 108px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DataList ID="DataList1" runat="server" DataKeyField="id" DataSourceID="SqlDataSource1CDBusca">
        <ItemTemplate>
            <strong>
            <img alt="" class="auto-style3" src="imagens/<%# Eval("id") %>.jpg" />
            <br />
            ID: </strong>
            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
            <br />
            <strong>Nome: </strong>
            <asp:Label ID="alb_nomeLabel" runat="server" Text='<%# Eval("alb_nome") %>' />
            <br />
            <strong>Albun_valor:</strong>
            <asp:Label ID="alb_valorLabel" runat="server" Text='<%# Eval("alb_valor") %>' />
            <br />
            <strong>Albun_descricao:</strong>
            <asp:Label ID="alb_descricaoLabel" runat="server" Text='<%# Eval("alb_descricao") %>' />
            <br />
            <strong>Albun_categoria:</strong>
            <asp:Label ID="alb_codcategoriaLabel" runat="server" Text='<%# Eval("alb_codcategoria") %>' />
            <br />
            <strong>Albun_gravadora: </strong>
            <asp:Label ID="alb_codgravadoraLabel" runat="server" Text='<%# Eval("alb_codgravadora") %>' />
            <br />
            <br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1CDBusca" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT [id], [alb_nome], [alb_valor], [alb_descricao], [alb_codcategoria], [alb_codgravadora] FROM [ALBUNS] WHERE (([alb_nome] LIKE ?) OR ([alb_descricao] LIKE ?))">
        <SelectParameters>
            <asp:SessionParameter Name="alb_nome" SessionField="sfbusca" Type="String" DefaultValue="%" />
            <asp:SessionParameter Name="alb_descricao" SessionField="sfbusca" Type="String" DefaultValue="%" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>