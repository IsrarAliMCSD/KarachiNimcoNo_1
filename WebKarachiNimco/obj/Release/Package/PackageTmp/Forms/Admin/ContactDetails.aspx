<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/Admin/Admin_Master.Master" AutoEventWireup="true" CodeBehind="ContactDetails.aspx.cs" Inherits="WebKarachiNimco.Forms.Admin.ContactDetails" %>

<%@ Register Src="~/Forms/UserControl/ucContactDetail.ascx" TagPrefix="uc1" TagName="ucContactDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:ucContactDetail runat="server" id="ucContactDetail" />
</asp:Content>
