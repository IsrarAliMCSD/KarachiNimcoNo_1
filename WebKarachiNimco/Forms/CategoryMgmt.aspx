<%@ Page Title="" Language="C#" MasterPageFile="~/MP1.Master" AutoEventWireup="true" CodeBehind="CategoryMgmt.aspx.cs" Inherits="WebKarachiNimco.Forms.CategoryMgmt" %>

<%@ Register Src="~/Forms/UserControl/ucCategoryView.ascx" TagPrefix="uc1" TagName="ucCategoryView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:ucCategoryView runat="server" ID="ucCategoryView" />
</asp:Content>
