<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PRODETALHES.ASPX.cs" Inherits="PRODETALHES" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Pro_Codigo" DataSourceID="SqlDataSourceProdutos">
        <Columns>
            <asp:CommandField ButtonType="Button" SelectText="Mais Informações" ShowSelectButton="True" />
            <asp:BoundField DataField="Pro_Nome" HeaderText="Pro_Nome" SortExpression="Pro_Nome" />
            <asp:BoundField DataField="Pro_Descricao" HeaderText="Pro_Descricao" SortExpression="Pro_Descricao" />
        </Columns>
        <EmptyDataTemplate>
            Sem Informação!<br />
        </EmptyDataTemplate>
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
        <RowStyle BackColor="White" ForeColor="#003399" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <SortedAscendingCellStyle BackColor="#EDF6F6" />
        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
        <SortedDescendingCellStyle BackColor="#D6DFDF" />
        <SortedDescendingHeaderStyle BackColor="#002876" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceProdutos" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [Pro_Codigo], [Pro_Nome], [Pro_Descricao] FROM [Tab_Produtos]"></asp:SqlDataSource>
    <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="Pro_Codigo" DataSourceID="SqlDataSourceProdutosCompletos" GridLines="Horizontal" Height="50px" Width="125px">
        <EditRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
        <Fields>
            <asp:BoundField DataField="Pro_Codigo" HeaderText="Pro_Codigo" InsertVisible="False" ReadOnly="True" SortExpression="Pro_Codigo" />
            <asp:BoundField DataField="Pro_Nome" HeaderText="Pro_Nome" SortExpression="Pro_Nome" />
            <asp:BoundField DataField="Pro_Descricao" HeaderText="Pro_Descricao" SortExpression="Pro_Descricao" />
            <asp:BoundField DataField="Pro_Valor" HeaderText="Pro_Valor" SortExpression="Pro_Valor" />
            <asp:BoundField DataField="Pro_CodCategoria" HeaderText="Pro_CodCategoria" SortExpression="Pro_CodCategoria" />
            <asp:BoundField DataField="Pro_CodMarca" HeaderText="Pro_CodMarca" SortExpression="Pro_CodMarca" />
        </Fields>
        <FooterStyle BackColor="White" ForeColor="#333333" />
        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#333333" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSourceProdutosCompletos" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Tab_Produtos] WHERE ([Pro_Codigo] = ?)">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="Pro_Codigo" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>