<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Project.admin.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin HomePage</title>
    <link href="../Styles/homeCSS/homeCSS.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <header class="header">
                <a href="http://localhost:58848/admin/Home.aspx">Admin Home</a>
                <h1>FPT On Campus Dormitory</h1>
                </>
                <p>Welcome to website</p>
            </header>
            <nav class="menu">
                <a href="" class="" runat="server" onserverclick="logout_Click">Logout</a>
            </nav>

            <!--content-->
            <div class="content">
                <!--left--->
                <div class="main">
                    <div class="entry">
                        <div class="title">Admin Board</div>
                        <div class="lefttable">
                            <div>Actions</div>
                            <hr>
                            <ul><a href="http://localhost:58848/admin/UploadBill.aspx">Upload Bill</a></ul>
                            
                        </div>

                    </div>
                </div>
                <!--right-->
            <%--    <aside class="sidebar">
                    <div class="righttable">
                        <div>User Information</div>
                        <hr>
                        <ul>
                            <asp:Label CssClass="label" ID="Label1" runat="server" Text="Hello admin"></asp:Label>
                            
                        </ul>
                      
                    </div>
                </aside>--%>
            </div>

            <!--footer-->
            <footer class="footer">
                <hr>
            </footer>
        </div>
    </form>
</body>
</html>
