<%@ Page Title="" Language="C#" MasterPageFile="~/Operator/Operator.master" AutoEventWireup="true" CodeFile="TubewellComplain.aspx.cs" Inherits="TubewellComplain" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container mt-4">
        <div class="col-md-12 font-weight-bold text-center">
            TUBE WELL COMPLAIN
            <hr />
        </div>
        <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Red" Font-Bold="true"></asp:Label>
        <div class="card">
            <div class="card card-header p-1 alert-primary font-weight-bold ">Tube well Details  </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-3">
                        District<span style="color: red">*</span>
                        <asp:DropDownList ID="ddlDist" CssClass="form-control form-control-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlDist_SelectedIndexChanged" runat="server">
                            <asp:ListItem Value="0" ValidationGroup="TubewellEntry">Select</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvDept" runat="server"
                            ControlToValidate="ddlDist" Display="Dynamic" InitialValue="0"
                            ErrorMessage="Plese Select District" ForeColor="Red" SetFocusOnError="true" ValidationGroup="TubewellEntry"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-3">
                        Block<span style="color: red">*</span>
                        <asp:DropDownList ID="ddlBlock" CssClass="form-control form-control-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlBlock_SelectedIndexChanged" runat="server">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                            ControlToValidate="ddlBlock" Display="Dynamic" InitialValue="0"
                            ErrorMessage="Plese Select Block" ForeColor="Red" SetFocusOnError="true" ValidationGroup="TubewellEntry"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-3">
                        Panchayat<span style="color: red">*</span>
                        <asp:DropDownList ID="ddlPanchayat" CssClass="form-control form-control-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlPanchayat_SelectedIndexChanged" runat="server">
                            <asp:ListItem Value="0" ValidationGroup="TubewellEntry">Select</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                            ControlToValidate="ddlPanchayat" Display="Dynamic" InitialValue="0"
                            ErrorMessage="Plese Select Panchayat" ForeColor="Red" SetFocusOnError="true" ValidationGroup="TubewellEntry"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-3">
                        Tubewell<span style="color: red">*</span>
                        <asp:DropDownList ID="ddlTubewell" CssClass="form-control form-control-sm" runat="server">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                            ControlToValidate="ddlTubewell" Display="Dynamic" InitialValue="0" ValidationGroup="TubewellEntry"
                            ErrorMessage="Plese Select Tubewell" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-3">
                        Remarks Type <span style="color: red">*</span>
                        <asp:DropDownList ID="ddlRemarksType" CssClass="form-control form-control-sm" runat="server">
                            <asp:ListItem Value="0" ValidationGroup="TubewellEntry">Select</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                            ControlToValidate="ddlRemarksType" Display="Dynamic" InitialValue="0"
                            ErrorMessage="Plese Select Remarks Type" ForeColor="Red" SetFocusOnError="true" ValidationGroup="TubewellEntry"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-9"></div>
                    <div class="col-md-3">
                        Remarks <span style="color: red">*</span> :
                        <asp:TextBox ID="txtRemarks" runat="server" TextMode="MultiLine" CssClass="form-control form-control-sm "></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" ControlToValidate="txtRemarks" runat="server" ErrorMessage="Please fill Remarks" ValidationGroup="TubewellEntry"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-12">
                        Already Complained to CO* :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:RadioButton ID="rbCOyes" runat="server" GroupName="ChkCO" Text="Yes" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:RadioButton ID="rbCONo" runat="server" GroupName="ChkCO" Text="No" Checked="true"/><br />
                        Already Complained to DM* :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:RadioButton ID="rbDMYes" runat="server" GroupName="ChkDM" Text="Yes" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:RadioButton ID="rbDMNo" runat="server" GroupName="ChkDM" Text="No" Checked="true"/>

                    </div>
                    <div class="col-md-6">
                    </div>
                    <div class="col-md-12 mt-1">
                        Upload Image1(.jpg only)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:FileUpload ID="fuImage1" runat="server" />
                        
                    </div>
                    <div class="col-md-12 mt-1">
                        Upload Image2(.jpg only)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:FileUpload ID="fuImage2" runat="server" />

                    </div>
                    <div class="col-md-12 mt-1">
                        Upload Document(PDF only)
                        <asp:FileUpload ID="fuPDF" runat="server" />                        
                    </div>
                    <div class="col-md-12 mt-1">
                        <b>Note:-</b> Image1 and Image2 size must be less than 200 KB and Document size must be less than 1 MB.
                    </div>
                </div>

            </div>
        </div>

        <div class="card mt-1">
            <div class="card card-header p-1 alert-primary font-weight-bold ">Informer Details : </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-3">
                        Name<span style="color: red">*</span>
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" ControlToValidate="txtName" runat="server" ValidationGroup="TubewellEntry" ErrorMessage="Please fill Name"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-3">
                        Mobile No.<span style="color: red">*</span>
                        <asp:TextBox ID="txtMobile" MaxLength="10" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtMobile" runat="server" ForeColor="Red" ValidationGroup="TubewellEntry" ErrorMessage="Please fill Mobile No." Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationGroup="TubewellEntry" ControlToValidate="txtMobile" ErrorMessage="Please fill Mobile No."
                            ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                    </div>                    
                    <div class="col-md-3">
                        Email<span style="color: red">*</span>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ForeColor="red" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail" ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>
                    </div>
                    <div class="col-md-3"></div>
                    <div class="col-md-3">
                        Address<span style="color: red">*</span>
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control form-control-sm" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtAddress" ValidationGroup="TubewellEntry" ForeColor="Red" runat="server" ErrorMessage="Please fill Address"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>

        </div>


        <div class="col-md-12 align-items-center ">

            <asp:Button ID="btnSave" runat="server" CssClass="btn btn-sm btn-primary mt-4 " Text="Save" OnClick="btnSave_Click" ValidationGroup="TubewellEntry" />
            <asp:Button ID="Button_Reset" runat="server" CssClass="btn btn-sm btn-primary mt-4" Text="Reset" OnClick="Button_Reset_Click" />
        </div>
    </div>
    <br />

</asp:Content>

