<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Nodal/Nodal.master" CodeFile="rptTubewellPanchayatBlock.aspx.cs" Inherits="Nodal_rptTubewellPanchayatBlock" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <br />
        <span class="font-weight-bold small">Tube Well Panchayat List</span>
        <hr />
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-12 p-1">
                <a class="btn btn-primary btn-sm" href="rptTubewellHandOverByDist.aspx">Back</a>
            </div>
            <div class="col-md-12 p-1">
                <asp:Label ID="lblBlockCode" runat="server" Text="" Visible="false"></asp:Label>
                Block : <asp:Label ID="lblBlock" runat="server" ForeColor="Blue" Font-Bold="True"></asp:Label>, 
                <asp:Label ID="lblDistCode" runat="server" Text="" Visible="false"></asp:Label>
                District : <asp:Label ID="lblDist" runat="server" ForeColor="Blue" Font-Bold="True"></asp:Label>
            </div>
            
            <div class="col-md-12 p-2 table-responsive">
                <asp:GridView ID="gvTubewell" runat="server" AutoGenerateColumns="False" CssClass="table table-hover table-bordered table-sm" GridLines="None"
                    HeaderStyle-CssClass="customBgColor text-white" EmptyDataText="No Records Found">
                    <Columns>
                        <asp:TemplateField HeaderText="SNo">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
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
                        
                    </Columns>
                </asp:GridView>
            </div>

        </div>
    </div>
</asp:Content>