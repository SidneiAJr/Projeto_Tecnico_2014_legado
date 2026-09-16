<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PROD_FOR.aspx.cs" Inherits="PROD_FOR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style4 {
            width: 70px;
            height: 58px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourcefornecedores" DataTextField="For_Nome" DataValueField="For_Codigo">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSourcefornecedores" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [For_Codigo], [For_Nome] FROM [Fornecedores] ORDER BY [For_Codigo]"></asp:SqlDataSource>
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataSourceID="SqlDataSourceprodutos" Height="50px" Width="125px" DataKeyNames="Loja_Codigo">
        <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        <Fields>
            <asp:BoundField DataField="Loja_Codigo" HeaderText="Loja_Codigo" InsertVisible="False" SortExpression="Loja_Codigo" />
            <asp:BoundField DataField="Loja_Produto" HeaderText="Loja_Produto" SortExpression="Loja_Produto" />
            <asp:BoundField DataField="Loja_Preco" HeaderText="Loja_Preco" SortExpression="Loja_Preco" />
            <asp:CheckBoxField DataField="Loja_Controle" HeaderText="Loja_Controle" SortExpression="Loja_Controle" />
            <asp:BoundField DataField="Loja_Cor" HeaderText="Loja_Cor" SortExpression="Loja_Cor" />
            <asp:BoundField DataField="Loja_Peso" HeaderText="Loja_Peso" SortExpression="Loja_Peso" />
            <asp:BoundField DataField="Loja_Tensao" HeaderText="Loja_Tensao" SortExpression="Loja_Tensao" />
            <asp:BoundField DataField="Loja_Complemento" HeaderText="Loja_Complemento" SortExpression="Loja_Complemento" />
            <asp:BoundField DataField="Loja_Descricao" HeaderText="Loja_Descricao" SortExpression="Loja_Descricao" />
            <asp:BoundField DataField="Loja_Potencia" HeaderText="Loja_Potencia" SortExpression="Loja_Potencia" />
            <asp:BoundField DataField="Loja_Fornecedor" HeaderText="Loja_Fornecedor" SortExpression="Loja_Fornecedor" />
        </Fields>
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSourceprodutos" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [Loja_Codigo], [Loja_Produto], [Loja_Preco], [Loja_Controle], [Loja_Cor], [Loja_Peso], [Loja_Tensao], [Loja_Complemento], [Loja_Descricao], [Loja_Potencia], [Loja_Fornecedor] FROM [Produtos] WHERE ([Loja_Fornecedor] = ?)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="Loja_Fornecedor" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Loja_Codigo" DataSourceID="SqlDataSource1fornecedor">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="Loja_Codigo" HeaderText="Loja_Codigo" InsertVisible="False" SortExpression="Loja_Codigo" />
            <asp:BoundField DataField="Loja_Produto" HeaderText="Loja_Produto" SortExpression="Loja_Produto" />
            <asp:BoundField DataField="Loja_Preco" HeaderText="Loja_Preco" SortExpression="Loja_Preco" />
        </Columns>
        <EmptyDataTemplate>
            Erro sem DADOS!<br />
        </EmptyDataTemplate>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1fornecedor" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [Loja_Codigo], [Loja_Produto], [Loja_Preco] FROM [Produtos] WHERE ([Loja_Codigo] = ?)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DetailsView1" Name="Loja_Codigo" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>