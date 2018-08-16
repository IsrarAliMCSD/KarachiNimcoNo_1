<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucContactPerson.ascx.cs" Inherits="WebKarachiNimco.Forms.UserControl.ucContactPerson" %>


<div class="container">
    <div class="row">

        <div class="col-12">
            <asp:Label ID="lblContactPerson" runat="server" CssClass="mainHeading" Text="Contact Person"></asp:Label>
            <asp:Label ID="lblMode" runat="server" CssClass="mainHeading" Text=""></asp:Label>
            <asp:Label ID="lblContactPersonId" runat="server" Visible="false" Text=""></asp:Label>
        </div>

    </div>
    <div class="row">
        <div class="col-8">
            <div class="row">
                <div class="col-3">
                    <asp:Label ID="Label1" runat="server" Text="Contact Department: "></asp:Label>
                </div>
                <div class="col-9">
                    <asp:TextBox ID="txtContactPersonDepartment" runat="server" CssClass="textBox"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" CssClass="validation" ValidationGroup="a"
                        ControlToValidate="txtContactPersonDepartment" ErrorMessage="Please enter Department Name."></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row">
                <div class="col-3">
                    <asp:Label ID="Label2" runat="server" Text="Contact Name: " ></asp:Label>
                </div>
                <div class="col-9">
                    <asp:TextBox ID="txtContactName" runat="server" CssClass="textBox" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" CssClass="validation" ValidationGroup="a"
                        ControlToValidate="txtContactName" ErrorMessage="Please enter name."></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row">
                <div class="col-3">
                    <asp:Label ID="Label3" runat="server" Text="Contact Number: "></asp:Label>
                </div>
                <div class="col-9">
                    <asp:TextBox ID="txtContactNumber" runat="server"   CssClass="textBox"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic" CssClass="validation" ValidationGroup="a"
                        ControlToValidate="txtContactNumber" ErrorMessage="Please enter contact number."></asp:RequiredFieldValidator>

                </div>
            </div>
             <div class="row">
                <div class="col-3">
                    <asp:Label ID="Label6" runat="server" Text="Contact Email: "></asp:Label>
                </div>
                <div class="col-9">
                    <asp:TextBox ID="txtContactEmail" runat="server"   CssClass="textBox"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic" CssClass="validation" ValidationGroup="a"
                        ControlToValidate="txtContactEmail" ErrorMessage="Please enter contact email."></asp:RequiredFieldValidator>
                      <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ValidationGroup="a" 
                     CssClass="validation" Display="Dynamic" ControlToValidate="txtContactEmail" 
                    ErrorMessage="Please enter valid email address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

                </div>
            </div>
              <div class="row">
                <div class="col-3">
                    <asp:Label ID="Label7" runat="server" Text="Order Number: "></asp:Label>
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
                <asp:FileUpload ID="fuplContactPerson" runat="server" CssClass="fup"  ClientIDMode="Static" />
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
            <asp:Repeater ID="rptrContactPerson" runat="server" OnItemCommand="rptrContactPerson_ItemCommand">
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
                        <div class="col-1">
                            <asp:ImageButton ID="ibtnEdit" runat="server" ImageUrl="~/Images/Icon/edit.png" CausesValidation="false"
                                CommandArgument='<%# Bind("ContactPersonId") %>' CommandName="CONTACTPERSONEDIT"
                                ToolTip="Edit" CssClass="width20" />
                            <asp:ImageButton ID="ibtnDelete" runat="server" ImageUrl="~/Images/Icon/delete.png" CausesValidation="false"
                                CommandArgument='<%# Bind("ContactPersonId") %>' CommandName="CONTACTPERSONDELETE"
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
