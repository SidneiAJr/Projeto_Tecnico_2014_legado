<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MedicoBusca.aspx.cs" Inherits="MedicoBusca" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DataList ID="DataList1" runat="server" DataKeyField="med_Codigo" DataSourceID="SqlDataSource1medicos">
    <ItemTemplate>
        <strong>medico_Codigo:</strong>
        <asp:Label ID="med_CodigoLabel" runat="server" Text='<%# Eval("med_Codigo") %>' />
        <br />
        <strong>medico_CRM:</strong>
        <asp:Label ID="med_CRMLabel" runat="server" Text='<%# Eval("med_CRM") %>' />
        <br />
        <strong>medico_Nome:</strong>
        <asp:Label ID="med_NomeLabel" runat="server" Text='<%# Eval("med_Nome") %>' />
        <br />
        <strong>medico_DTnasc:</strong>
        <asp:Label ID="med_DTnascLabel" runat="server" Text='<%# Eval("med_DTnasc") %>' />
        <br />
        <strong>medico_especialidade:</strong>
        <asp:Label ID="med_especialidadeLabel" runat="server" Text='<%# Eval("med_especialidade") %>' />
        <br />
        <strong>medico_plano1: </strong>
        <asp:Label ID="med_plano1Label" runat="server" Text='<%# Eval("med_plano1") %>' />
        <br />
        <strong>medico_plano2: </strong>
        <asp:Label ID="med_plano2Label" runat="server" Text='<%# Eval("med_plano2") %>' />
        <br />
        <strong>medico_plano3: </strong>
        <asp:Label ID="med_plano3Label" runat="server" Text='<%# Eval("med_plano3") %>' />
        <br />
        <br />
    </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1medicos" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString4 %>" ProviderName="<%$ ConnectionStrings:ConnectionString4.ProviderName %>" SelectCommand="SELECT [med_Codigo], [med_CRM], [med_Nome], [med_DTnasc], [med_especialidade], [med_plano1], [med_plano2], [med_plano3] FROM [TAB_MEDICOS] WHERE ([med_Nome] LIKE ?)">
        <SelectParameters>
            <asp:SessionParameter Name="med_Nome" SessionField="sf_busca" Type="String" DefaultValue="%" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>