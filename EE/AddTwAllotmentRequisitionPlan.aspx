<%@ Page Title="" Language="C#" MasterPageFile="~/EE/eeMaster.master" AutoEventWireup="true" CodeFile="AddTwAllotmentRequisitionPlan.aspx.cs" Inherits="EE_AddTwAllotmentRequisitionPlan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <a class="btn btn-primary btn-sm" href="TwAllotmentRequisitionPlan.aspx"><i class="fas fa-arrow-circle-left	" aria-hidden="true"></i></a>
                <asp:Button ID="btnLock" runat="server" Visible="false" Text="Finalize" CssClass="btn btn-danger btn-sm" OnClick="btnLock_Click" OnClientClick="return  confirm('Are you sure. This will lock all data, you will not able to change any data after locking!!!!')" />
                <span class="font-weight-bold">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Add Tube Well Allotment Requisition for running Schemes (Plan)</span>
                <hr />
            </div>
            
        </div>
        
        <div id="divCommon" runat="server" class="row">
            <div class="col-md-12">
                <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Red" Font-Bold="true"></asp:Label>
            </div>
            <div class="col-md-2 p-1">
                Block*
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" InitialValue="0" runat="server" ControlToValidate="ddlBlock" Display="Dynamic" Text="(Select)" ErrorMessage="Select Block" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                <asp:DropDownList ID="ddlBlock" runat="server" CssClass="form-control form-control-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlBlock_SelectedIndexChanged">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-md-2 p-1">
                Panchyat*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" InitialValue="0" runat="server" ControlToValidate="ddlPanchayat" Text="(Select)" ErrorMessage="Select Panchayat" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                <asp:DropDownList ID="ddlPanchayat" runat="server" CssClass="form-control form-control-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlPanchayat_SelectedIndexChanged">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-md-2 p-1">
                Tubewell*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" InitialValue="0" runat="server" ControlToValidate="ddlTubewell" Text="(Select)" ErrorMessage="Select Village" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                <asp:DropDownList ID="ddlTubewell" runat="server" CssClass="form-control form-control-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlTubewell_SelectedIndexChanged">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                </asp:DropDownList>
            </div>
            
        </div>
        <div id="divMukhiya" runat="server" class="row" visible="false">
            <div class="col-md-12 mt-1">
                <b>Tube well Details :</b>
                <asp:GridView ID="gvTubewell" runat="server" AutoGenerateColumns="False" GridLines="None"
                    CssClass="tableCust" EmptyDataText="No Records Found">
                    <Columns>
                        <asp:TemplateField HeaderText="SNo">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tubewell ID">
                            <ItemTemplate>
                                <asp:Label ID="lblID" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="CA Number">
                            <ItemTemplate>
                                <asp:Label ID="lblConsumerID" runat="server" Text='<%# Bind("ConsumerID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <asp:Label ID="lblName" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="DistName">
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
                        <asp:TemplateField HeaderText="Type" ItemStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblType" runat="server" Text='<%# Bind("Type") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Status" ItemStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="CSO Status" ItemStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblCriticalType" runat="server" Text='<%# Bind("CriticalType") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <div class="col-md-12 mt-1">
                <b>Estimate : </b>
                <asp:GridView ID="gvEC" runat="server" CssClass="tableCust" AutoGenerateColumns="false">
                    <Columns>
                        <asp:TemplateField HeaderText="SNo">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Estimate ID">
                            <ItemTemplate>
                                <asp:Label ID="lblIsRevised" runat="server" Text='<%# Bind("IsRevised") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblID" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Estimated Cost (In Rs)">
                            <ItemTemplate>
                                <asp:Label ID="lblEstimatedCost" runat="server" Text='<%# Bind("EstimatedCost") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Revised Estimate (In Rs)">
                            <ItemTemplate>
                                <asp:Label ID="lblRevisedEC" runat="server" Text='<%# Bind("RevisedEC") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Technical Sanction (In Rs)">
                            <ItemTemplate>
                                <asp:Label ID="lblTechnicalSanctionAmount" runat="server" Text='<%# Bind("TechnicalSanctionAmount") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Administrative Approval (In Rs)">
                            <ItemTemplate>
                                <asp:Label ID="lblAdministrativeApprovalAmount" runat="server" Text='<%# Bind("AdministrativeApprovalAmount") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <div class="row">
                    <div class="col-md-3 mt-1" visible="false">
                        Tecnical Sanction (In Rs)* 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtTS" Text="(Enter)" ErrorMessage="Enter Name" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ForeColor="Red" ControlToValidate="txtTS" ValidationGroup="TubewellEntry" Display="Dynamic"
                            ValidationExpression="^(\d{1,18})(.\d{1,2})?$" ErrorMessage="(Invalid)" Font-Size="Small" Font-Bold="true" />
                        <asp:TextBox ID="txtTS" runat="server" CssClass="form-control form-control-sm" placeholder="In Rs"></asp:TextBox>
                    </div>
                    <div class="col-md-3 mt-1" visible="false">
                        Administrative Approval (In Rs)* 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtAAAmount" Text="(Enter)" ErrorMessage="Enter Name" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ForeColor="Red" ControlToValidate="txtAAAmount" ValidationGroup="TubewellEntry" Display="Dynamic"
                            ValidationExpression="^(\d{1,18})(.\d{1,2})?$" ErrorMessage="(Invalid)" Font-Size="Small" Font-Bold="true" />
                        <asp:TextBox ID="txtAAAmount" runat="server" CssClass="form-control form-control-sm" placeholder="In Rs"></asp:TextBox>
                    </div>
                    <div class="col-md-6"></div>
                    <div class="col-md-3 mt-1">
                        Is Revised Estimated Cost*
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" InitialValue="0" runat="server" ControlToValidate="ddlIsRevised" Display="Dynamic" Text="(Select)" ErrorMessage="Select Block" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                        <asp:DropDownList ID="ddlIsRevised" runat="server" CssClass="form-control form-control-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlIsRevised_SelectedIndexChanged">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                            <asp:ListItem Value="Y">Yes</asp:ListItem>
                            <asp:ListItem Value="N">No</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div id="divIsRevisedECApprovedBy" runat="server" class="col-md-3 mt-1" visible="false">
                        Reviesed Estimate Approved By*
                    <asp:RequiredFieldValidator ID="rfRevisedECApprovedBy" InitialValue="0" runat="server" ControlToValidate="ddlRevisedECApprovedBy" Display="Dynamic" Text="(Select)" ErrorMessage="Select Block" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                        <asp:DropDownList ID="ddlRevisedECApprovedBy" runat="server" CssClass="form-control form-control-sm">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                            <asp:ListItem Value="CE">CE</asp:ListItem>
                            <asp:ListItem Value="SE">SE</asp:ListItem>
                            <asp:ListItem Value="EE">EE</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div id="divIsRevised" runat="server" class="col-md-3 mt-1" visible="false">
                        Revised Estimated Cost* 
                    <asp:RequiredFieldValidator ID="rfRevisedEstimate" runat="server" ControlToValidate="txtRevisedEstimate" Text="(Enter)" ErrorMessage="Enter Name" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ForeColor="Red" ControlToValidate="txtRevisedEstimate" ValidationGroup="TubewellEntry" Display="Dynamic"
                            ValidationExpression="^(\d{1,18})(.\d{1,2})?$" ErrorMessage="(Invalid)" Font-Size="Small" Font-Bold="true" />
                        <asp:TextBox ID="txtRevisedEstimate" runat="server" CssClass="form-control form-control-sm" placeholder="In Rs"></asp:TextBox>
                    </div>
                    
                </div>
            </div>
            <div class="col-md-12 mt-1">
                <b>Allotment : </b>
                <asp:GridView ID="gvAllotment" runat="server" CssClass="tableCust" AutoGenerateColumns="false">
                    <Columns>
                        <asp:TemplateField HeaderText="SNo">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Allotment ID">
                            <ItemTemplate>
                                <asp:Label ID="lblAllotmentID" runat="server" Text='<%# Bind("AllotmentID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Financial Year">
                            <ItemTemplate>
                                <asp:Label ID="lblFinancialYear" runat="server" Text='<%# Bind("FinancialYear") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Head Type">
                            <ItemTemplate>
                                <asp:Label ID="lblHeadType" runat="server" Text='<%# Bind("HeadType") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Letter No">
                            <ItemTemplate>
                                <asp:Label ID="lblLetterNo" runat="server" Text='<%# Bind("LetterNo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Letter Date">
                            <ItemTemplate>
                                <asp:Label ID="lblLetterDate" runat="server" Text='<%# Eval("LetterDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Allotment Amount(In Rs)">
                            <ItemTemplate>
                                <asp:Label ID="lblAllotmentAmount" runat="server" Text='<%# Bind("AllotmentAmount") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Expenditure Amount (In Rs)">
                            <ItemTemplate>
                                <asp:TextBox ID="txtExpenditure" runat="server" AutoPostBack="true" OnTextChanged="txtExpenditure_TextChanged" Text='<%#Bind("Expenditure") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="txtExpenditure" Text="(Enter)" ErrorMessage="Enter Name" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True" Display="Dynamic"></asp:RequiredFieldValidator>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Surrender Amount (In Rs)">
                            <ItemTemplate>
                                <asp:Label ID="lblSurrender" runat="server" Text='<%# Bind("SurrenderAmount") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-3 mt-1" visible="false">
                        Work Progress (%)* 
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtWorkProgress" Text="(Enter)" ErrorMessage="Enter Name" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="rangeValidator1" runat="server" ControlToValidate="txtWorkProgress" MaximumValue="100" MinimumValue="1" ValidationGroup="TubewellEntry"
                            Type="Integer"     Display="Dynamic" ForeColor="Red" ErrorMessage="(Invalid)" Font-Bold="true" />                       
                        <asp:TextBox ID="txtWorkProgress" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                    </div>
                    <div class="col-md-3 mt-1" visible="false">
                        Requisition Amount (In Rs)* 
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtRequisitionAmount" Text="(Enter)" ErrorMessage="Enter Name" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ForeColor="Red" ControlToValidate="txtRequisitionAmount" ValidationGroup="TubewellEntry" Display="Dynamic"
                            ValidationExpression="^(\d{1,18})(.\d{1,2})?$" ErrorMessage="(Invalid)" Font-Size="Small" Font-Bold="true" />
                        <asp:TextBox ID="txtRequisitionAmount" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                    </div>
                    <div class="col-md-6 mt-1" visible="false">
                        Remarks                        
                        <asp:TextBox ID="txtRemarks" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                    </div>
                    <div class="col-md-12 mt-1">
                        Upload Photo (jpg only)*
                        <asp:FileUpload ID="fuPhoto" runat="server" />
                    </div>
                    <div class="col-md-12 mt-1">
                        Upload MB (PDF only)*
                        <asp:FileUpload ID="fuMBPDF" runat="server" />
                    </div>
                    <div class="col-md-12 mt-1">
                        Upload UC (PDF only)*
                        <asp:FileUpload ID="fuUCPDF" runat="server" />
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 mt-1">
                <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-primary btn-sm" OnClick="btnAdd_Click" ValidationGroup="TubewellEntry" />
                <asp:Button ID="Button1" runat="server" Text="Reset" CssClass="btn btn-secondary btn-sm" OnClick="btnReset_Click" />
            </div>
            <div class="col-md-12 mt-1">
                <b>Tube Well Allotment Requisition List : </b>
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

                        <asp:TemplateField HeaderText="Tubewell, Panchayat, Block">
                            <ItemTemplate>
                                <asp:Label ID="lblName" runat="server" Text='<%# Bind("Name") %>'></asp:Label>,<br />
                                <asp:Label ID="lblPanchayatName" runat="server" Text='<%# Bind("PanchayatName") %>'></asp:Label>,<br />
                                <asp:Label ID="lblBlockName" runat="server" Text='<%# Bind("BlockName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Type">
                            <ItemTemplate>
                                <asp:Label ID="lblType" runat="server" Text='<%# Bind("Type") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
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
                        <asp:TemplateField HeaderText="Allotment & Expenditure"> 
                            <ItemTemplate>
                                <asp:GridView ID="gvFRAllotment" runat="server" AutoGenerateColumns="false" >
                                    <Columns>
                                        <asp:TemplateField HeaderText="Financial Year">
                                            <ItemTemplate>
                                                <asp:Label ID="lblFinancialYear" runat="server" Text='<%# Bind("FinancialYear") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Allotment (In Rs)">
                                            <ItemTemplate>
                                                <asp:Label ID="lblAllotmentAmount" runat="server" Text='<%# Bind("AllotmentAmount") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Expenditure (In Rs)">
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
                        <asp:TemplateField HeaderText="Remarks">
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
                        <asp:TemplateField ItemStyle-Wrap="false" HeaderText="MB">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDownloadMB" Text="" CommandArgument='<%# Eval("MBLocation") %>' runat="server" OnClick="lnkDownload_Click">
                                    <i class="fa fa-download" aria-hidden="true"  data-toggle="tooltip" data-placement="bottom" title="Download MB"></i>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField ItemStyle-Wrap="false" HeaderText="UC">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDownloadUC" Text="" CommandArgument='<%# Eval("UCLocation") %>' runat="server" OnClick="lnkDownload_Click">
                                    <i class="fa fa-download" aria-hidden="true"  data-toggle="tooltip" data-placement="bottom" title="Download UC"></i>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-Wrap="false" HeaderText="">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDelete" runat="server" OnClick="lnkDelete_Click" OnClientClick="return  confirm('Are you sure. This will delete the record. This cannot be undone!!!!')">
                                    <i class="fa fa-trash-alt" aria-hidden="true"  data-toggle="tooltip" data-placement="bottom" title="Delete" ></i>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
    <br />
</asp:Content>

