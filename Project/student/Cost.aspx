<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cost.aspx.cs" Inherits="Project.student.Cost" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cost</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="../Styles/table/images/icons/favicon.ico" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../Styles/table/../Styles/table/../Styles/table/vendor/bootstrap/../Styles/table/css/bootstrap.min.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../Styles/table/fonts/font-awesome-4.7.0/../Styles/table/css/font-awesome.min.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../Styles/table/../Styles/table/../Styles/table/vendor/animate/animate.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../Styles/table/../Styles/table/../Styles/table/vendor/select2/select2.min.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../Styles/table/../Styles/table/../Styles/table/vendor/perfect-scrollbar/perfect-scrollbar.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="../Styles/table/css/util.css" />
    <link rel="stylesheet" type="text/css" href="../Styles/table/css/main.css" />
    <!--===============================================================================================-->
    <style type="text/css">
        .auto-style2 {
            width: 262px;
        }

        .auto-style3 {
            width: 129px;
        }

        .auto-style4 {
            width: 129px;
            margin-left: 200px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="limiter">
            <div class="container-table100">
                <div class="wrap-table100">

                    <asp:Label ID="Label1" runat="server" Font-Size="XX-Large" Text="Xem mức sử dụng điện / nước"></asp:Label>
                    <table style="width: 100%;">
                        <tr>
                            <td class="auto-style3">
                                <asp:Label ID="Label2" runat="server" Text="Year"></asp:Label>
                                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="getYear" DataTextField="yearOfSemester" DataValueField="yearOfSemester" Height="42px" Width="78px"></asp:DropDownList>
                                <asp:SqlDataSource ID="getYear" runat="server" ConnectionString="Data Source=.;Initial Catalog=PRO_PRN292;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT DISTINCT [yearOfSemester] FROM [History] WHERE ([studentID] = @studentID)">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="studentID" SessionField="studentID" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style4">
                                <asp:Label ID="Label3" runat="server" Text="Term"></asp:Label>
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="semester" DataValueField="semester" Height="19px" Width="99px">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PRO_PRN292ConnectionString %>" SelectCommand="SELECT DISTINCT [semester] FROM [History]"></asp:SqlDataSource>
                            </td>
                            <td class="auto-style2">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style3">
                                <asp:Button ID="btnSearch" runat="server" Height="40px" OnClick="btnSearch_Click" Text="Search" Width="208px" />
                            </td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                    </table>
                    <asp:GridView CssClass="table" ID="GridView1" runat="server" AutoGenerateColumns="False" EnableModelValidation="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="domName" HeaderText="Dom">
                                <HeaderStyle CssClass="cell" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Width="120px" />
                                <ItemStyle CssClass="cell" HorizontalAlign="Justify" VerticalAlign="Middle" Width="120px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="roomName" HeaderText="Room">
                                <HeaderStyle CssClass="cell" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Width="120px" />
                                <ItemStyle CssClass="cell" HorizontalAlign="Justify" VerticalAlign="Middle" Width="120px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="studentID" HeaderText="Student ID">
                                <HeaderStyle CssClass="cell" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Width="120px" />
                                <ItemStyle CssClass="cell" HorizontalAlign="Center" VerticalAlign="Middle" Width="120px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="dateCreated" HeaderText="Date Created">
                                <HeaderStyle CssClass="cell" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Width="120px" />
                                <ItemStyle CssClass="cell" HorizontalAlign="Center" VerticalAlign="Middle" Width="120px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Details" HeaderText="Details">
                                <HeaderStyle CssClass="cell" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Width="120px" />
                                <ItemStyle CssClass="cell" HorizontalAlign="Center" VerticalAlign="Middle" Width="120px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Pending" HeaderText="Pending">
                                <HeaderStyle CssClass="cell" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Width="120px" />
                                <ItemStyle CssClass="cell" HorizontalAlign="Center" VerticalAlign="Middle" Width="120px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="totalBill" HeaderText="Total Bill">
                                <HeaderStyle CssClass="cell" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Width="120px" />
                                <ItemStyle CssClass="cell" HorizontalAlign="Center" VerticalAlign="Middle" Width="120px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="paidBill" HeaderText="Paid Bill">
                                <HeaderStyle CssClass="cell" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Width="120px" />
                                <ItemStyle CssClass="cell" HorizontalAlign="Center" VerticalAlign="Middle" Width="120px" />
                            </asp:BoundField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div align="center">No records found.</div>
                        </EmptyDataTemplate>
                        <HeaderStyle CssClass="row header" ForeColor="White" />
                    <RowStyle CssClass="row" />
                    </asp:GridView>
                </div>
            </div>
        </div>
        <!--===============================================================================================-->
        <script src="../Styles/table/../Styles/table/vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="../Styles/table/../Styles/table/vendor/bootstrap/js/popper.js"></script>
        <script src="../Styles/table/../Styles/table/vendor/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="../Styles/table/../Styles/table/vendor/select2/select2.min.js"></script>
        <!--===============================================================================================-->
        <script src="js/main.js"></script>
    </form>
</body>
</html>
