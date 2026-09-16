<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PROD_CAT.ASPX.cs" Inherits="PROD_CAT" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 70px;
            height: 58px;
        }
        .auto-style2 {
            width: 84px;
            height: 64px;
        }
        .auto-style4 {
            width: 82px;
            height: 54px;
        }
        .auto-style5 {
            width: 70px;
            height: 58px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1categoria" DataTextField="Cat_Nome" DataValueField="Cat_Codigo">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1categoria" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [Cat_Codigo], [Cat_Nome] FROM [Categorias] ORDER BY [Cat_Codigo]"></asp:SqlDataSource>
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataSourceID="SqlDataSource1semcategoria" GridLines="None" Height="50px" Width="206px" DataKeyNames="Loja_Codigo">
        <EditRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
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
            <asp:BoundField DataField="Loja_Potencia" HeaderText="Loja_Potencia" SortExpression="Loja_Potencia" />
            <asp:BoundField DataField="Loja_Descricao" HeaderText="Loja_Descricao" SortExpression="Loja_Descricao" />
        </Fields>
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1semcategoria" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [Loja_Codigo], [Loja_Produto], [Loja_Preco], [Loja_Controle], [Loja_Cor], [Loja_Peso], [Loja_Tensao], [Loja_Complemento], [Loja_Fornecedor], [Loja_Potencia], [Loja_Descricao] FROM [Produtos] WHERE ([Loja_Categoria] = ?)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="Loja_Categoria" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1produtos" DataKeyNames="Loja_Codigo">
        <Columns>
            <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
            <asp:BoundField DataField="Loja_Codigo" HeaderText="Loja Codigo" InsertVisible="False" SortExpression="Loja_Codigo" />
            <asp:BoundField DataField="Loja_Produto" HeaderText="Loja Produto" SortExpression="Loja_Produto" />
            <asp:BoundField DataField="Loja_Preco" DataFormatString="{0:C}" HeaderText="Loja Preco" SortExpression="Loja_Preco" />
        </Columns>
        <EmptyDataTemplate>
            Sem dados. Por favor refazer ação!
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
    <asp:SqlDataSource ID="SqlDataSource1produtos" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [Loja_Codigo], [Loja_Produto], [Loja_Preco] FROM [Produtos] WHERE ([Loja_Codigo] = ?)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DetailsView1" Name="Loja_Codigo" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>