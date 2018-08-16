<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucContactDetail.ascx.cs" Inherits="WebKarachiNimco.Forms.UserControl.ucContactDetail" %>


<div class="container">
    <div class="row">

        <div class="col-12">
            <asp:Label ID="lblContactDetail" runat="server" CssClass="mainHeading" Text="Contact Detail"></asp:Label>
            <asp:Label ID="lblMode" runat="server" CssClass="mainHeading" Text=""></asp:Label>
            <asp:Label ID="lblContactDetailId" runat="server" Visible="false" Text=""></asp:Label>
        </div>

    </div>


    <div class="row">
        <div class="col-3">
            <asp:Label ID="Label1" runat="server" Text="Contact Address: "></asp:Label>
        </div>
        <div class="col-9">
            <asp:TextBox ID="txtContactDetailAddress" runat="server" TextMode="MultiLine" Height="100px" CssClass="textBox"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" CssClass="validation" ValidationGroup="a"
                ControlToValidate="txtContactDetailAddress" ErrorMessage="Please enter contact detail"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="row">
        <div class="col-3">
            <asp:Label ID="Label2" runat="server" Text="Contact Number:  "></asp:Label>
        </div>
        <div class="col-9">
            <asp:TextBox ID="txtContactNumber" runat="server" CssClass="textBox"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" CssClass="validation" ValidationGroup="a"
                ControlToValidate="txtContactNumber" ErrorMessage="Please enter contact number."></asp:RequiredFieldValidator>
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


    <div class="row">
        <div class="col-12">
            <hr class="hrsplit">
        </div>
    </div>

    <div class="row">
        <div class="col-12">
            <asp:Repeater ID="rptrContactDetail" runat="server" OnItemCommand="rptrContactDetail_ItemCommand">
                <ItemTemplate>
                    <div class="row">
                        <div class="col-11">
                            <asp:Label ID="lblContactDetailAddress" runat="server" CssClass="boldText"  
                                Text='<%# Eval("ContactDetailAddress")%>'></asp:Label>
                            <br />
                            <asp:Label ID="lblContactNumber" runat="server"
                                Text='<%# Eval("ContactNumber")%>'></asp:Label>
                        </div>

                        <div class="col-1">
                            <asp:ImageButton ID="ibtnEdit" runat="server" ImageUrl="~/Images/Icon/edit.png" CausesValidation="false"
                                CommandArgument='<%# Bind("CntactDetailId") %>' CommandName="CONTROLDETAILEDIT"
                                ToolTip="Edit" CssClass="width20" />
                            <asp:ImageButton ID="ibtnDelete" runat="server" ImageUrl="~/Images/Icon/delete.png" CausesValidation="false"
                                CommandArgument='<%# Bind("CntactDetailId") %>' CommandName="CONTROLDETAILDELETE"
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
