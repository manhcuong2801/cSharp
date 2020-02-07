<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentHome.aspx.cs" Inherits="Project.student.StudentHome" %>

<!DOCTYPE html>
<link href="../Styles/homeCSS/homeCSS.css" rel="stylesheet" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student HomePage</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <header class="header">
                <a href="StudentHome.aspx">StudentHome.aspx</a>
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
                        <div class="title">Student Board</div>
                        <div class="lefttable">
                            <div>Actions</div>
                            <hr>
                            <ul><a href="http://localhost:58848/student/ResidentHistory.aspx">Resident History</a></ul>
                            <ul><a href="http://localhost:58848/student/Booking.aspx">Book a bed</a></ul>
                            <ul><a href="http://localhost:58848/student/Usage.aspx">View Monthly Electricity/ Water Usage</a></ul>
                            <ul><a href="http://localhost:58848/student/Cost.aspx">Cost</a></ul>
                            <ul><a href="http://localhost:58848/student/Request.aspx">Request</a></ul>
                            <ul><a href="http://localhost:58848/student/Overview.aspx">Bed Usage Overview</a></ul>
                        </div>

                    </div>
                </div>
                <!--right-->
                <aside class="sidebar">
                    <div class="righttable">
                        <div>User Information</div>
                        <hr>
                        <ul>
                            <asp:Label CssClass="label" ID="Label1" runat="server" Text="Label"></asp:Label>
                            
                        </ul>
                      
                    </div>
                </aside>
            </div>

            <!--footer-->
            <footer class="footer">
                <hr>
            </footer>
        </div>
    </form>
</body>
</html>
