<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucCategory.ascx.cs" Inherits="WebKarachiNimco.Forms.UserControl.ucCategory" %>

<div class="container">
    <div class="row">

        <div class="col-12">
            <asp:Label ID="lblCategory" runat="server" CssClass="mainHeading" Text="Categories"></asp:Label>
            <asp:Label ID="lblMode" runat="server" CssClass="mainHeading" Text=""></asp:Label>
            <asp:Label ID="lblCategoryId" runat="server" Visible="false" Text=""></asp:Label>
        </div>

    </div>
    <div class="row">
        <div class="col-8">
            <div class="row">
                <div class="col-3">
                    <asp:Label ID="Label1" runat="server" Text="Name : "></asp:Label>
                </div>
                <div class="col-9">
                    <asp:TextBox ID="txtCategoryName" runat="server" CssClass="textBox"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" CssClass="validation" 
                    ValidationGroup="a" ControlToValidate="txtCategoryName" ErrorMessage="Please enter category Name."></asp:RequiredFieldValidator>
                </div>
            </div>
       <div class="row">
                <div class="col-3">
                    <asp:Label ID="Label2" runat="server" Text="Category Description: "></asp:Label>
                </div>
                <div class="col-9">
                    <asp:TextBox ID="txtCategoryDescription" runat="server" CssClass="textBox"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" CssClass="validation" ValidationGroup="a"
                    ControlToValidate="txtCategoryDescription" ErrorMessage="Please enter Category Description."></asp:RequiredFieldValidator>
                </div>
            </div>
             <div class="row">
                <div class="col-3">
                    <asp:Label ID="Label111" runat="server" Text="Is New Category: "></asp:Label>
                </div>
                <div class="col-9">
            <asp:RadioButtonList ID="rblst_IsNewCategory" runat="server" CssClass="radionbuttonList" RepeatDirection="Horizontal">
                <asp:ListItem Text="Yes"  Value="1"></asp:ListItem>
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
                <asp:FileUpload ID="fuplCategory" runat="server" CssClass="fup" ClientIDMode="Static" />
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
            <asp:ListView ID="lvCategory" runat="server" OnItemCommand="lvCategory_ItemCommand">
                <ItemTemplate>
                    <div class="row">
                        <div class="col-2">
                            <asp:Label ID="lblContactPersonDepartment" runat="server" CssClass="boldText"
                                Text='<%# Eval("CategoryName")%>'></asp:Label>

                            <img src='<%# Eval("ImageURL")%>' class="drop-shadow raised borderRadious" width="100px" />
                        </div>
                        <div class="col-9">
                            <asp:Label ID="lblCategoryDescription" runat="server"
                                Text='<%# Eval("CategoryDescription")%>'></asp:Label>
                        </div>
                        <div class="col-1">
                            <asp:ImageButton ID="ibtnEdit" runat="server" ImageUrl="~/Images/Icon/edit.png" CausesValidation="false"
                                CommandArgument='<%# Bind("CategoryId") %>' CommandName="CATEGORYEDIT"
                                ToolTip="Edit" CssClass="width20" />
                            <asp:ImageButton ID="ibtnDelete" runat="server" ImageUrl="~/Images/Icon/delete.png" CausesValidation="false"
                                CommandArgument='<%# Bind("CategoryId") %>' CommandName="CATEGORYDELETE"
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
