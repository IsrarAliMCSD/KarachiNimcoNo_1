<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucProductView.ascx.cs" Inherits="WebKarachiNimco.Forms.UserControl.ucProductView" %>

<div class="container">
        <div class="row">
        <div class="col-12">
            <asp:Label ID="lblNewsEvent" runat="server" CssClass="mainHeading" Text="Product"></asp:Label>
        </div>
    </div>
    <div class="row">
        <asp:Repeater ID="lvProduct" runat="server">
            <ItemTemplate>
                <div class="col-4">
                    <div class="clearfix">
                    <%#Eval("IsNewProduct").ToString()=="True" ?
                           "<div class='ribbon-wrapper'><div class='ribbon'>NEW</div></div>":""%>
                   
                     <img src='<%# Eval("ImageURL")%>' class="drop-shadow raised borderRadious" width="100px" /><br /> <br />
                    </div>
                    <div class="prod-detail">
                    <asp:Label ID="lblProductName" runat="server" CssClass="boldText prodName"
                        Text='<%# Eval("ProductName")%>'></asp:Label>
                    <br />
                    <asp:Label ID="Label1" runat="server"
                        Text='<%# Eval("Category.CategoryName")%>'></asp:Label><br />
                    <asp:Label ID="lblProductDescription" runat="server"
                        Text='<%# Eval("ProductDescription")%>'></asp:Label><br />
                    <asp:Label ID="lblIsNewProduct" runat="server"
                        Text='<%# Eval("IsNewProduct")%>'></asp:Label><br />
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>

    </div>
</div>
<br />
