<%@ Page Title="" Language="C#" MasterPageFile="~/MP1.Master" AutoEventWireup="true" CodeBehind="ProductMgmt.aspx.cs" Inherits="WebKarachiNimco.Forms.ProductMgmt" %>

<%@ Register Src="~/Forms/UserControl/ucProductView.ascx" TagPrefix="uc1" TagName="ucProductView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:ucProductView runat="server" id="ucProductView" />
</asp:Content>
