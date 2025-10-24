<%@ page import="java.util.List" %>
<%@ page import="com.quynhontours.dao.TourDAO" %>
<%@ page import="com.quynhontours.model.Tour" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // Giả sử email đăng nhập được lưu trong session
    String userEmail = (String) session.getAttribute("userEmail");

    TourDAO dao = new TourDAO();
    List<Tour> tours = dao.getAllTours();
%>

<!doctype html>
<html lang="vi">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>QuyNhonTour - Available Tours</title>
  <link href="https://fonts.googleapis.com/css2?family=Merriweather:wght@300;700&family=Montserrat:wght@400;600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="css/tour.css">
</head>

<body>

  <!-- Header -->
  <header>
    <a href="index.jsp" class="logo">🌊QuyNhonTour</a>
    <nav>
      <a href="index.jsp">Home</a>
      <a href="tour.jsp">Tours</a>
      <a href="aboutus.html">About</a>
    </nav>
    <div class="user-section">
      <% if (userEmail != null) { %>
        <span class="user-email"><%= userEmail %></span>
        <a href="logout.jsp">(Logout)</a>
      <% } else { %>
        <a href="login.jsp">Login</a> |
        <a href="register.jsp">Sign up</a>
      <% } %>
    </div>
  </header>

  <!-- Hero Section -->
  <main>
    <section class="hero">
      <h1>Explore & Book Your Next Adventure</h1>
      <p class="subtitle">Browse curated tours with stunning views, local guides, and flexible dates.</p>

      <p class="desc">
        <b>Quy Nhon</b> is an ideal destination with blue seas, white sands, and delicious local cuisine.
        Quy Nhon tours offer diverse experiences such as visiting <b>Ky Co – Eo Gio</b>, exploring
        <b>Hon Kho Island</b>, checking in at <b>Ghenh Rang – Tien Sa</b>, or enjoying fresh seafood in
        <b>Nhon Hai fishing village</b>. Each journey lets you fully experience the peaceful beauty and
        warm hospitality of this coastal land.
      </p>

      <div class="search-bar">
        <input type="text" placeholder="🔍 Search tours, places, themes..." />
        <button class="date-btn">📅 Dates</button>
        <button class="tag">Family</button>
        <button class="tag">Nature</button>
        <button class="tag">Popular</button>
      </div>
    </section>

    <!-- Dynamic Tours Section -->
    <section class="tours">
      <h2>Available Tours</h2>
      <div class="tour-container">
         <%
            if (tours != null && !tours.isEmpty()) {
                int index = 1;
                for (Tour t : tours) {
        %>
          <div class="tour-card">
            <img src="images/tour<%= index %>.jpg" alt="<%= t.getName() %>">
            <h3><%= t.getName() %></h3>
            <p class="tour-desc"><%= t.getDescription() %></p>
            <p><b>📍 Location:</b> <%= t.getLocation() %></p>
            <p><b>💰 Price:</b> <%= String.format("%,.0f VNĐ", t.getPrice()) %></p>
            <p><b>📅 From:</b> <%= t.getStartDate() %> → <%= t.getEndDate() %></p>
            <div class="tour-btns">
              <%
                switch (index) {
                    case 1: out.print("<a href='kyco-eogio.jsp' class=\"btn details\">Details</a>"); break;
                    case 2: out.print("<a href='honkho.jsp' class=\"btn details\">Details</a>"); break;
                    case 3: out.print("<a href='culaoxanh.jsp' class=\"btn details\">Details</a>"); break;
                    case 4: out.print("<a href='tayson.jsp' class=\"btn details\">Details</a>"); break;
                    case 5: out.print("<a href='thapdoi.jsp' class=\"btn details\">Details</a>"); break;
                    case 6: out.print("<a href='eogio.jsp' class=\"btn details\">Details</a>"); break;
                    case 7: out.print("<a href='ghenhrangtiensa.jsp' class=\"btn details\">Details</a>"); break;
                    case 8: out.print("<a href='honseo.jsp' class=\"btn details\">Details</a>"); break;
                    case 9: out.print("<a href='trungluong.jsp' class=\"btn details\">Details</a>"); break;
                    case 10: out.print("<a href='flc.jsp' class=\"btn details\">Details</a>"); break;
                    default: out.print("<a href='#' class=\"btn details\">Details</a>");
                }
              %>
              <button class="btn book">Add to Card</button>
            </div>
          </div>
        <%
              index++;
              }
          } else {
        %>
          <p class="no-tour">No tours available at the moment.</p>
        <%
          }
        %>
      </div>
    </section>
  </main>

  <!-- Footer -->
  <footer class="qnt-footer">
    <div class="footer-inner">
      <div class="brand">
        <span class="brand-name">QuyNhonTour</span>
        <small class="copyright">©2025 QuyNhonTour. All rights reserved.</small>
      </div>
      <nav class="footer-links">
        <a href="#">Terms</a>
        <a href="#">Privacy</a>
        <a href="#">Support</a>
      </nav>
    </div>
  </footer>
</body>
</html>
