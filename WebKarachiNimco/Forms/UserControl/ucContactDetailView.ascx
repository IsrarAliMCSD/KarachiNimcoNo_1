<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucContactDetailView.ascx.cs" Inherits="WebKarachiNimco.Forms.UserControl.ucContactDetailView" %>
<div class="container"> 
      <div class="row">
        <div class="col-12">
            <asp:Label ID="lblNewsEvent" runat="server" CssClass="mainHeading" Text="Contact Detail"></asp:Label>
        </div>
    </div>
 <div class="row">
        <div class="col-12">
            <asp:Repeater ID="rptrContactDetail" runat="server">
                <ItemTemplate>
                    <div class="row">
                        <div class="col-12">
                            <asp:Label ID="lblContactDetailAddress" runat="server" CssClass="boldText"
                                Text='<%# Eval("ContactDetailAddress")%>'></asp:Label>
                             <br />
                              <asp:Label ID="lblContactNumber" runat="server"
                                Text='<%# Eval("ContactNumber")%>'></asp:Label>

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