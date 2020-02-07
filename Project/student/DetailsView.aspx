<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetailsView.aspx.cs" Inherits="Project.student.DetailsView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Details View</title>
    <meta charset="UTF-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="../Styles/table/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../Styles/table/vendor/bootstrap/../Styles/table/css/bootstrap.min.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../Styles/table/fonts/font-awesome-4.7.0/../Styles/table/css/font-awesome.min.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../Styles/table/vendor/animate/animate.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../Styles/table/vendor/select2/select2.min.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../Styles/table/vendor/perfect-scrollbar/perfect-scrollbar.css"/>
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

        <h1>Detail in term&nbsp;at each Dorm</h1>
        
                <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" DataSourceID="DomSource" DataTextField="domName" DataValueField="domID"></asp:DropDownList>
    
                <asp:SqlDataSource ID="DomSource" runat="server" ConnectionString="Data Source=.;Initial Catalog=PRO_PRN292;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Dom]"></asp:SqlDataSource>
    
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" EnableModelValidation="True">
                    <Columns>
                        <asp:BoundField DataField="RoomName" HeaderText="Room Name" SortExpression="RoomName">
                        <HeaderStyle CssClass="cell" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Width="120px" />
                        <ItemStyle CssClass="cell" HorizontalAlign="Justify" VerticalAlign="Middle" Width="120px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TotalBed" HeaderText="Total  Bed" SortExpression="TotalBed">
                        <HeaderStyle CssClass="cell" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Width="120px" />
                        <ItemStyle CssClass="cell" HorizontalAlign="Justify" VerticalAlign="Middle" Width="120px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="UsedBed" HeaderText="Used Bed" SortExpression="UsedBed">
                        <HeaderStyle CssClass="cell" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Width="120px" />
                        <ItemStyle CssClass="cell" HorizontalAlign="Justify" VerticalAlign="Middle" Width="120px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="FreeBed" HeaderText="Free Bed" SortExpression="FreeBed">
                        <HeaderStyle CssClass="cell" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Width="120px" />
                        <ItemStyle CssClass="cell" HorizontalAlign="Justify" VerticalAlign="Middle" Width="120px" />
                        </asp:BoundField>
                        
                        
                    </Columns>
                    <HeaderStyle CssClass="row header" ForeColor="White" />
                    <RowStyle CssClass="row" />
                </asp:GridView>
    
   </div>
		</div>
    
	</div>
    <!--===============================================================================================-->	
	<script src="../Styles/table/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="../Styles/table/vendor/bootstrap/js/popper.js"></script>
	<script src="../Styles/table/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="../Styles/table/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>
    </form>
</body>
</html>
