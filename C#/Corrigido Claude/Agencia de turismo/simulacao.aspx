<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="simulacao.aspx.cs" Inherits="simulacao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <table class="auto-style1">
        <tr>
            <td>Tipos de pacotes:
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"
                    DataSourceID="SqlDataSourcetiposdepacotes" DataTextField="tipo" DataValueField="id">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourcetiposdepacotes" runat="server"
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                    SelectCommand="SELECT * FROM [TIPOPACOTE]">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>Pacotes:
                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True"
                    DataSourceID="SqlDataSourcepacotes" DataTextField="pacote" DataValueField="id">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourcepacotes" runat="server"
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                    SelectCommand="SELECT * FROM [PACOTES] WHERE [codtipopacote] = ?">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="codtipopacote"
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>Hospedagem:
                <asp:DropDownList ID="DropDownList3" runat="server"
                    DataSourceID="SqlDataSourcehospedagem" DataTextField="hospedagem" DataValueField="id">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourcehospedagem" runat="server"
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                    SelectCommand="SELECT * FROM [HOSPEDAGEM] WHERE [codpacote] = ?">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList2" Name="codpacote"
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
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
                        Valor Aproximado do pacote:
                        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                        <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                            <ProgressTemplate>Calculando...</ProgressTemplate>
                        </asp:UpdateProgress>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
</asp:Content>
