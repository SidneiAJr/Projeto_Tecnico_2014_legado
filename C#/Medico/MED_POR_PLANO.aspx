<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MED_POR_PLANO.aspx.cs" Inherits="MED_POR_PLANO" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style4 {
            width: 92px;
            height: 96px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1planos" DataTextField="PLA_NOME" DataValueField="PLA_CODIGO">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1planos" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT [PLA_NOME], [PLA_CODIGO] FROM [TAB_PLANOS] ORDER BY [PLA_NOME]"></asp:SqlDataSource>
    <asp:DataList ID="DataList1" runat="server" DataKeyField="med_Codigo" DataSourceID="SqlDataSource1medicos">
        <ItemTemplate>
            <strong>
            <img alt="" class="auto-style4" src="imagens/<%# Eval("med_Codigo") %>.gif" />
            <br />
            Codigo:</strong>
            <asp:Label ID="med_CodigoLabel" runat="server" Text='<%# Eval("med_Codigo") %>' />
            <br />
            <strong>Nome:</strong>
            <asp:Label ID="med_NomeLabel" runat="server" Text='<%# Eval("med_Nome") %>' />
            <br />
            <strong>CRM: </strong>
            <asp:Label ID="med_CRMLabel" runat="server" Text='<%# Eval("med_CRM") %>' />
            <br />
            <strong>DTnasc:</strong>
            <asp:Label ID="med_DTnascLabel" runat="server" Text='<%# Eval("med_DTnasc") %>' />
            <br />
            <strong>Especialidade:</strong>
            <asp:Label ID="med_especialidadeLabel" runat="server" Text='<%# Eval("med_especialidade") %>' />
            <br />
            <br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1medicos" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [med_Codigo], [med_Nome], [med_CRM], [med_DTnasc], [med_especialidade] FROM [TAB_MEDICOS] WHERE (([med_plano1] = ?) OR ([med_plano2] = ?) OR ([med_plano3] = ?))">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="med_plano1" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="DropDownList1" Name="med_plano2" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="DropDownList1" Name="med_plano3" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>