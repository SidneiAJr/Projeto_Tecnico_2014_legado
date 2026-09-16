<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ADDHOSPEDAGEM.ASPX.cs" Inherits="ADDHOSPEDAGEM" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="0" cellspacing="0" class="auto-style1">
        <tr>
            <td>Pacotes:
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSourcepacotes" DataTextField="pacote" DataValueField="id">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourcepacotes" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [PACOTES]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>Nome da hospedagem:<asp:TextBox ID="TextBox1" runat="server" MaxLength="10"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Valor da Tarifa:<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Gravar" />
                <asp:Button ID="Button2" runat="server" Text="Cancelar" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>