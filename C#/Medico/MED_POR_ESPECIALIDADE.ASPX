<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MED_POR_ESPECIALIDADE.ASPX.cs" Inherits="MED_POR_ESPECIALIDADE" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style4 {
            width: 97px;
            height: 93px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1especialidade" DataTextField="Esp_Codigo" DataValueField="Esp_Codigo">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1especialidade" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString3 %>" ProviderName="<%$ ConnectionStrings:ConnectionString3.ProviderName %>" SelectCommand="SELECT * FROM [TAB_ESPECIALIDADES]"></asp:SqlDataSource>
    <asp:DataList ID="DataList1" runat="server" DataKeyField="med_Codigo" DataSourceID="SqlDataSource1medicos">
        <ItemTemplate>
            <strong>
            <img alt="" class="auto-style4" src="imagens/<%# Eval("med_Codigo") %>.gif" />
            <br />
            Código:</strong>
            <asp:Label ID="med_CodigoLabel" runat="server" Text='<%# Eval("med_Codigo") %>' />
            <br />
            <strong>Nome: </strong>
            <asp:Label ID="med_NomeLabel" runat="server" Text='<%# Eval("med_Nome") %>' />
            <br />
            <strong>CRM:</strong>
            <asp:Label ID="med_CRMLabel" runat="server" Text='<%# Eval("med_CRM") %>' />
            <br />
            <strong>Data de nascimento</strong>:<asp:Label ID="med_DTnascLabel" runat="server" Text='<%# Eval("med_DTnasc") %>' />
            <br />
            <br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1medicos" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [med_Codigo], [med_Nome], [med_CRM], [med_DTnasc] FROM [TAB_MEDICOS] WHERE ([med_especialidade] = ?)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="med_especialidade" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>