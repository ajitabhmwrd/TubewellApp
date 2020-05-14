<%@ Page Title="" Language="C#" MasterPageFile="~/EE/eeMaster.master" AutoEventWireup="true" CodeFile="AddEstimatedCost.aspx.cs" Inherits="EE_AddEstimatedCost" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <div class="container">
        <span class="font-weight-bold small">Add Estimated Cost</span>
        <hr />
    </div>
    <div class="container" style="font-size:15px">
        <div class="row">
            <div class="col-md-12 p-1">
                <a class="btn btn-primary btn-sm" href="TubewellEstimatedCost.aspx">Back</a>
            </div>
            <div class="col-md-12 p-1">
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3 p-1">
                Work Name*
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtWorkName" Text="(Enter)" ErrorMessage="Enter Name" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtWorkName" runat="server" CssClass="form-control form-control-sm" MaxLength="100"></asp:TextBox>
            </div>
            <div class="col-md-3 p-1">
                Nature of work*
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" InitialValue="0" runat="server" ControlToValidate="ddlWorkNature" Text="(Select)" ErrorMessage="Select Village" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                <asp:DropDownList ID="ddlWorkNature" runat="server" CssClass="form-control form-control-sm">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-md-3 p-1">
                Head Type*  
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" InitialValue="0" runat="server" ControlToValidate="ddlHead" Display="Dynamic" Text="(Select)" ErrorMessage="Select Block" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                <asp:DropDownList ID="ddlHead" runat="server" CssClass="form-control form-control-sm" >
                    <asp:ListItem Value="0">Select</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-md-3 p-1">
                Financial Year*
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" InitialValue="0" runat="server" ControlToValidate="ddlFinYear" Display="Dynamic" Text="(Select)" ErrorMessage="Select Block" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                <asp:DropDownList ID="ddlFinYear" runat="server" CssClass="form-control form-control-sm">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-md-3 p-1">
                Block*
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" InitialValue="0" runat="server" ControlToValidate="ddlBlock" Display="Dynamic" Text="(Select)" ErrorMessage="Select Block" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                <asp:DropDownList ID="ddlBlock" runat="server" CssClass="form-control form-control-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlBlock_SelectedIndexChanged">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-md-3 p-1">
                Panchyat*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" InitialValue="0" runat="server" ControlToValidate="ddlPanchayat" Text="(Select)" ErrorMessage="Select Panchayat" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                <asp:DropDownList ID="ddlPanchayat" runat="server" CssClass="form-control form-control-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlPanchayat_SelectedIndexChanged">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="col-md-3 p-1">
                Tubewell*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" InitialValue="0" runat="server" ControlToValidate="ddlTubewell" Text="(Select)" ErrorMessage="Select Village" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                <asp:DropDownList ID="ddlTubewell" runat="server" CssClass="form-control form-control-sm">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-md-3 p-1 ">
                Administrative Approval Amount
                
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ForeColor="Red" ControlToValidate="txtAA" ValidationGroup="TubewellEntry" Display="Dynamic"
                    ValidationExpression="^(\d{1,18})(.\d{1,2})?$" ErrorMessage="(Invalid)" Font-Size="Small" Font-Bold="true" />
                <asp:TextBox ID="txtAA" runat="server" CssClass="form-control form-control-sm"  placeholder="For Plan Head Only (In Rs)"></asp:TextBox>
            </div>
            <div class="col-md-3 p-1 ">
                Estimated Cost-Mechenical    
                <asp:RegularExpressionValidator ID="RequiredFieldValidator7" runat="server" ForeColor="Red" ControlToValidate="txtEstimatedMech" ValidationGroup="TubewellEntry" Display="Dynamic"
                    ValidationExpression="^(\d{1,18})(.\d{1,2})?$" ErrorMessage="(Invalid)" Font-Size="Small" Font-Bold="true" />
                <asp:TextBox ID="txtEstimatedMech" runat="server" CssClass="form-control form-control-sm"  placeholder="In Rs"></asp:TextBox>
            </div>
            <div class="col-md-3 p-1 ">
                Estimated Cost-Electrical
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ForeColor="Red" ControlToValidate="txtEstimatedElect" ValidationGroup="TubewellEntry" Display="Dynamic"
                    ValidationExpression="^(\d{1,18})(.\d{1,2})?$" ErrorMessage="(Invalid)" Font-Size="Small" Font-Bold="true" />
                <asp:TextBox ID="txtEstimatedElect" runat="server" CssClass="form-control form-control-sm"  placeholder="In Rs"></asp:TextBox>
            </div>
            <div class="col-md-3 p-1 ">
                Estimated Cost-Civil             
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ForeColor="Red" ControlToValidate="txtEstimatedCivil" ValidationGroup="TubewellEntry" Display="Dynamic"
                    ValidationExpression="^(\d{1,18})(.\d{1,2})?$" ErrorMessage="(Invalid)" Font-Size="Small" Font-Bold="true" />
                <asp:TextBox ID="txtEstimatedCivil" runat="server" CssClass="form-control form-control-sm"  placeholder="In Rs"></asp:TextBox>
            </div>
            <div class="col-md-3 p-1 ">
                Revised Estimated Cost (If any)                
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ForeColor="Red" ControlToValidate="txtRevisedEC" ValidationGroup="TubewellEntry" Display="Dynamic"
                    ValidationExpression="^(\d{1,18})(.\d{1,2})?$" ErrorMessage="(Invalid)" Font-Size="Small" Font-Bold="true" />
                <asp:TextBox ID="txtRevisedEC" runat="server" CssClass="form-control form-control-sm" placeholder="In Rs"></asp:TextBox>
            </div>
            <div class="col-md-6 p-1 ">
                Upload Estimated Cost Document(PDF only)*
                        <asp:RequiredFieldValidator ErrorMessage="(Required)" ControlToValidate="fuPDF" runat="server" Display="Dynamic" ValidationGroup="TubewellEntry" ForeColor="Red" Font-Bold="true" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.pdf)$" ValidationGroup="TubewellEntry" Font-Bold="true"
                    ControlToValidate="fuPDF" runat="server" ForeColor="Red" ErrorMessage="(.pdf file only)"
                    Display="Dynamic" />
                <asp:FileUpload ID="fuPDF" runat="server" />

            </div>

        </div>
        <div class="row">
            <div class="col-md-12 p-1">
                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary btn-sm" OnClick="btnSave_Click" ValidationGroup="TubewellEntry" />
                <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn btn-secondary btn-sm" OnClick="btnReset_Click" />
            </div>
        </div>
    </div>

</asp:Content>

