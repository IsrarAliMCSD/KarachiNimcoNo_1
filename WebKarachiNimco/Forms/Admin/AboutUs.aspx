<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/Admin/Admin_Master.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="WebKarachiNimco.Forms.Admin.AboutUs" %>

<%@ Register Src="~/Forms/UserControl/ucAboutUs.ascx" TagPrefix="uc1" TagName="ucAboutUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
    <uc1:ucAboutUs runat="server" ID="ucAboutUs" />
</asp:Content>
