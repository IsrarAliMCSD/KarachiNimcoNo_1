<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/Admin/Admin_Master.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebKarachiNimco.Forms.Admin.Home" %>

<%@ Register Src="~/Forms/UserControl/ucAdminHome.ascx" TagPrefix="uc1" TagName="ucAdminHome" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:ucAdminHome runat="server" id="ucAdminHome" />
</asp:Content>
