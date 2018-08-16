<%@ Page Title="" Language="C#" MasterPageFile="~/MP1.Master" AutoEventWireup="true" CodeBehind="ContactDetails.aspx.cs" Inherits="WebKarachiNimco.Forms.ContactDetails" %>

<%@ Register Src="~/Forms/UserControl/ucContactDetailView.ascx" TagPrefix="uc1" TagName="ucContactDetailView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:ucContactDetailView runat="server" id="ucContactDetailView" />
</asp:Content>
