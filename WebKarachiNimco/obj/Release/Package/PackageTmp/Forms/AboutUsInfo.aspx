<%@ Page Title="" Language="C#" MasterPageFile="~/MP1.Master" AutoEventWireup="true" CodeBehind="AboutUsInfo.aspx.cs" Inherits="WebKarachiNimco.Forms.AboutUsInfo" %>

<%@ Register Src="~/Forms/UserControl/usAboutUsView.ascx" TagPrefix="uc1" TagName="usAboutUsView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
    <uc1:usAboutUsView runat="server" ID="usAboutUsView" />
</asp:Content>
