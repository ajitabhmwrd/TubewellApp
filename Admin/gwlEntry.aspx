<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Master.master" AutoEventWireup="true" CodeFile="gwlEntry.aspx.cs" Inherits="Admin_gwlEntry" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">    
    <Titles>
        <asp:Title Text="Total marks of students">
        </asp:Title>
    </Titles>
    <Series>
        <asp:Series Name="Series1"  ChartArea="ChartArea1">
            <Points>
                <asp:DataPoint AxisLabel="Mark" YValues="800" />
                <asp:DataPoint AxisLabel="Steve" YValues="900" />
                <asp:DataPoint AxisLabel="John" YValues="700" />
                <asp:DataPoint AxisLabel="Mary" YValues="900" />
                <asp:DataPoint AxisLabel="Ben" YValues="600" />
            </Points>
        </asp:Series>
    </Series>
    <ChartAreas>
        <asp:ChartArea Name="ChartArea1">
            <AxisX Title="Student Name">
            </AxisX>
            <AxisY Title="Total Marks">
            </AxisY>
        </asp:ChartArea>
    </ChartAreas>
</asp:Chart>
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
            <td>
                <br />
                Select Setllement Date
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

