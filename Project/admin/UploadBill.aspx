<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UploadBill.aspx.cs" Inherits="Project.admin.UploadBill" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 
    <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
        <meta name="description" content="Colrolib Templates"/>
        <meta name="author" content="Colrolib"/>
        <meta name="keywords" content="Colrolib Templates"/>

        <!-- Title Page-->
        <title>Upload Bill</title>


        <!-- Font special for pages-->
        <link href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet"/>


    
        <!-- Main CSS-->
        <link href="../Styles/upload/css/main.css" rel="stylesheet" type="text/css"/>
        <link href="../Styles/upload/css/notification.css" rel="stylesheet" type="text/css" />
    
</head>
<body>
    <div class="page-wrapper bg-img-1 p-t-165 p-b-100">
            <div class="wrapper wrapper--w680">
                <div class="card card-1">
                    <div class="card-body">
                        <ul class="tab-list">
                            <li class="tab-list__item active">
                                <a class="tab-list__link" href="#tab1" data-toggle="tab">Upload Bill</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tab1">
                                <form runat="server" enctype="multipart/form-data">
                                    <div class="input-group">
                                        <label class="label">Bill excel file to upload:</label>
                                        <asp:FileUpload CssClass="input--style-1" ID="FileUpload1" runat="server" />
                                        <br/>  
                                    </div>
                                    
                                    <asp:Label ID="lbStatus" runat="server" Text="" CssClass="noti"></asp:Label>  
                                    <asp:Button OnClick="Button1_Click"  CssClass="btn-submit" ID="Button1" runat="server" Text="Press to upload" />         
                                   
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</body>
</html>
