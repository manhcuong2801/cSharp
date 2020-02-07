<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Usage.aspx.cs" Inherits="Project.student.Usage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Usage</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="../table/images/icons/favicon.ico" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../table/vendor/bootstrap/../table/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../table/fonts/font-awesome-4.7.0/../table/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../table/vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../table/vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../table/vendor/perfect-scrollbar/perfect-scrollbar.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../table/css/util.css">
    <link rel="stylesheet" type="text/css" href="../table/css/main.css">
    <!--===============================================================================================-->
    <style type="text/css">
        .auto-style1 {
            width: 461px;
        }
        .table {}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="limiter">
            <div class="container-table100">
                <div class="wrap-table100">

                    <table style="width: 100%;">
                        <tr>
                            <td class="auto-style1">
                                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Xem sử dụng mức điện/nước"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style1">
                                <asp:Label ID="Label3" runat="server" Text="Year"></asp:Label>
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="getYear" DataTextField="yearOfSemester" DataValueField="yearOfSemester"></asp:DropDownList>
                              
                              
                              
                                <asp:SqlDataSource ID="getYear" runat="server" ConnectionString="Data Source=.;Initial Catalog=PRO_PRN292;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT DISTINCT [yearOfSemester] FROM [History] WHERE ([studentID] = @studentID)">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="studentID" SessionField="studentID" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                              
                              
                              
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style1">
                                <asp:Label ID="Label2" runat="server" Font-Size="Large" Text="Term"></asp:Label>
                                <asp:DropDownList ID="DropDownListTerm" runat="server" DataSourceID="SqlDataSource2" DataTextField="semester" DataValueField="semester" Height="31px" Width="97px">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MyConnection %>" SelectCommand="SELECT  DISTINCT [semester] FROM [History]"></asp:SqlDataSource>
                                
                                <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" Width="133px" Height="35px" />
                                
                            </td>
                            <td class="auto-style3">
                                &nbsp;</td>
                        </tr>
                    </table>
                    <%--<asp:GridView CssClass="table" ID="GridView1" runat="server" AutoGenerateColumns="False" EnableModelValidation="True" EnableSortingAndPagingCallbacks="True">
                        <Columns>
                            <asp:BoundField DataField="domName" HeaderText="Dom">
                                <HeaderStyle CssClass="cell" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Width="120px" />
                                <ItemStyle CssClass="cell" HorizontalAlign="Justify" VerticalAlign="Middle" Width="120px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="roomName" HeaderText="Room">
                                <HeaderStyle CssClass="cell" HorizontalAlign="Center" VerticalAlign="Middle" Width="200px" />
                                <ItemStyle CssClass="cell" HorizontalAlign="Center" VerticalAlign="Middle" Width="200px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="time" HeaderText="Time">
                                <HeaderStyle CssClass="cell" HorizontalAlign="Center" VerticalAlign="Middle" Width="200px" />
                                <ItemStyle CssClass="cell" HorizontalAlign="Center" VerticalAlign="Middle" Width="200px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="typeName" HeaderText="Type">
                                <HeaderStyle CssClass="cell" HorizontalAlign="Center" VerticalAlign="Middle" Width="200px" />
                                <ItemStyle CssClass="cell" HorizontalAlign="Center" VerticalAlign="Middle" Width="200px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="numOfMeter" HeaderText="Number Of Meter">
                                <HeaderStyle CssClass="cell" HorizontalAlign="Center" VerticalAlign="Middle" Width="200px" />
                                <ItemStyle CssClass="cell" HorizontalAlign="Center" VerticalAlign="Middle" Width="200px" />
                            </asp:BoundField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div align="center">No records found.</div>
                        </EmptyDataTemplate>
                        <HeaderStyle CssClass="row header" ForeColor="White" />
                    <RowStyle CssClass="row" />
                    </asp:GridView>--%>
                    <asp:GridView CssClass="table" EnableModelValidation="True" EnableSortingAndPagingCallbacks="True" ID="GridView1" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="447px">
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Width="80px" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <RowStyle ForeColor="#000066" HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" Wrap="False" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                </div>
            </div>
        </div>
        <!--===============================================================================================-->
        <script src="../table/vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="../table//vendor/bootstrap/js/popper.js"></script>
        <script src="../table//vendor/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="../table//vendor/select2/select2.min.js"></script>
        <!--===============================================================================================-->
        <script src="js/main.js"></script>
    </form>
</body>
</html>
