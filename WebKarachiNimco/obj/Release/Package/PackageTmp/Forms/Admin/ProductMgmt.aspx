<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/Admin/Admin_Master.Master" AutoEventWireup="true" CodeBehind="ProductMgmt.aspx.cs" Inherits="WebKarachiNimco.Forms.Admin.ProductMgmt" %>

<%@ Register Src="~/Forms/UserControl/ucProduct.ascx" TagPrefix="uc1" TagName="ucProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:ucProduct runat="server" ID="ucProduct" />
</asp:Content>
