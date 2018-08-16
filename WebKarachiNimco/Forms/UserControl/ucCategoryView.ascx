<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucCategoryView.ascx.cs" Inherits="WebKarachiNimco.Forms.UserControl.ucCategoryView" %>
<div class="container">
        <div class="row">
        <div class="col-12">
            <asp:Label ID="lblNewsEvent" runat="server" CssClass="mainHeading" Text="Category"></asp:Label>
        </div>
    </div>
    <div class="row">
        <asp:Repeater ID="lvCategory" runat="server">
            <ItemTemplate>
                <div class="col-4">
                    <%#Eval("IsNewCategory").ToString()=="True" ?
                           "<div class='ribbon-wrapper'><div class='ribbon'>NEW</div></div>":""%>
                    <img src='<%# Eval("ImageURL")%>' class="drop-shadow raised borderRadious" width="100px" /><br />
                    <asp:Label ID="lblContactPersonDepartment" runat="server" CssClass="boldText"
                        Text='<%# Eval("CategoryName")%>'></asp:Label><br />
                    <asp:Label ID="lblCategoryDescription" runat="server"
                        Text='<%# Eval("CategoryDescription")%>'></asp:Label>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>
<br />
