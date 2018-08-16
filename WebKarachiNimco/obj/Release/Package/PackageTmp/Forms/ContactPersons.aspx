<%@ Page Title="" Language="C#" MasterPageFile="~/MP1.Master" AutoEventWireup="true" CodeBehind="ContactPersons.aspx.cs" Inherits="WebKarachiNimco.Forms.ContactPersons" %>

<%@ Register Src="~/Forms/UserControl/ucContactPersonView.ascx" TagPrefix="uc1" TagName="ucContactPersonView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:ucContactPersonView runat="server" id="ucContactPersonView" />
</asp:Content>
