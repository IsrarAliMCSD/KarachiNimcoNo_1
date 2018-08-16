<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucAboutUs.ascx.cs" Inherits="WebKarachiNimco.Forms.UserControl.ucAboutUs" %>

<div class="container">
    <div class="row">

        <div class="col-12">
            <asp:Label ID="lblAboutUs" runat="server" CssClass="mainHeading" Text="About Us"></asp:Label>
            <asp:Label ID="lblMode" runat="server" CssClass="mainHeading" Text=""></asp:Label>
            <asp:Label ID="lblAboutUsId" runat="server" Visible="false" Text=""></asp:Label>
        </div>

    </div>
    <div class="row">
        <div class="col-8">
            <div class="row">
                <div class="col-3">
                    <asp:Label ID="Label1" runat="server" Text="Title: "></asp:Label>
                </div>
                <div class="col-9">
                    <asp:TextBox ID="txtTitle" runat="server" CssClass="textBox"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" CssClass="validation" ValidationGroup="a"
                        ControlToValidate="txtTitle" ErrorMessage="Please enter Title."></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row">
                <div class="col-3">
                    <asp:Label ID="Label2" runat="server" Text="Description: "></asp:Label>
                </div>
                <div class="col-9">
                    <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Width="90%"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" CssClass="validation" ValidationGroup="a"
                        ControlToValidate="txtDescription" ErrorMessage="Please enter description."></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row">
                <div class="col-3">
                    <asp:Label ID="Label3" runat="server" Text="Order Number: "></asp:Label>
                </div>
                <div class="col-9">
                    <asp:TextBox ID="txtOrderNo" runat="server" TextMode="Number" CssClass="textBox"></asp:TextBox>

                </div>
            </div>
            <div class="row">
                <div class="col-3"></div>
                <div class="col-9">
                    <asp:Label ID="lblMessage" runat="server" CssClass="validation" Text=""></asp:Label>
                    <br />
                    <asp:Button ID="btnSave" runat="server" ValidationGroup="a" CssClass="button width260 height35" Text="Save" OnClick="btnSave_Click" />
                    <asp:Button ID="btnCancel" runat="server" CssClass="button width260 height35" Text="Cancel" OnClick="btnCancel_Click" />
                </div>
            </div>
        </div>
        <div class="col-4">
            <div class="row">
                <asp:FileUpload ID="fuplAbout" runat="server" ClientIDMode="Static" />
                <br />
                <asp:Image ID="imgFileUpload" runat="server" ClientIDMode="Static" CssClass=" borderRadious widthHeight150  raised " />
            </div>
        </div>


    </div>
   
    <div class="row">
        <div class="col-12">
            <hr class="hrsplit">
        </div>
    </div>

    <div class="row">
        <div class="col-12">
            <asp:Repeater ID="rptrAboutUs" runat="server" OnItemCommand="rptrAboutUs_ItemCommand">
                <ItemTemplate>
                    <div class="row">
                        <div class="col-2">
                            <asp:Label ID="lblTitle" runat="server" CssClass="boldText"
                                Text='<%# Eval("Title")%>'></asp:Label>
                             
                            <img src='<%# Eval("Image")%>' class="drop-shadow raised" width="100px" />
                        </div>
                        <div class="col-9">
                            <asp:Label ID="lblDescription" runat="server"
                                Text='<%# Eval("Description")%>'></asp:Label>
                              <br />
                            <hr />
                        </div>
                        <div class="col-1">
                            <asp:ImageButton ID="ibtnEdit" runat="server" ImageUrl="~/Images/Icon/edit.png" CausesValidation="false"
                                CommandArgument='<%# Bind("AboutUsId") %>' CommandName="ABOUTUSEDIT"
                                ToolTip="Edit" CssClass="width20" />
                            <asp:ImageButton ID="ibtnDelete" runat="server" ImageUrl="~/Images/Icon/delete.png" CausesValidation="false"
                                CommandArgument='<%# Bind("AboutUsId") %>' CommandName="ABOUTUSDELETE"
                                ToolTip="Delete" CssClass="width20" OnClientClick="return confirm('Do you want to delete this record?');" />
                        </div>
                    </div>
                    <div class="row">
                        <br />
                        <hr />

                        <br />
                    </div>
                </ItemTemplate>
            </asp:Repeater>


        </div>
    </div>
</div>
