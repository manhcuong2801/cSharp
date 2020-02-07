<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Overview.aspx.cs" Inherits="Project.student.Overview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Overview</title>
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
        <h1>Report for Room Usage&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h1>
        
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Details</asp:LinkButton>
        <br />
    
    
        <asp:GridView CssClass="table" ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1"  AllowPaging="True" AllowSorting="True" AutoGenerateColumns="True" >
            
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
