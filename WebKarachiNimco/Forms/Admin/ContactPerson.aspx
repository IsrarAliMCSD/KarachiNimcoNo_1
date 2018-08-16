<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/Admin/Admin_Master.Master" AutoEventWireup="true" CodeBehind="ContactPerson.aspx.cs" Inherits="WebKarachiNimco.Forms.Admin.ContactPerson" %>

<%@ Register Src="~/Forms/UserControl/ucContactPerson.ascx" TagPrefix="uc1" TagName="ucContactPerson" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:ucContactPerson runat="server" id="ucContactPerson" />
</asp:Content>
