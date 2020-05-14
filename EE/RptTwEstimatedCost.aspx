<%@ Page Title="" Language="C#" MasterPageFile="~/EE/eeMaster.master" AutoEventWireup="true" CodeFile="RptTwEstimatedCost.aspx.cs" Inherits="Nodal_RptTwEstimatedCost" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="padding-left: 16px; padding-right: 16px">
        <br />
        <span class="font-weight-bold small">Tubewell Estimated Cost</span>
        <hr />
    </div>

    <div style="padding-left: 16px; padding-right: 16px">
        <div class="row">
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
                Head Type  
                <asp:DropDownList ID="ddlHead" runat="server" CssClass="form-control form-control-sm" OnSelectedIndexChanged="ddlHead_SelectedIndexChanged" AutoPostBack="true">
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
                    OnPageIndexChanging="gvTubewell_PageIndexChanging" PageSize="1000" AllowPaging="true" ShowFooter="true" FooterStyle-Font-Bold="true">
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
                        <asp:TemplateField HeaderText="District">
                            <ItemTemplate>
                                <asp:Label ID="lblDistName" runat="server" Text='<%# Bind("DistName") %>'></asp:Label>
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

                        <asp:TemplateField HeaderText="Revised">
                            <ItemTemplate>
                                <asp:Label ID="lblRevisedEstimatedCost" runat="server" Text='<%# Bind("RevisedEstimatedCost") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-Wrap="false" HeaderText="Uploaded pdf">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDownload" Text="Download" CommandArgument='<%# Eval("pdfLocation") %>' runat="server" OnClick="lnkDownload_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

        </div>
    </div>
</asp:Content>



