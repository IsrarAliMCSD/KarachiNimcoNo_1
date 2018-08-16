<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/Admin/Admin_Master.Master" AutoEventWireup="true" 
    CodeBehind="HomeSliderMgmt.aspx.cs" Inherits="WebKarachiNimco.Forms.Admin.HomeSliderMgmt" %>

<%@ Register Src="~/Forms/UserControl/ucHomeSlider.ascx" TagPrefix="uc1" TagName="ucHomeSlider" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:ucHomeSlider runat="server" id="ucHomeSlider" />
</asp:Content>
