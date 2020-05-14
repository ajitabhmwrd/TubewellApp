<%@ Page Title="" Language="C#" MasterPageFile="~/Nodal/Nodal.master" AutoEventWireup="true" CodeFile="RptTwPysicalFinProgress.aspx.cs" Inherits="Nodal_RptTwPysicalFinProgress" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="padding-left: 25px; padding-right: 25px">
        <br />
        <span class="font-weight-bold small">Tubewell Physical and Financial Progress</span>
        <hr />
    </div>

    <div style="padding-left: 25px; padding-right: 25px">
        <div class="row">

            <div class="col-md-2 p-1">
                District               
                <asp:DropDownList ID="ddlDist" runat="server" CssClass="form-control form-control-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlDist_SelectedIndexChanged">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                </asp:DropDownList>
            </div>
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
                <asp:Button ID="btnClear" runat="server" Text="Reset" CssClass="btn btn-primary btn-sm" OnClick="btnClear_Click" />
            </div>
            <div class="col-md-12 p-2 table-responsive">
                <asp:GridView ID="gvTubewell" runat="server" AutoGenerateColumns="False" CssClass="table table-hover table-bordered table-sm" GridLines="None"
                    HeaderStyle-CssClass="customBgColor text-white" EmptyDataText="No Records Found"
                    OnPageIndexChanging="gvTubewell_PageIndexChanging" PageSize="50" AllowPaging="true" ShowFooter="false" FooterStyle-Font-Bold="true">
                    <Columns>
                        <asp:TemplateField HeaderText="SNo">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ID" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="lblPFID" runat="server" Text='<%# Bind("PFID") %>'></asp:Label>
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
                                <asp:Label ID="lblFinYear" runat="server" Text='<%# Bind("FinYear") %>'></asp:Label>
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
                        <asp:TemplateField HeaderText="MB No,Date" ItemStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblMBNumber" runat="server" Text='<%# Bind("MBNumber") %>'></asp:Label>,
                                <asp:Label ID="lblMBDate" runat="server" Text='<%# Eval("MBDate", "{0:dd/MM/yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Work Nature">
                            <ItemTemplate>
                                <asp:Label ID="lblNatureOfWork" runat="server" Text='<%# Bind("NatureOfWork") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Work Status">
                            <ItemTemplate>
                                <asp:Label ID="lblWorkStatus" runat="server" Text='<%# Bind("WorkStatus") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Electrical Work Progress(%)">
                            <ItemTemplate>
                                <asp:Label ID="lblElectProgress" runat="server" Text='<%# Bind("ElectProgress") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Mechanical Work Progress (%)">
                            <ItemTemplate>
                                <asp:Label ID="lblMechProgress" runat="server" Text='<%# Bind("MechProgress") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Civil Work Progress (%)">
                            <ItemTemplate>
                                <asp:Label ID="lblCivilProgress" runat="server" Text='<%# Bind("CivilProgress") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Over All Progress (%)">
                            <ItemTemplate>
                                <asp:Label ID="lblOverAllProgress" runat="server" Text='<%# Bind("OverAllProgress") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Agreement Amount (In Rs)">
                            <ItemTemplate>
                                <asp:Label ID="lblAgreementAmount" runat="server" Text='<%# Bind("AgreementAmount") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Expenditure Amount (In Rs)">
                            <ItemTemplate>
                                <asp:Label ID="lblExpenditureAmount" runat="server" Text='<%# Bind("ExpenditureAmount") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-Wrap="false" HeaderText="Uploaded pdf">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDownload" Text="Download" CommandArgument='<%# Eval("PdfPath") %>' runat="server" OnClick="lnkDownload_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
            </div>

        </div>
    </div>
</asp:Content>

