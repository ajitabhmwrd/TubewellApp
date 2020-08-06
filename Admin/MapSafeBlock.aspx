<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Master.master" AutoEventWireup="true" CodeFile="MapSafeBlock.aspx.cs" Inherits="Operator_MapSafeBlock" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <br />
        <span class="font-weight-bold small">Map critical block</span>
        <hr />
    </div>
    <div class="container">
        <div class="row">

            <div class="col-md-12 p-1">
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
            </div>
            <div class="col-md-2 p-1">
                District*
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" InitialValue="0" runat="server" ControlToValidate="ddlDist" Display="Dynamic" Text="(Select)" ErrorMessage="Select Block" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                <asp:DropDownList ID="ddlDist" runat="server" CssClass="form-control form-control-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlDist_SelectedIndexChanged">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-md-2 p-1">
                Block*
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" InitialValue="0" runat="server" ControlToValidate="ddlBlock" Display="Dynamic" Text="(Select)" ErrorMessage="Select Block" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                <asp:DropDownList ID="ddlBlock" runat="server" CssClass="form-control form-control-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlBlock_SelectedIndexChanged" >
                    <asp:ListItem Value="0">Select</asp:ListItem>
                </asp:DropDownList>
            </div>
            
            <div class="col-md-2 p-1">
                Is Safe Block*
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" InitialValue="0" runat="server" ControlToValidate="ddlIsSafeBlock" Display="Dynamic" Text="(Select)" ErrorMessage="Select Block" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                <asp:DropDownList ID="ddlIsSafeBlock" runat="server" CssClass="form-control form-control-sm" >
                    <asp:ListItem Value="0">Select</asp:ListItem>
                    <asp:ListItem Value="Y">Yes</asp:ListItem>
                    <asp:ListItem Value="N">No</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-md-3 p-1 ">
                SOD*
                <asp:RequiredFieldValidator ErrorMessage="(Enter)" ControlToValidate="txtSOD" runat="server" Display="Dynamic" ValidationGroup="TubewellEntry" ForeColor="Red" Font-Bold="true" Font-Size="Small" />
                <asp:RegularExpressionValidator runat="server" ForeColor="Red" ControlToValidate="txtSOD" ValidationGroup="TubewellEntry" Display="Dynamic"
                    ValidationExpression="^(\d{1,18})(.\d{1,2})?$" ErrorMessage="(Invalid)" Font-Size="Small" Font-Bold="true" />
                <asp:TextBox ID="txtSOD" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
            </div>
            <div class="col-md-2 p-1"></div>
            <div class="col-md-4 p-1 ">
                Average Annual Rainfall (In mm) Last 4 Year*
                <asp:RequiredFieldValidator ErrorMessage="(Enter)" ControlToValidate="txtAvgRainfall" runat="server" Display="Dynamic" ValidationGroup="TubewellEntry" ForeColor="Red" Font-Bold="true" Font-Size="Small" />
                <asp:RegularExpressionValidator runat="server" ForeColor="Red" ControlToValidate="txtAvgRainfall" ValidationGroup="TubewellEntry" Display="Dynamic"
                    ValidationExpression="^(\d{1,18})(.\d{1,2})?$" ErrorMessage="(Invalid)" Font-Size="Small" Font-Bold="true" />
                <asp:TextBox ID="txtAvgRainfall" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
            </div>
            <div>
                <br />
                <asp:Button ID="btnsave" runat="server" Text="Save" CssClass="btn btn-primary btn-sm" OnClick="btnsave_Click" ValidationGroup="TubewellEntry" />
                <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn btn-primary btn-sm" OnClick="btnReset_Click"  />
            </div>
            <div class="col-md-12 p-2 table-responsive">
                <asp:GridView ID="gvTubewell" runat="server" AutoGenerateColumns="False" CssClass="table table-hover table-bordered table-sm" GridLines="None"
                    HeaderStyle-CssClass="customBgColor text-white" EmptyDataText="No Records Found"                    >
                    <Columns>
                        <asp:TemplateField HeaderText="SNo">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ID" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="lblBlockCode" runat="server" Text='<%# Bind("BlockCode") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblDistCode" runat="server" Text='<%# Bind("DistCode") %>' Visible="false"></asp:Label>
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
                        <asp:TemplateField HeaderText="Is Safe Block PMKSY">
                            <ItemTemplate>
                                <asp:Label ID="lblIsSafeBlockPMKSY" runat="server" Text='<%# Bind("IsSafeBlockPMKSY") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="SOD">
                            <ItemTemplate>
                                <asp:Label ID="lblsod" runat="server" Text='<%# Bind("sod") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Avg Rainfall Last 4 Year">
                            <ItemTemplate>
                                <asp:Label ID="lblAvgRainfall" runat="server" Text='<%# Bind("AvgRainfall") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn-primary" OnClick="btnEdit_Click"></asp:Button>
                            </ItemTemplate>
                        </asp:TemplateField>
                                             
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>

