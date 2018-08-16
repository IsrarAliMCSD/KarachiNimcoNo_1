<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/Admin/Admin_Master.Master" AutoEventWireup="true" CodeBehind="CategoryMgmt.aspx.cs" Inherits="WebKarachiNimco.Forms.Admin.CategoryMgmt" %>

<%@ Register Src="~/Forms/UserControl/ucCategory.ascx" TagPrefix="uc1" TagName="ucCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:ucCategory runat="server" id="ucCategory" />
</asp:Content>
