<%@ page session="true" %>

<header class="navbar">
      <div class="logo">
        <a href="index.jsp">QuyNhonTour</a>
      </div>


    <nav class="nav-links">
        <a href="index.jsp">Home</a>
        <a href="tour.jsp">Tours</a>
        <a href="aboutus.html">About</a>
    </nav>

    <div class="user-section">
        <%
            String firstName = (String) session.getAttribute("firstName");
            String role = (String) session.getAttribute("role");
        %>

        <% if (firstName != null) { %>
            <div class="user-info">
                <img src="https://cdn-icons-png.flaticon.com/512/847/847969.png" class="user-icon" alt="user">
                <span class="username"><%= firstName %></span>
                <% if ("admin".equalsIgnoreCase(role)) { %>
                    <a href="admin/dashboard.jsp" class="admin-link">Dashboard</a>
                <% } %>
                <a href="logout.jsp" class="logout-btn">(Logout)</a>
            </div>
        <% } else { %>
            <a href="login.jsp" class="btn">Login</a>
            <a href="register.jsp" class="btn">Sign Up</a>
        <% } %>
    </div>
</header>