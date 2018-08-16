<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucNewsAndEvent.ascx.cs" Inherits="WebKarachiNimco.Forms.UserControl.ucNewsAndEvent" %>

<div class="container">
    <div class="row">
        <div class="col-12">
            <asp:Label ID="lblNewsEvent" runat="server" CssClass="mainHeading" Text="News/ Event"></asp:Label>
            <asp:Label ID="lblMode" runat="server" CssClass="mainHeading" Text=""></asp:Label>
            <asp:Label ID="lblNewsEventId" runat="server" Visible="false" Text=""></asp:Label>
        </div>

    </div>
    <div class="row">
        <div class="col-3">
            <asp:Label ID="Label1" runat="server" Text="Cateegory: "></asp:Label>
        </div>
        <div class="col-9">
            <asp:DropDownList ID="ddlCategory" AutoPostBack="true" CssClass="ddlWidth260 ddl" runat="server">
                <asp:ListItem Text="News" Value="News"></asp:ListItem>
                <asp:ListItem Text="Event" Value="Event"></asp:ListItem>
            </asp:DropDownList>
        </div>
    </div>
    <div class="row">
        <div class="col-3">
            <asp:Label ID="Label2" runat="server" Text="Title: "></asp:Label>
        </div>
        <div class="col-9">
            <asp:TextBox ID="txtTitle" runat="server" CssClass="textBox"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" CssClass="validation" ValidationGroup="a"
                ControlToValidate="txtTitle" ErrorMessage="Please enter description."></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="row">
        <div class="col-3">
            <asp:Label ID="Label3" runat="server" Text="Detail: "></asp:Label>
        </div>
        <div class="col-9">
            <asp:TextBox ID="txtDetail" runat="server" TextMode="MultiLine" CssClass="textBoxMultiLine"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" CssClass="validation" ValidationGroup="a"
                ControlToValidate="txtDetail" ErrorMessage="Please enter detail."></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="row">
        <div class="col-3">
            <asp:Label ID="Label4" runat="server" Text="Show On desktop: "></asp:Label>
        </div>
        <div class="col-9">
            <asp:RadioButtonList ID="rblst_showonDesktop" runat="server" CssClass="radionbuttonList" RepeatDirection="Horizontal">
                <asp:ListItem Text="Yes" Selected="True" Value="1"></asp:ListItem>
                <asp:ListItem Text="No" Value="0"></asp:ListItem>
            </asp:RadioButtonList>
        </div>
    </div>
    <div class="row">
        <div class="col-3">
            <asp:Label ID="Label5" runat="server" Text="News/ Event Date: "></asp:Label>
        </div>
        <div class="col-9">
            <asp:TextBox ID="txtNewsEventDate" ClientIDMode="Static" runat="server" CssClass="textBox calendar" Text=""></asp:TextBox>


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
            <asp:Repeater ID="rptrNewsEvent" runat="server" OnItemCommand="rptrNewsEvent_ItemCommand">
                <ItemTemplate>
                    <div class="row">
                        <div class="col-2">

                            <asp:Label ID="Label6" runat="server" CssClass="boldText"
                                Text='<%# Eval("NewsEventCategory")%>'></asp:Label>
                            - 
                            <asp:Label ID="lblNewsEventTitle" runat="server" CssClass="boldText"
                                Text='<%# Eval("NewsEventTitle")%>'></asp:Label>
                        </div>
                        <div class="col-7">
                            <asp:Label ID="lblNewsEventDetail" runat="server"
                                Text='<%# Eval("NewsEventDetail")%>'></asp:Label>
                        </div>
                        <div class="col-2">
                             <asp:Label ID="Label7" runat="server"
                                Text='<%# Eval("NewsEventDate")%>'></asp:Label>
                        </div>
                        <div class="col-1">
                            <asp:ImageButton ID="ibtnEdit" runat="server" ImageUrl="~/Images/Icon/edit.png" CausesValidation="false"
                                CommandArgument='<%# Bind("NewsEventId") %>' CommandName="NEWSEVENTEDIT"
                                ToolTip="Edit" CssClass="width20" />
                            <asp:ImageButton ID="ibtnDelete" runat="server" ImageUrl="~/Images/Icon/delete.png" CausesValidation="false"
                                CommandArgument='<%# Bind("NewsEventId") %>' CommandName="NEWSEVENTDELETE"
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

