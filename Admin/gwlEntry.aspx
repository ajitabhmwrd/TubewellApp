<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Master.master" AutoEventWireup="true" CodeFile="gwlEntry.aspx.cs" Inherits="Admin_gwlEntry" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">    
    
    <table border="0" cellpadding="0" cellspacing="0" width="500px" class="tablecontentR">
        <tr>
            <th align="center" colspan="2" class="button2" style="color: Black;">Upload 
                    Excel Panel(For Payment Status Update)
            </th>
        </tr>
        <tr>
            <td colspan="2" align="center" style="text-align: center">&nbsp;</td>
        </tr>
        <tr>
            <td align="right">Upload Excel File 
            </td>
            <td align="left">
                <asp:FileUpload ID="FileUpload1" runat="server" />

            </td>
        </tr>
        <tr>
            <td  align="right">
                <br />
                Select Date 
            </td>
            <td>
                <br />
                <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
                <cc1:calendarextender id="txtDate_CalendarExtender" runat="server"
                    enabled="True" targetcontrolid="txtDate" format="yyyy-MM-dd">
                </cc1:calendarextender>
            </td>
        </tr>

        <tr>
            <td>&nbsp;</td>
        </tr>

        <tr>
            <td colspan="2" align="center" style="text-align: center">
                <asp:Button ID="btnUpload" runat="server" Text="Upload File"
                    OnClientClick="return ValidateFile()" OnClick="btnUpload_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="lblextMsg" ForeColor="Red" CssClass="NormalRed" runat="server"></asp:Label>
                <asp:Label ID="Label1" ForeColor="Red" CssClass="NormalRed" runat="server"></asp:Label>
            </td>
        </tr>
    </table>

</asp:Content>

