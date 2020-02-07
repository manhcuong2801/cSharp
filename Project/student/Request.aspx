<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Request.aspx.cs" Inherits="Project.student.Request" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Request</title>
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
					<span class="contact3-form-title">
						Create new request
					</span>
                    <div>
                        <asp:DropDownList ID="RequestType" runat="server" DataSourceID="SqlDataSource1" DataTextField="typeName" DataValueField="typeID"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RequestType_Connection %>" SelectCommand="SELECT * FROM [RequestType]"></asp:SqlDataSource>
                    </div>


					<div class="wrap-input3 validate-input" data-validate="Name is required">
                        <asp:TextBox CssClass="input3" ID="tbTittle" runat="server" placeholder="Tittle"></asp:TextBox>
						<span class="focus-input3"></span>
					</div>
					<div class="wrap-input3 validate-input" data-validate = "Message is required">
						<asp:TextBox CssClass="input3" ID="tbContent" runat="server" placeholder="Content"></asp:TextBox>
						<span class="focus-input3"></span>
					</div>
                    <div>
                        <asp:Label ID="lbStatus" runat="server" Text="" CssClass="noti"></asp:Label>  
                    </div>
					<div class="container-contact3-form-btn">
						<button runat="server" id="btnCreate" onserverclick="btnCreate_Click" type="submit" class="contact3-form-btn">
							Create request
						</button>
					</div>
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
