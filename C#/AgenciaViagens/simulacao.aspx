<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="simulacao.aspx.cs" Inherits="simulaçao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td>Tipos de pacotes:
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSourcetiposdepacotes" DataTextField="tipo" DataValueField="id" AutoPostBack="True">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourcetiposdepacotes" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [TIPOPACOTE]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>Pacotes:
                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSourcepacotes" DataTextField="pacote" DataValueField="id" AutoPostBack="True">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourcepacotes" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [PACOTES]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>Hospedagem:
                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSourcehospedagem" DataTextField="hospedagem" DataValueField="id">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourcehospedagem" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [HOSPEDAGEM]">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        Quantidade de pessoas:
                        <asp:DropDownList ID="DropDownList5" runat="server">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                        </asp:DropDownList>
                        <asp:Button ID="Button2" runat="server" OnClick="Button1_Click" Text="Calcular" />
                        <br />
                        Valor Proximo do pacote:<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
</asp:Content>