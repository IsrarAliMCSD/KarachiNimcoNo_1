<%@ Page Title="" Language="C#" MasterPageFile="~/MP1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebKarachiNimco.Forms.Home" %>

<%@ Register Src="~/Forms/UserControl/ucHomeSliderView.ascx" TagPrefix="uc1" TagName="ucHomeSliderView" %>
<%@ Register Src="~/Forms/UserControl/ucProductDashBoard.ascx" TagPrefix="uc1" TagName="ucProductDashBoard" %>
<%@ Register Src="~/Forms/UserControl/ucNewsAndEventDashBoard.ascx" TagPrefix="uc1" TagName="ucNewsAndEventDashBoard" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <uc1:ucHomeSliderView runat="server" ID="ucHomeSliderView" />
    <br />
    <uc1:ucNewsAndEventDashBoard runat="server" id="ucNewsAndEventDashBoard" />
    <br /> 
    <uc1:ucProductDashBoard runat="server" id="ucProductDashBoard" />
</asp:Content>
