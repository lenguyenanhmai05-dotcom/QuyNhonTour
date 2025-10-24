<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    // Kiểm tra quyền admin
    String role = (String) session.getAttribute("role");
    if (role == null || !"admin".equalsIgnoreCase(role)) {
        response.sendRedirect("../login.html");
        return;
    }

    String firstName = (String) session.getAttribute("firstName");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - QuyNhonTours</title>
    <link rel="stylesheet" href="../css/dashboard.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #f5f5f5;
            margin: 0;
        }
        header {
            background: #4CAF50;
            color: white;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        header h1 { font-size: 20px; margin: 0; }
        header a {
            color: white;
            text-decoration: none;
            background: #f44336;
            padding: 8px 15px;
            border-radius: 5px;
            font-size: 14px;
        }
        .container {
            padding: 30px;
        }
        .actions {
            margin-top: 20px;
        }
        .actions a {
            display: inline-block;
            margin-right: 15px;
            padding: 10px 20px;
            background: #2196F3;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        .actions a:hover {
            background: #1976D2;
        }
    </style>
</head>
<body>
    <header>
        <h1>Welcome, <%= firstName %> (Admin)</h1>
        <a href="../LogoutServlet">Logout</a>
    </header>

    <div class="container">
        <h2>Admin Dashboard</h2>
        <p>Manage tours and bookings here.</p>

        <div class="actions">
            <a href="tour-list.jsp">View Tours</a>
            <a href="tour-form.jsp">Add New Tour</a>
        </div>
    </div>
</body>
</html>
