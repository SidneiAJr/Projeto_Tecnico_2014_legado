<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PROD_BUSCA.aspx.cs" Inherits="PROD_BUSCA" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Loja_Codigo" DataSourceID="SqlDataSourceprodutos" GridLines="Horizontal" Height="221px" style="margin-right: 0px" Width="421px">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:CommandField ButtonType="Button" SelectText="Informações" ShowSelectButton="True" />
            <asp:BoundField DataField="Loja_Codigo" HeaderText="Loja_Codigo" InsertVisible="False" SortExpression="Loja_Codigo" />
            <asp:BoundField DataField="Loja_Produto" HeaderText="Loja_Produto" SortExpression="Loja_Produto" />
            <asp:BoundField DataField="Loja_Preco" HeaderText="Loja_Preco" SortExpression="Loja_Preco" />
        </Columns>
        <EmptyDataTemplate>
            Erro sem Dados!<br />
        </EmptyDataTemplate>
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
        <SortedAscendingCellStyle BackColor="#F4F4FD" />
        <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
        <SortedDescendingCellStyle BackColor="#D8D8F0" />
        <SortedDescendingHeaderStyle BackColor="#3E3277" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceprodutos" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [Loja_Codigo], [Loja_Produto], [Loja_Preco] FROM [Produtos] WHERE (([Loja_Complemento] LIKE ?) AND ([Loja_Descricao] LIKE ?) AND ([Loja_Produto] LIKE ?))">
        <SelectParameters>
            <asp:SessionParameter Name="Loja_Complemento" SessionField="sfbusca" Type="String" DefaultValue="%" />
            <asp:SessionParameter Name="Loja_Descricao" SessionField="sfbusca" Type="String" DefaultValue="%" />
            <asp:SessionParameter Name="Loja_Produto" SessionField="sfbusca" Type="String" DefaultValue="%" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="4" DataSourceID="SqlDataSource1produtosresto" ForeColor="#333333" GridLines="None" Height="50px" Width="340px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
        <EditRowStyle BackColor="#999999" />
        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="Loja_Codigo" HeaderText="Loja_Codigo" InsertVisible="False" SortExpression="Loja_Codigo" />
            <asp:BoundField DataField="Loja_Produto" HeaderText="Loja_Produto" SortExpression="Loja_Produto" />
            <asp:BoundField DataField="Loja_Preco" HeaderText="Loja_Preco" SortExpression="Loja_Preco" />
            <asp:CheckBoxField DataField="Loja_Controle" HeaderText="Loja_Controle" SortExpression="Loja_Controle" />
            <asp:BoundField DataField="Loja_Cor" HeaderText="Loja_Cor" SortExpression="Loja_Cor" />
            <asp:BoundField DataField="Loja_Peso" HeaderText="Loja_Peso" SortExpression="Loja_Peso" />
            <asp:BoundField DataField="Loja_Tensao" HeaderText="Loja_Tensao" SortExpression="Loja_Tensao" />
            <asp:BoundField DataField="Loja_Complemento" HeaderText="Loja_Complemento" SortExpression="Loja_Complemento" />
            <asp:BoundField DataField="Loja_Fornecedor" HeaderText="Loja_Fornecedor" SortExpression="Loja_Fornecedor" />
            <asp:BoundField DataField="Loja_Categoria" HeaderText="Loja_Categoria" SortExpression="Loja_Categoria" />
            <asp:BoundField DataField="Loja_Potencia" HeaderText="Loja_Potencia" SortExpression="Loja_Potencia" />
            <asp:BoundField DataField="Loja_Descricao" HeaderText="Loja_Descricao" SortExpression="Loja_Descricao" />
        </Fields>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1produtosresto" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [Loja_Codigo], [Loja_Produto], [Loja_Preco], [Loja_Controle], [Loja_Cor], [Loja_Peso], [Loja_Tensao], [Loja_Complemento], [Loja_Fornecedor], [Loja_Categoria], [Loja_Potencia], [Loja_Descricao] FROM [Produtos] WHERE ([Loja_Codigo] = ?)">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="Loja_Codigo" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>