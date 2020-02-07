<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResidentHistory.aspx.cs" Inherits="Project.student.ResidentHistory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Resident History</title>
    <meta charset="UTF-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="../Styles/table/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../Styles/table/../Styles/table/../Styles/table/vendor/bootstrap/../Styles/table/css/bootstrap.min.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../Styles/table/fonts/font-awesome-4.7.0/../Styles/table/css/font-awesome.min.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../Styles/table/../Styles/table/../Styles/table/vendor/animate/animate.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../Styles/table/../Styles/table/../Styles/table/vendor/select2/select2.min.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../Styles/table/../Styles/table/../Styles/table/vendor/perfect-scrollbar/perfect-scrollbar.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../Styles/table/css/util.css"/>
	<link rel="stylesheet" type="text/css" href="../Styles/table/css/main.css"/>
<!--===============================================================================================-->
</head>
<body>
    
    <form id="form1" runat="server">
    <div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
                <asp:GridView CssClass="table" ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="Resident_History" EnableModelValidation="True">
                    <Columns>
                        <asp:BoundField DataField="studentID" HeaderText="StudentID" SortExpression="studentID">
                        <HeaderStyle CssClass="cell" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Width="120px" />
                        <ItemStyle CssClass="cell" HorizontalAlign="Justify" VerticalAlign="Middle" Width="120px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="bedInfo" HeaderText="Bed Information" SortExpression="bedInfo">
                        <HeaderStyle CssClass="cell" HorizontalAlign="Center" VerticalAlign="Middle" Width="200px" />
                        <ItemStyle CssClass="cell" HorizontalAlign="Center" VerticalAlign="Middle" Width="200px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="dateCheckin" HeaderText="Date Checkin" SortExpression="dateCheckin">
                        <HeaderStyle CssClass="cell" />
                        <ItemStyle CssClass="cell" HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="dateCheckout" HeaderText="Date Checkout" SortExpression="dateCheckout">
                        <HeaderStyle CssClass="cell" />
                        <ItemStyle CssClass="cell" HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="bedPrice" HeaderText="Bed Price" SortExpression="bedPrice">
                        <HeaderStyle CssClass="cell" HorizontalAlign="Center" VerticalAlign="Middle" Width="120px" />
                        <ItemStyle CssClass="cell" HorizontalAlign="Center" VerticalAlign="Middle" Width="120px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="semester" HeaderText="Semester" SortExpression="semester">
                        <HeaderStyle CssClass="cell" HorizontalAlign="Center" VerticalAlign="Middle" Width="120px" />
                        <ItemStyle CssClass="cell" HorizontalAlign="Center" VerticalAlign="Middle" Width="120px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="yearOfSemester" HeaderText="Year Of Semester" SortExpression="yearOfSemester">
                        <HeaderStyle CssClass="cell" HorizontalAlign="Center" VerticalAlign="Middle" Width="120px" />
                        <ItemStyle CssClass="cell" HorizontalAlign="Center" VerticalAlign="Middle" Width="120px" />
                        </asp:BoundField>
                    </Columns>
                    <EmptyDataTemplate>
                            <div align="center">No records found.</div>
                        </EmptyDataTemplate>
                    <HeaderStyle CssClass="row header" ForeColor="White" />
                    <RowStyle CssClass="row" />
                </asp:GridView>
					
					<asp:SqlDataSource ID="Resident_History" runat="server" ConnectionString="<%$ ConnectionStrings:ResidentHistory %>" SelectCommand="SELECT [studentID], [bedInfo], [dateCheckin], [dateCheckout], [bedPrice], [semester], [yearOfSemester] FROM [History] WHERE ([studentID] = @studentID)">
                        <SelectParameters>
                            <asp:SessionParameter Name="studentID" SessionField="studentID" Type="String" />
                        </SelectParameters>
                </asp:SqlDataSource>
					
					<%--</div>--%>
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
