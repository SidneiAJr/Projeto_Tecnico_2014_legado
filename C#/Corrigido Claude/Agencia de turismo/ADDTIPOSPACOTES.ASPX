<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ADDTIPOSPACOTES.ASPX.cs" Inherits="ADDTIPOSPACOTES" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="0" cellspacing="0" class="auto-style1">
        <tr>
            <td>Nome do Tipo de Pacote:
                <asp:TextBox ID="TextBox1" runat="server" MaxLength="50"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Gravar" OnClick="Button1_Click" />
                <asp:Button ID="Button2" runat="server" Text="Cancelar" />
            </td>
        </tr>
    </table>
</asp:Content>
