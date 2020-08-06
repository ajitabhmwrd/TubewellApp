<%@ Page Title="" Language="C#" MasterPageFile="~/EE/eeMaster.master" AutoEventWireup="true" CodeFile="TwRequisitionPrint.aspx.cs" Inherits="EE_TwRequisitionPrint" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../myContent/Style/printStyle.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <style>
        @media print {
            .hideCol {
                display: none;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <a class="btn btn-primary btn-sm" href="TwAllotmentRequisitionPlan.aspx"><i class="fas fa-arrow-circle-left	" aria-hidden="true"></i></a>
                <input id="btnPrint1" type="button" class="btn btn-sm btn-primary " value="Print" onclick="window.print();" />
                <span class="font-weight-bold">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Add Tube Well Allotment Requisition for running Schemes (Plan)</span>
                <hr />
            </div>
        </div>
    </div>
    <div id="section-to-print">
        <div class="container">
            <div class="row">
                <div class="col-md-12 mt-1" style="font-size:18px">
                    <br />
                    पत्रांक : __________________________&nbsp;&nbsp;&nbsp;&nbsp; दिनांक : ________________________<br />
                    <br />
                    सेवा में,<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; प्रभारी,<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; नलकूप कोषांग,<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; लघु जल संसाधन विभाग, बिहार<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; पटना |<br />
                    विषय : नलकूपों के जीर्णोध्दार हेतु अधियाचना |<br />
                    <br />
                    महाश्य,<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; लघु सिचाई प्रमंडल
                <asp:Label ID="lblDist" runat="server" Text="" Style="font-weight: 700"></asp:Label>
                    &nbsp;के
                <asp:Label ID="lblCount" runat="server" Text="" Style="font-weight: 700"></asp:Label>
                    &nbsp;नलकूपों&nbsp;के लिए जीर्णोध्दार हेतु अधियाचना निम्नवत की जाती है |<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                </div>
                <div class="col-md-12 mt-1">
                    <b>Tube Well Allotment Requisition List (Requisition ID=<asp:Label ID="lblRequisitionID" runat="server" Text="" Font-Bold="true"></asp:Label>) </b>
                    <asp:GridView ID="gvFinalReq" runat="server" CssClass="tableCust" AutoGenerateColumns="false" OnRowDataBound="gvFinalReq_RowDataBound" EmptyDataText="No Record Added">
                        <Columns>
                            <asp:TemplateField HeaderText="SNo">
                                <ItemTemplate>
                                    <asp:Label ID="lblartdID" runat="server" Text='<%#Bind("artdID") %>' Visible="false"></asp:Label>
                                    <asp:Label ID="lblRequisitionID" runat="server" Text='<%#Bind("RequisitionID") %>' Visible="false"></asp:Label>
                                    <asp:Label ID="lblTubewellID" runat="server" Text='<%#Bind("TubewellID") %>' Visible="false"></asp:Label>
                                    <asp:Label ID="lblAdmAprID" runat="server" Text='<%#Bind("AdmAprID") %>' Visible="false"></asp:Label>
                                    <%#Container.DataItemIndex+1 %>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Tubewell / Panchayat / Block" ItemStyle-Width="150px">
                                <ItemTemplate>
                                    <asp:Label ID="lblName" runat="server" Text='<%# Bind("Name") %>'></asp:Label> / 
                                    <asp:Label ID="lblPanchayatName" runat="server" Text='<%# Bind("PanchayatName") %>'></asp:Label> / 
                                    <asp:Label ID="lblBlockName" runat="server" Text='<%# Bind("BlockName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Type/Status">
                                <ItemTemplate>
                                    <b>Type : </b>
                                    <asp:Label ID="lblType" runat="server" Text='<%# Bind("Type") %>'></asp:Label><br />
                                    <b>Status : </b>
                                    <asp:Label ID="lblappliedStatus" runat="server" Text='<%# Bind("appliedStatus") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="CSO Status">
                                <ItemTemplate>
                                    <asp:Label ID="lblCSOStatus" runat="server" Text='<%# Bind("CSOStatus") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Estimated Cost">
                                <ItemTemplate>
                                    <asp:Label ID="lblEstimatedCost" runat="server" Text='<%# Bind("EstimatedCost") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Revised EC">
                                <ItemTemplate>
                                    <asp:Label ID="lblRevisedEC" runat="server" Text='<%# Bind("RevisedEC") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Allotment & Expenditure(In Rs)">
                                <ItemTemplate>
                                    <asp:GridView ID="gvFRAllotment" runat="server" AutoGenerateColumns="false">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Fin Yr" ItemStyle-Wrap="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblFinancialYear" runat="server" Text='<%# Bind("FinancialYear") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Allotment">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAllotmentAmount" runat="server" Text='<%# Bind("AllotmentAmount") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Expenditure">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblExpenditure" runat="server" Text='<%# Bind("Expenditure") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Work Progress(%)">
                                <ItemTemplate>
                                    <asp:Label ID="lblWorkProgress" runat="server" Text='<%# Bind("WorkProgress") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Requsition Amount">
                                <ItemTemplate>
                                    <asp:Label ID="lblRequsitionAmount" runat="server" Text='<%# Bind("RequsitionAmount") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Remarks" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <asp:Label ID="lblRemarks" runat="server" Text='<%# Bind("Remarks") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-Wrap="false" HeaderText="Photo">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDownloadPhoto" Text="" CommandArgument='<%# Eval("PhotoLocaltion") %>' runat="server" OnClick="lnkDownload_Click">
                                    <i class="fa fa-download" aria-hidden="true"  data-toggle="tooltip" data-placement="bottom" title="Download Photo"></i>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                            <asp:TemplateField ItemStyle-Wrap="false" HeaderText="MB" ItemStyle-CssClass="hideCol" HeaderStyle-CssClass="hideCol">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkDownloadMB" Text="" CommandArgument='<%# Eval("MBLocation") %>' runat="server" OnClick="lnkDownload_Click">
                                    <i class="fa fa-download" aria-hidden="true"  data-toggle="tooltip" data-placement="bottom" title="Download MB"></i>
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-Wrap="false" HeaderText="UC" ItemStyle-CssClass="hideCol" HeaderStyle-CssClass="hideCol">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkDownloadUC" Text="" CommandArgument='<%# Eval("UCLocation") %>' runat="server" OnClick="lnkDownload_Click">
                                    <i class="fa fa-download" aria-hidden="true"  data-toggle="tooltip" data-placement="bottom" title="Download UC"></i>
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>

            <br />
            <div class="col-md-12 text-right" style="font-size:18px">
                <br />
                <br />
                <br />
                <br />
                <br />
                कार्यपालक अभियंता<br />
                लघु सिचाई प्रमंडल,
                    <asp:Label ID="lblDistName" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </div>
    </div>
    <br />
</asp:Content>

