<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucContactPersonView.ascx.cs" Inherits="WebKarachiNimco.Forms.UserControl.ucContactPersonView" %>
<div class="container">
     <div class="row">
        <div class="col-12">
            <asp:Label ID="lblNewsEvent" runat="server" CssClass="mainHeading" Text="Contact Person"></asp:Label>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <asp:Repeater ID="rptrContactPerson" runat="server">
                <ItemTemplate>
                    <div class="row">
                        <div class="col-2">
                            <asp:Label ID="lblContactPersonDepartment" runat="server" CssClass="boldText"
                                Text='<%# Eval("ContactPersonDepartment")%>'></asp:Label>

                            <img src='<%# Eval("ImageUrl")%>' class="drop-shadow raised borderRadious" width="100px" />
                        </div>
                        <div class="col-9">
                            <asp:Label ID="lblContactName" runat="server"
                                Text='<%# Eval("ContactName")%>'></asp:Label>
                            <br />
                            <asp:Label ID="Label4" runat="server"
                                Text='<%# Eval("contactNumber")%>'></asp:Label>
                            <br />
                            <asp:Label ID="Label5" runat="server"
                                Text='<%# Eval("ContactEmail")%>'></asp:Label>
                            <br />

                        </div>
                           <div class="col-1"></div>
                    </div>
                    <div class="row">
                        <div class="col-2"></div>
                        <div class="col-10">
                            <hr />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>


        </div>
    </div>
</div>
