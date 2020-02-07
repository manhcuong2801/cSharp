<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="Project.student.Booking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Booking</title>
	<meta charset="UTF-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="../Styles/request/css/Style.css" rel="stylesheet" />
<!--===============================================================================================-->
	<link rel="icon" type="image/png" href="../Styles/request/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../Styles/request/vendor/bootstrap/css/bootstrap.min.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../Styles/request/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../Styles/request/vendor/animate/animate.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../Styles/request/vendor/css-hamburgers/hamburgers.min.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../Styles/request/vendor/select2/select2.min.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../Styles/request/css/util.css"/>
	<link rel="stylesheet" type="text/css" href="../Styles/request/css/main.css"/>
    <link href="../Styles/upload/css/notification.css" rel="stylesheet" />
<!--===============================================================================================-->
</head>
<body>
    <div class="bg-contact3" style="background-image: url('../Styles/request/images/fpt10.jpg');">
		<div class="container-contact3">
			<div class="wrap-contact3">
				<form id="form1" runat="server">
				    Price:
				    <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true"> </asp:DropDownList>
					<br />
					<br />
                    Dom:&nbsp;
					<asp:DropDownList ID="DropDownList2" runat="server" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="true"> </asp:DropDownList>
                   
				    <br />
                   
				    <br />
                    Floor :
					<asp:DropDownList ID="DropDownList3" runat="server" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" AutoPostBack="true" style="height: 22px; width: 35px">
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                        <asp:ListItem Value="5">5</asp:ListItem>
                    </asp:DropDownList>
                   
				    <br />
                    <br />
                    Room:
					<asp:DropDownList ID="DropDownList4" runat="server" OnSelectedIndexChanged="DropDownList4_SelectedIndexChanged" AutoPostBack="true">
                    </asp:DropDownList>
                   
				    <br />
                   
				    <br />
                    Bed&nbsp;&nbsp; :
                    <asp:DropDownList ID="DropDownList5" runat="server" OnSelectedIndexChanged="DropDownList5_SelectedIndexChanged">
                    </asp:DropDownList>
                   
				    <br />
                    <br />
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Book" Height="27px" Width="93px" />
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Balance not enough" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                   
				    <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="Book Successfully" OnServerValidate="CustomValidator2_ServerValidate"></asp:CustomValidator>
                   
				</form>
			</div>
		</div>
	</div>


	<div id="dropDownSelect1"></div>

<!--===============================================================================================-->
	<script src="../Styles/request/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="../Styles/request//bootstrap/js/popper.js"></script>
	<script src="../Styles/request/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="../Styles/request/vendor/select2/select2.min.js"></script>
	<script>
		$(".selection-2").select2({
			minimumResultsForSearch: 20,
			dropdownParent: $('#dropDownSelect1')
		});
	</script>
<!--===============================================================================================-->
	<script src="../Styles/request/js/main.js"></script>

	<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-23581568-13');
</script>
</body>
</html>
