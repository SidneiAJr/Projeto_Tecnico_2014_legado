<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PROBUSCA.ASPX.cs" Inherits="PROBUSCA" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style4 {
            width: 67px;
            height: 58px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" CellPadding="4" DataKeyNames="Pro_Codigo" DataSourceID="SqlDataSourceprodutos" ForeColor="#333333" GridLines="None" Height="50px" Width="125px">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
        <EditRowStyle BackColor="#2461BF" />
        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="Pro_Codigo" HeaderText="Pro_Codigo" InsertVisible="False" ReadOnly="True" SortExpression="Pro_Codigo" />
            <asp:BoundField DataField="Pro_Nome" HeaderText="Pro_Nome" SortExpression="Pro_Nome" />
            <asp:BoundField DataField="Pro_Descricao" HeaderText="Pro_Descricao" SortExpression="Pro_Descricao" />
            <asp:BoundField DataField="Pro_Valor" HeaderText="Pro_Valor" SortExpression="Pro_Valor" />
            <asp:BoundField DataField="Pro_CodCategoria" HeaderText="Pro_CodCategoria" SortExpression="Pro_CodCategoria" />
            <asp:BoundField DataField="Pro_CodMarca" HeaderText="Pro_CodMarca" SortExpression="Pro_CodMarca" />
        </Fields>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSourceprodutos" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Tab_Produtos] WHERE ([Pro_Nome] LIKE ?)">
        <SelectParameters>
            <asp:SessionParameter Name="Pro_Nome" SessionField="sf_busca" Type="String" DefaultValue="%" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>