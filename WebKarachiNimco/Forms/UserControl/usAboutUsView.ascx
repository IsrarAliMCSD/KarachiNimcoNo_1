<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="usAboutUsView.ascx.cs" Inherits="WebKarachiNimco.Forms.UserControl.usAboutUsView" %>

<div class="container">
      <div class="row">

        <div class="col-12">
            <asp:Label ID="lblAboutUs" runat="server" CssClass="mainHeading" Text="About Us"></asp:Label>
        </div>

    </div>
    <div class="row">
        <div class="col-12">
            <asp:Repeater ID="rptrAboutUs" runat="server">
                <ItemTemplate>
                    <div class="row">
                        <div class="col-2">
                            <asp:Label ID="lblTitle" runat="server" CssClass="boldText"
                                Text='<%# Eval("Title")%>'></asp:Label>
                            <br />
                            <img src='<%# Eval("Image")%>' class="drop-shadow raised" width="100px" />
                        </div>
                        <div class="col-10">
                            <asp:Label ID="lblDescription" runat="server"
                                Text='<%# Eval("Description")%>'></asp:Label>
                            <br />

                        </div>
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
