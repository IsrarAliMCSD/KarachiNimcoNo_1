<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucHomeSlider.ascx.cs" Inherits="WebKarachiNimco.Forms.UserControl.ucHomeSlider" %>

<div class="container">
    <div class="row">

        <div class="col-12">
            <asp:Label ID="lblHomeSlider" runat="server" CssClass="mainHeading" Text="Home Slider"></asp:Label>
            <asp:Label ID="lblMode" runat="server" CssClass="mainHeading" Text=""></asp:Label>
            <asp:Label ID="lblHomeSliderId" runat="server" Visible="false" Text=""></asp:Label>
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
                    <asp:Label ID="Label2" runat="server" Text="Sub Title/ Description: "></asp:Label>
                </div>
                <div class="col-9">
                    <asp:TextBox ID="txtSubtitle" runat="server" TextMode="MultiLine" Width="90%"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" CssClass="validation" ValidationGroup="a"
                        ControlToValidate="txtSubtitle" ErrorMessage="Please enter sub Title/ description."></asp:RequiredFieldValidator>
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
                <asp:FileUpload ID="fuplHomeSlider" CssClass="fup" runat="server" ClientIDMode="Static" />
                <br />
                <asp:Image ID="imgFileUpload" runat="server" ClientIDMode="Static" CssClass="borderRadious widthHeight150 drop-shadow raised" />
                 
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
            <asp:Repeater ID="rptrHomeSlider" runat="server" OnItemCommand="rptrHomeSlider_ItemCommand">
                <ItemTemplate>
                    <div class="row">
                        <div class="col-2">
                            <asp:Label ID="lblTitle" runat="server" CssClass="boldText"
                                Text='<%# Eval("HomeSliderTitle")%>'></asp:Label>

                            <img src='<%# Eval("ImageURL")%>' class="drop-shadow raised" width="100px" />
                        </div>
                        <div class="col-9">
                            <asp:Label ID="lblDescription" runat="server"
                                Text='<%# Eval("HomSliderSubTitle")%>'></asp:Label>
                            <br />
                            <hr />
                        </div>
                        <div class="col-1">
                            <asp:ImageButton ID="ibtnEdit" runat="server" ImageUrl="~/Images/Icon/edit.png" CausesValidation="false"
                                CommandArgument='<%# Bind("HomeSliderId") %>' CommandName="HOMESLIDEREDIT"
                                ToolTip="Edit" CssClass="width20" />
                            <asp:ImageButton ID="ibtnDelete" runat="server" ImageUrl="~/Images/Icon/delete.png" CausesValidation="false"
                                CommandArgument='<%# Bind("HomeSliderId") %>' CommandName="HOMESLIDERDELETE"
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

