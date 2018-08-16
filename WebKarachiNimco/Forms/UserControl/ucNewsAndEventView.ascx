<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucNewsAndEventView.ascx.cs" Inherits="WebKarachiNimco.Forms.UserControl.ucNewsAndEventView" %>
<div class="container">
    <div class="row">
        <div class="col-12">
            <asp:Label ID="lblNewsEvent" runat="server" CssClass="mainHeading" Text="News"></asp:Label>
        </div>
    </div>
    <div class="row"></div>
    <!-- test -->
    <div class="row">
        <div class="col-8">

            <div class="row">
                <div class="col-12">
                    <asp:Repeater ID="rptrNews" runat="server">
                        <ItemTemplate>
                            <div class="row">
                                <div class="col-2">

                                    <%--<asp:Label ID="Label6" runat="server" CssClass="boldText"
                                Text='<%# Eval("NewsEventCategory")%>'></asp:Label>
                            - --%>
                                    <asp:Label ID="lblNewsEventTitle" runat="server" CssClass="boldText"
                                        Text='<%# Eval("NewsEventTitle")%>'></asp:Label>
                                </div>
                                <div class="col-8">
                                    <asp:Label ID="lblNewsEventDetail" runat="server"
                                        Text='<%# Eval("NewsEventDetail")%>'></asp:Label>
                                </div>
                                <div class="col-2">
                                    <asp:Label ID="Label7" runat="server"
                                        Text='<%# Eval("NewsEventDate")%>'></asp:Label>
                                </div>
                                <div class="col-2"></div>
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

            <div class="row">
                <div class="col-12">
                    <asp:Label ID="Label1" runat="server" CssClass="mainHeading" Text="Event"></asp:Label>
                </div>
            </div>
            <div class="row"></div>
            <div class="row">
                <div class="col-12">
                    <asp:Repeater ID="rptrEvent" runat="server">
                        <ItemTemplate>
                            <div class="row">
                                <div class="col-2">

                                    <%--    <asp:Label ID="Label6" runat="server" CssClass="boldText"
                                Text='<%# Eval("NewsEventCategory")%>'></asp:Label>
                            - --%>
                                    <asp:Label ID="lblNewsEventTitle" runat="server" CssClass="boldText"
                                        Text='<%# Eval("NewsEventTitle")%>'></asp:Label>
                                </div>
                                <div class="col-8">
                                    <asp:Label ID="lblNewsEventDetail" runat="server"
                                        Text='<%# Eval("NewsEventDetail")%>'></asp:Label>
                                </div>
                                <div class="col-2"></div>
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
        <div class="col-4">
            <img src="../../Images/NewsEvent/ne1.jpg" width="90%" />
        </div>
    </div>
</div>

