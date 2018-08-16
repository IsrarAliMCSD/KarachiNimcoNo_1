<%@ Page Title="" Language="C#" MasterPageFile="~/MP1.Master" AutoEventWireup="true" CodeBehind="NewsEventDetail.aspx.cs" Inherits="WebKarachiNimco.Forms.NewsEventDetail" %>

<%@ Register Src="~/Forms/UserControl/ucNewsAndEventView.ascx" TagPrefix="uc1" TagName="ucNewsAndEventView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:ucNewsAndEventView runat="server" id="ucNewsAndEventView" />
</asp:Content>
