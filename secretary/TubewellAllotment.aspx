<%@ Page Title="" Language="C#" MasterPageFile="~/secretary/Nodal.master" AutoEventWireup="true" CodeFile="TubewellAllotment.aspx.cs" Inherits="Nodal_TubewellAllotment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <br />
        <span class="font-weight-bold small">Tube Well Allotment</span>
        <hr />
    </div>
    <div class="container">
        <div class="row">            
            <div class="col-md-2 p-1">
                Financial Year
                <asp:DropDownList ID="ddlFinYear" runat="server" CssClass="form-control form-control-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlFinYear_SelectedIndexChanged">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-md-2 p-1">
                Head Type  
                <asp:DropDownList ID="ddlHead" runat="server" CssClass="form-control form-control-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlHead_SelectedIndexChanged">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                </asp:DropDownList>
            </div>

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
            <div class="col-md-12 p-1">
                <asp:Button ID="btnClear" runat="server" Text="Reset" CssClass="btn btn-primary btn-sm" OnClick="btnClear_Click" />
            </div>
            <div class="col-md-12 p-2 table-responsive">
                <asp:GridView ID="gvTubewell" runat="server" AutoGenerateColumns="False" CssClass="table table-hover table-bordered table-sm" GridLines="None"
                    HeaderStyle-CssClass="customBgColor text-white" EmptyDataText="No Records Found"
                    OnPageIndexChanging="gvTubewell_PageIndexChanging" PageSize="100" AllowPaging="true" ShowFooter="true" FooterStyle-Font-Bold="true">
                    <Columns>
                        <asp:TemplateField HeaderText="SNo">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ID">
                            <ItemTemplate>
                                <asp:Label ID="lblTubewellID" runat="server" Text='<%# Bind("TubewellID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Tube well Name">
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
                        <asp:TemplateField HeaderText="Financial Year">
                            <ItemTemplate>
                                <asp:Label ID="lblFinancialYear" runat="server" Text='<%# Bind("FinancialYear") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Letter No">
                            <ItemTemplate>
                                <asp:Label ID="lblLetterNo" runat="server" Text='<%# Bind("LetterNo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Letter Date" ItemStyle-Wrap="false" >
                            <ItemTemplate>
                                <asp:Label ID="lblLetterDate" runat="server" Text='<%# Bind("LetterDate","{0:dd-MM-yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Head" ItemStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblHeadType" runat="server" Text='<%# Bind("HeadType") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Estimated Cost (In Rs)">
                            <ItemTemplate>
                                <asp:Label ID="lblEstimatedCost" runat="server" Text='<%# Bind("EstimatedCost") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Allotment (In Rs)">
                            <ItemTemplate>
                                <asp:Label ID="lblAllotmentAmount" runat="server" Text='<%# Bind("AllotmentAmount") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
