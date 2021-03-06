﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucProduct.ascx.cs" Inherits="WebKarachiNimco.Forms.UserControl.ucProduct" %>

<div class="container">
    <div class="row">

        <div class="col-12">
            <asp:Label ID="lblProduct" runat="server" CssClass="mainHeading" Text="Product"></asp:Label>
            <asp:Label ID="lblMode" runat="server" CssClass="mainHeading" Text=""></asp:Label>
            <asp:Label ID="lblProductId" runat="server" Visible="false" Text=""></asp:Label>
        </div>

    </div>
    <div class="row">
        <div class="col-8">
            <div class="row">
                <div class="col-3">
                    <asp:Label ID="Label1" runat="server" Text="Product Name : "></asp:Label>
                </div>
                <div class="col-9">
                    <asp:TextBox ID="txtProductName" runat="server" CssClass="textBox"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" CssClass="validation"
                        ValidationGroup="a" ControlToValidate="txtProductName" ErrorMessage="Please enter  Product Name."></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row">
                <div class="col-3">
                    <asp:Label ID="Label2" runat="server" Text="Product Description: "></asp:Label>
                </div>
                <div class="col-9">
                    <asp:TextBox ID="txtProductDescription" runat="server" CssClass="textBox"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" CssClass="validation" ValidationGroup="a"
                        ControlToValidate="txtProductDescription" ErrorMessage="Please enter Product Description."></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row">
                <div class="col-3">
                    <asp:Label ID="Label3" runat="server" Text="Category: "></asp:Label>
                </div>
                <div class="col-9">
                    <asp:DropDownList ID="ddlCategory" AutoPostBack="true" CssClass="ddlWidth260 ddl" runat="server">
                    </asp:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col-3">
                    <asp:Label ID="Label111" runat="server" Text="Is New Product: "></asp:Label>
                </div>
                <div class="col-9">
                    <asp:RadioButtonList ID="rblst_IsNewProduct" runat="server" CssClass="radionbuttonList" RepeatDirection="Horizontal">
                        <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                        <asp:ListItem Text="No" Selected="True" Value="0"></asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </div>
            <div class="row">
                <div class="col-3">
                    <asp:Label ID="Label4" runat="server" Text="Show On Desktop: "></asp:Label>
                </div>
                <div class="col-9">
                    <asp:RadioButtonList ID="rblst_ShowOnDesktop" runat="server" CssClass="radionbuttonList" RepeatDirection="Horizontal">
                        <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                        <asp:ListItem Text="No" Selected="True" Value="0"></asp:ListItem>
                    </asp:RadioButtonList>
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
                <asp:FileUpload ID="fuplProduct" runat="server" CssClass="fup" ClientIDMode="Static" />
                <br />
                <asp:Image ID="imgFileUpload" runat="server" ClientIDMode="Static" CssClass="borderRadious widthHeight150  raised " />
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
            <asp:ListView ID="lvProduct" runat="server" OnItemCommand="lvProduct_ItemCommand">
                <ItemTemplate>
                    <div class="row">
                        <div class="col-2">
                            <asp:Label ID="lblProductName" runat="server" CssClass="boldText"
                                Text='<%# Eval("ProductName")%>'></asp:Label>

                            <img src='<%# Eval("ImageURL")%>' class="drop-shadow raised borderRadious" width="100px" />
                        </div>
                        <div class="col-5">
                            <asp:Label ID="lblProductDescription" runat="server"
                                Text='<%# Eval("ProductDescription")%>'></asp:Label><br />
                            <asp:Label ID="lblIsNewProduct" runat="server"
                                Text='<%# Eval("IsNewProduct")%>'></asp:Label><br />
                            <asp:Label ID="Label5" runat="server"
                                Text='<%# Eval("ShowOnDesktop")%>'></asp:Label><br />
                        </div>
                        <div class="col-4">
                            <asp:Label ID="Label6" runat="server"
                                Text='<%# Eval("Category.CategoryName")%>'></asp:Label><br />
                        </div>
                        <div class="col-1">
                            <asp:ImageButton ID="ibtnEdit" runat="server" ImageUrl="~/Images/Icon/edit.png" CausesValidation="false"
                                CommandArgument='<%# Bind("ProductId") %>' CommandName="PRODUCTEDIT"
                                ToolTip="Edit" CssClass="width20" />
                            <asp:ImageButton ID="ibtnDelete" runat="server" ImageUrl="~/Images/Icon/delete.png" CausesValidation="false"
                                CommandArgument='<%# Bind("ProductId") %>' CommandName="PRODUCTDELETE"
                                ToolTip="Delete" CssClass="width20" OnClientClick="return confirm('Do you want to delete this record?');" />
                        </div>
                    </div>
                    <div class="row">
                        <br />
                        <hr />

                        <br />
                    </div>

                </ItemTemplate>
            </asp:ListView>


        </div>
    </div>
</div>
