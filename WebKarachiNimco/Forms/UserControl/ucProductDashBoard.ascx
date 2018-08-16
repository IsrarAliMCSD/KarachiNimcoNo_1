<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucProductDashBoard.ascx.cs" Inherits="WebKarachiNimco.Forms.UserControl.ucProductDashBoard" %>


<div class="container">
    <div class="row">
        <asp:Repeater ID="lvProduct" runat="server">
            <ItemTemplate>
                <div class="col-4">
                    <%#Eval("IsNewProduct").ToString()=="True" ?
                           "<div class='ribbon-wrapper'><div class='ribbon'>NEW</div></div>":""%>
                    <img src='<%# Eval("ImageURL")%>' class="drop-shadow raised borderRadious" width="100px" /><br />


                    <asp:Label ID="lblProductName" runat="server" CssClass="boldText"
                        Text='<%# Eval("ProductName")%>'></asp:Label>
                    <br />
                    <asp:Label ID="Label1" runat="server"
                        Text='<%# Eval("Category.CategoryName")%>'></asp:Label><br />
                    <asp:Label ID="lblProductDescription" runat="server"
                        Text='<%# Eval("ProductDescription")%>'></asp:Label><br />
                   <%-- <asp:Label ID="lblIsNewProduct" runat="server"
                        Text='<%# Eval("IsNewProduct")%>'></asp:Label><br />--%>
                    <br />
                </div>
            </ItemTemplate>
        </asp:Repeater>

    </div>
</div>
<br />
