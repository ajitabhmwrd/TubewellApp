﻿<%@ Page Title="" Language="C#" MasterPageFile="~/EE/eeMaster.master" AutoEventWireup="true" CodeFile="TubewellEstimatedCost.aspx.cs" Inherits="EE_TubewellEstimatedCost" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .modalBackground {
            background-color: Black;
            filter: alpha(opacity=90);
            opacity: 0.8;
        }

        .modalPopup {
            background-color: #FFFFFF;
            border-color: black;
            width: 95%;
            height: 600px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <div style="padding-left: 16px; padding-right: 16px">
        <span class="font-weight-bold small">Tubewell Estimated Cost</span>
        <hr />
    </div>
    <div style="padding-left: 16px; padding-right: 16px">
        <div class="row">
            <div class="col-md-3 p-1">
                <a class="btn btn-primary btn-sm" href="AddEstimatedCost.aspx">Add Estimated Cost</a>
            </div>
            <div class="col-md-9 p-1"></div>
            <div class="col-md-2 p-1">
                Block              
                    <asp:DropDownList ID="ddlBlock" runat="server" CssClass="form-control form-control-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlBlock_SelectedIndexChanged">
                        <asp:ListItem Value="0">Select</asp:ListItem>
                    </asp:DropDownList>
            </div>
            <div class="col-md-2 p-1">
                Panchyat
                    <asp:DropDownList ID="ddlPanchayat" runat="server" CssClass="form-control form-control-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlPanchayat_SelectedIndexChanged">
                        <asp:ListItem Value="0">Select</asp:ListItem>
                    </asp:DropDownList>
            </div>
            <div class="col-md-2 p-1">
                Tubewell
                    <asp:DropDownList ID="ddlTubewell" runat="server" CssClass="form-control form-control-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlTubewell_SelectedIndexChanged">
                        <asp:ListItem Value="0">Select</asp:ListItem>
                    </asp:DropDownList>
            </div>
            <div class="col-md-2 p-1">
                Financial Year                
                        <asp:DropDownList ID="ddlFinYear" runat="server" CssClass="form-control form-control-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlFinYear_SelectedIndexChanged">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                        </asp:DropDownList>
            </div>
            <div class="col-md-2 p-1">
                <br />
                <asp:Button ID="btnClear" runat="server" Text="Reset" CssClass="btn btn-primary btn-sm" OnClick="btnClear_Click" />
            </div>
            <div class="col-md-12 p-2 table-responsive">
                <asp:GridView ID="gvTubewell" runat="server" AutoGenerateColumns="False" CssClass="table table-hover table-bordered table-sm" GridLines="None"
                    HeaderStyle-CssClass="customBgColor text-white" EmptyDataText="No Records Found"
                    OnPageIndexChanging="gvTubewell_PageIndexChanging" PageSize="50" AllowPaging="true">
                    <Columns>
                        <asp:TemplateField HeaderText="SNo">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ID" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="lblEstID" runat="server" Text='<%# Bind("EstID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tube well ID">
                            <ItemTemplate>
                                <asp:Label ID="lblTubewellID" runat="server" Text='<%# Bind("TubewellID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Tubewell Name">
                            <ItemTemplate>
                                <asp:Label ID="lblName" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Block">
                            <ItemTemplate>
                                <asp:Label ID="lblBlockName" runat="server" Text='<%# Bind("BlockName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Panchayat">
                            <ItemTemplate>
                                <asp:Label ID="lblPanchayatName" runat="server" Text='<%# Bind("PanchayatName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--<asp:TemplateField HeaderText="Village">
                                    <ItemTemplate>
                                        <asp:Label ID="lblVILLNAME" runat="server" Text='<%# Bind("VILLNAME") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                        <asp:TemplateField HeaderText="Finacial Year">
                            <ItemTemplate>
                                <asp:Label ID="lblFinaciyalYear" runat="server" Text='<%# Bind("FinaciyalYear") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Head Type" ItemStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblHeadType" runat="server" Text='<%# Bind("HeadType") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Work Name">
                            <ItemTemplate>
                                <asp:Label ID="lblWorkName" runat="server" Text='<%# Bind("WorkName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Work Nature">
                            <ItemTemplate>
                                <asp:Label ID="lblNatureOfWork" runat="server" Text='<%# Bind("NatureOfWork") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="AA Amount">
                            <ItemTemplate>
                                <asp:Label ID="lblAAAmount" runat="server" Text='<%# Bind("AAAmount") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Electrical Estimated Cost (In Rs)">
                            <ItemTemplate>
                                <asp:Label ID="lblElectricalAmount" runat="server" Text='<%# Bind("ElectricalAmount") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Mechanical Estimated Cost (In Rs)">
                            <ItemTemplate>
                                <asp:Label ID="lblMechenicalAmount" runat="server" Text='<%# Bind("MechenicalAmount") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Civil Estimated Cost (In Rs)">
                            <ItemTemplate>
                                <asp:Label ID="lblCivilAmount" runat="server" Text='<%# Bind("CivilAmount") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Total Estimated Cost (In Rs)">
                            <ItemTemplate>
                                <asp:Label ID="lblTEstimatedCost" runat="server" Text='<%# Bind("TEstimatedCost") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Revised Estimated Cost (In Rs)">
                            <ItemTemplate>
                                <asp:Label ID="lblRevisedEstimatedCost" runat="server" Text='<%# Bind("RevisedEstimatedCost") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-Wrap="false" HeaderText="Uploaded pdf">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDownload" Text="Download" CommandArgument='<%# Eval("pdfLocation") %>' runat="server" OnClick="lnkDownload_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <asp:Button ID="btnEdit" runat="server" Text="Edit" class="btn-primary" OnClick="btnEdit_Click" />
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:PostBackTrigger ControlID="btnEdit" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

        </div>
    </div>
    <asp:LinkButton ID="lnkFake" runat="server" Text=""></asp:LinkButton>
    <!-- ModalPopupExtender -->

    <cc1:ModalPopupExtender ID="mp1" runat="server" PopupControlID="Panel1" TargetControlID="lnkFake"
        CancelControlID="btnClose" BackgroundCssClass="modalBackground">
    </cc1:ModalPopupExtender>
    <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none" ScrollBars="Auto">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <div class="p-4 row">
                    <div class="col-md-12 font-weight-bold small">
                        Update Tube Well Estimated Cost
                <hr />
                    </div>

                    <div class="col-md-12 p-1">
                        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                    </div>
                    <div class="col-md-12 p-1">
                        Estimate Cost ID =<asp:Label ID="lblEstID" runat="server" Text="" ForeColor="Blue" Font-Bold="true"></asp:Label>
                        <br />
                        Tubewell ID =
                            <asp:Label ID="lblTubewellID" runat="server" Text="" ForeColor="Blue" Font-Bold="true"></asp:Label>
                    </div>
                </div>
                <div class="p-4 row">
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
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" InitialValue="0" runat="server" ControlToValidate="ddlHead" Display="Dynamic" Text="(Select)" ErrorMessage="Select Block" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                        <asp:DropDownList ID="ddlHead" runat="server" CssClass="form-control form-control-sm">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-3 p-1">
                        Financial Year*
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" InitialValue="0" runat="server" ControlToValidate="ddlFinYearMP" Display="Dynamic" Text="(Select)" ErrorMessage="Select Block" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                        <asp:DropDownList ID="ddlFinYearMP" runat="server" CssClass="form-control form-control-sm">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-3 p-1 ">
                        Administrative Approval Amount                
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ForeColor="Red" ControlToValidate="txtAA" ValidationGroup="TubewellEntry" Display="Dynamic"
                    ValidationExpression="^(\d{1,18})(.\d{1,2})?$" ErrorMessage="(Invalid)" Font-Size="Small" Font-Bold="true" />
                        <asp:TextBox ID="txtAA" runat="server" CssClass="form-control form-control-sm" placeholder="For Plan Head Only (In Rs)"></asp:TextBox>
                    </div>
                    <div class="col-md-3 p-1 ">
                        Estimated Cost-Mechanical (In Rs)              
                <asp:RegularExpressionValidator ID="RequiredFieldValidator7" runat="server" ForeColor="Red" ControlToValidate="txtEstimatedMech" ValidationGroup="TubewellEntry" Display="Dynamic"
                    ValidationExpression="^(\d{1,18})(.\d{1,2})?$" ErrorMessage="(Invalid)" Font-Size="Small" Font-Bold="true" />
                        <asp:TextBox ID="txtEstimatedMech" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                    </div>
                    <div class="col-md-3 p-1 ">
                        Estimated Cost-Electrical (In Rs)              
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ForeColor="Red" ControlToValidate="txtEstimatedElect" ValidationGroup="TubewellEntry" Display="Dynamic"
                    ValidationExpression="^(\d{1,18})(.\d{1,2})?$" ErrorMessage="(Invalid)" Font-Size="Small" Font-Bold="true" />
                        <asp:TextBox ID="txtEstimatedElect" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                    </div>
                    <div class="col-md-3 p-1 ">
                        Estimated Cost-Civil (In Rs)               
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ForeColor="Red" ControlToValidate="txtEstimatedCivil" ValidationGroup="TubewellEntry" Display="Dynamic"
                    ValidationExpression="^(\d{1,18})(.\d{1,2})?$" ErrorMessage="(Invalid)" Font-Size="Small" Font-Bold="true" />
                        <asp:TextBox ID="txtEstimatedCivil" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                    </div>
                    <div class="col-md-3 p-1 ">
                        Revised Estimated Cost (If any)                
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ForeColor="Red" ControlToValidate="txtRevisedEC" ValidationGroup="TubewellEntry" Display="Dynamic"
                            ValidationExpression="^(\d{1,18})(.\d{1,2})?$" ErrorMessage="(Invalid)" Font-Size="Small" Font-Bold="true" />
                        <asp:TextBox ID="txtRevisedEC" runat="server" CssClass="form-control form-control-sm" placeholder="In Rs"></asp:TextBox>
                    </div>
                    <div class="col-md-6 p-1 ">
                        Upload Estimated Cost Document(PDF only)
                        <%--<asp:RequiredFieldValidator ErrorMessage="(Required)" ControlToValidate="fuPDF" runat="server" Display="Dynamic" ValidationGroup="TubewellEntry" ForeColor="Red" Font-Bold="true" />--%>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ValidationExpression="([a-zA-Z0-9\s_\\.\-:()])+(.pdf)$" ValidationGroup="TubewellEntry" Font-Bold="true"
                            ControlToValidate="fuPDF" runat="server" ForeColor="Red" ErrorMessage="(.pdf file only)"
                            Display="Dynamic" />
                        <br />
                        <asp:FileUpload ID="fuPDF" runat="server" />
                    </div>
                    <div class="col-md-2 p-1 ">
                        <br />
                        <asp:LinkButton ID="lbDownloadMP" runat="server" OnClick="lbDownloadMP_Click">Download Previous pdf</asp:LinkButton>

                    </div>
                </div>
                <div class="p-4 row">
                    <div class="col-md-12 p-1">
                        <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-primary btn-sm" OnClick="btnUpdate_Click" ValidationGroup="TubewellEntry" />
                        <asp:Button ID="btnClose" runat="server" Text="Close" OnClick="btnClose_Click" CssClass="btn btn-primary btn-sm" />
                    </div>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnUpdate" />
                <asp:PostBackTrigger ControlID="btnClose" />
                <asp:PostBackTrigger ControlID="lbDownloadMP" />
            </Triggers>
        </asp:UpdatePanel>
    </asp:Panel>
    <!-- ModalPopupExtender -->
</asp:Content>

