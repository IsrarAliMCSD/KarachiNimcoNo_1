<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/Admin/Admin_Master.Master" AutoEventWireup="true" 
    CodeBehind="NewsEventDetail.aspx.cs" Inherits="WebKarachiNimco.Forms.Admin.NewsEventDetail" %>

<%@ Register Src="~/Forms/UserControl/ucNewsAndEvent.ascx" TagPrefix="uc1" TagName="ucNewsAndEvent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:ucNewsAndEvent runat="server" id="ucNewsAndEvent" />
</asp:Content>
