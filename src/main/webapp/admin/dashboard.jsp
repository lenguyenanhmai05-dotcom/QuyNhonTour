<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Kiểm tra quyền admin (nếu chưa login -> chuyển về login)
    String role = (String) session.getAttribute("role");
    if (role == null || !"admin".equalsIgnoreCase(role)) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
    String firstName = (String) session.getAttribute("firstName");

    // Safe read helper: lấy attribute và chuyển thành long an toàn
    Object oTour = request.getAttribute("tourCount");
    Object oNews = request.getAttribute("newsCount");
    Object oUser = request.getAttribute("userCount");
    Object oOrder = request.getAttribute("orderCount");

    Object oCompleted = request.getAttribute("completed");
    Object oProcessing = request.getAttribute("processing");
    Object oCanceled = request.getAttribute("canceled");

    java.util.function.Function<Object, Long> toLong = (obj) -> {
        if (obj == null) return 0L;
        if (obj instanceof Number) return ((Number) obj).longValue();
        try {
            return Long.parseLong(obj.toString());
        } catch (Exception ex) {
            return 0L;
        }
    };

    long tourCount = toLong.apply(oTour);
    long newsCount = toLong.apply(oNews);
    long userCount = toLong.apply(oUser);
    long orderCount = toLong.apply(oOrder);

    long completed = toLong.apply(oCompleted);
    long processing = toLong.apply(oProcessing);
    long canceled = toLong.apply(oCanceled);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - QuyNhonTours</title>

    <!-- Fonts / Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" integrity="sha512-..." crossorigin="anonymous" referrerpolicy="no-referrer" />

    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <style>
                    /* --- basic styling, kept compact --- */
                    * {
                        box-sizing: border-box;
                    }

                    body {
                        font-family: 'Poppins', sans-serif;
                        background: #f3f4f7;
                        margin: 0;
                    }

                    header {
                        background: linear-gradient(90deg, #3f51b5, #2196f3);
                        color: white;
                        padding: 20px 30px;
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.12);
                    }

                    header h1 {
                        margin: 0;
                        font-size: 20px;
                    }

                    header a {
                        background: #f44336;
                        color: white;
                        padding: 8px 16px;
                        border-radius: 20px;
                        text-decoration: none;
                    }

                    .container {
                        max-width: 1200px;
                        margin: 36px auto;
                        padding: 0 20px;
                    }

                    h2 {
                        text-align: center;
                        color: #333;
                        margin: 0 0 28px;
                        font-weight: 600;
                    }

                    .cards {
                        display: grid;
                        grid-template-columns: repeat(5, 1fr);
                        gap: 20px;
                    }

                    @media (max-width: 1000px) {
                        .cards {
                            grid-template-columns: repeat(3, 1fr);
                        }
                    }

                    @media (max-width: 700px) {
                        .cards {
                            grid-template-columns: repeat(2, 1fr);
                        }
                    }

                    @media (max-width: 480px) {
                        .cards {
                            grid-template-columns: 1fr;
                        }
                    }

                    .card {
                        background: white;
                        padding: 22px;
                        border-radius: 12px;
                        box-shadow: 0 6px 18px rgba(0, 0, 0, 0.06);
                        text-align: center;
                        transition: transform .18s ease, box-shadow .18s ease;
                    }

                    .card:hover {
                        transform: translateY(-6px);
                        box-shadow: 0 14px 30px rgba(0, 0, 0, 0.12);
                    }

                    .card .icon {
                        font-size: 36px;
                        color: #2196f3;
                        margin-bottom: 10px;
                    }

                    .card h3 {
                        margin: 6px 0 8px;
                        color: #333;
                        font-size: 16px;
                    }

                    .card .count {
                        font-size: 28px;
                        font-weight: 700;
                        color: #111;
                    }

                    .chart-box {
                        margin-top: 36px;
                        background: white;
                        padding: 22px;
                        border-radius: 12px;
                        box-shadow: 0 6px 18px rgba(0, 0, 0, 0.06);
                    }

                    .manage-links {
                        margin-top: 28px;
                        text-align: center;
                        display: flex;
                        justify-content: center;
                        flex-wrap: wrap;
                        gap: 20px;
                    }

                    .manage-links a {
                        display: inline-block;
                        background: linear-gradient(135deg, #3b82f6, #2563eb);
                        color: white;
                        text-decoration: none;
                        padding: 14px 26px;
                        border-radius: 12px;
                        font-weight: 600;
                        font-size: 15px;
                        letter-spacing: 0.3px;
                        box-shadow: 0 4px 12px rgba(37, 99, 235, 0.3);
                        transition: all 0.25s ease;
                    }

                    .manage-links a:hover {
                        background: linear-gradient(135deg, #2563eb, #1d4ed8);
                        box-shadow: 0 6px 16px rgba(29, 78, 216, 0.45);
                        transform: translateY(-4px);
                    }

                    .manage-links a:active {
                        transform: translateY(0);
                        box-shadow: 0 3px 8px rgba(29, 78, 216, 0.3);
                    }

                    @media (max-width:600px) {
                        header {
                            padding: 12px;
                        }

                        .container {
                            margin: 16px auto;
                        }
                    }
                </style>
</head>
<body>

<header>
    <h1>Welcome, <%= (firstName != null ? firstName : "Admin") %></h1>
    <a href="<%= request.getContextPath() %>/logout">Logout</a>
</header>

<div class="container">
    <h2>Admin Dashboard</h2>

    <div class="cards">
        <div class="card">
            <div class="icon"><i class="fas fa-map-marked-alt"></i></div>
            <h3>Tours</h3>
            <div class="count"><%= tourCount %></div>
        </div>

        <div class="card">
            <div class="icon"><i class="fas fa-newspaper"></i></div>
            <h3>News</h3>
            <div class="count"><%= newsCount %></div>
        </div>

        <div class="card">
            <div class="icon"><i class="fas fa-users"></i></div>
            <h3>Users</h3>
            <div class="count"><%= userCount %></div>
        </div>

        <div class="card">
            <div class="icon"><i class="fas fa-shopping-cart"></i></div>
            <h3>Orders</h3>
            <div class="count"><%= orderCount %></div>
        </div>

         <!-- ✅ Thêm mới -->
    <div class="card">
        <div class="icon"><i class="fas fa-receipt"></i></div>
        <h3>Bookings</h3>
        <div class="count"><%= request.getAttribute("bookingCount") %></div>
    </div>
    
</div>

    <div class="manage-links">
    <a href="<%= request.getContextPath() %>/admin/tour-list.jsp">Manage Tours</a>
    <a href="<%= request.getContextPath() %>/admin/news">Manage News</a>
    <a href="<%= request.getContextPath() %>/admin/users">Manage Users</a>
    <a href="<%= request.getContextPath() %>/admin/orders-list.jsp">Manage Orders</a>
    <a href="<%= request.getContextPath() %>/admin/admin-booking.jsp">Manage Bookings</a> <!-- ✅ thêm dòng này -->
</div>
<div class="chart-box">
        <h3 style="margin-top:0;">Order Status Overview</h3>
        <canvas id="orderChart" style="max-width:600px;margin:12px auto 0; display:block;"></canvas>
    </div>
</div>

<script>
    // Chart data from server (already safe-long converted in JSP)
    const processing = parseInt("<%= String.valueOf(processing) %>") || 0;
    const completed  = parseInt("<%= String.valueOf(completed) %>")  || 0;
    const canceled   = parseInt("<%= String.valueOf(canceled) %>")   || 0;


    const ctx = document.getElementById('orderChart').getContext('2d');
    const myChart = new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: ['Processing', 'Completed', 'Canceled'],
            datasets: [{
                data: [processing, completed, canceled],
                backgroundColor: ['#ffca28','#66bb6a','#ef5350'],
                borderColor: '#fff',
                borderWidth: 2
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: { position: 'bottom' }
            }
        }
    });
</script>

</body>
</html>
