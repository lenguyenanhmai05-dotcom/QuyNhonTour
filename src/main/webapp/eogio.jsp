<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%
    // Lấy email user từ session (set khi login thành công)
    String userEmail = (String) session.getAttribute("userEmail");
%>
<!doctype html>
<html lang="vi">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>Eo Gio - Tinh Xa Ngoc Hoa - Green Path Tour | QuyNhonTour</title>
  <link rel="stylesheet" href="css/honkho.css">
</head>
<body>
  <!-- HEADER -->
    <header class="header">
      <div class="logo">🌊QuyNhonTour</div>
      <nav class="nav">
          <a href="index.jsp">Home</a>
          <a href="tours.jsp" class="active">Tours</a>
          <a href="about.jsp">About</a>
          <% if (userEmail != null) { %>
              <span class="gmail">📧 <%= userEmail %></span>
          <% } else { %>
              <a href="login.jsp">Login</a>
              <button class="signin-btn" onclick="location.href='signup.jsp'">Sign up</button>
          <% } %>
      </nav>
  </header>


  <main class="poster">
    <section class="hero">
      <div class="hero-inner">
        <div class="polaroids">
          <div class="polaroid" style="--r:-8deg">
            <img src="images/eogio.jpg" alt="Eo Gio">
          </div>
          <div class="polaroid" style="--r:6deg">
            <img src="images/eogio1.jpg" alt="Eo Gio 1">
          </div>
          <div class="polaroid" style="--r:-2deg">
            <img src="images/eogio2.jpg" alt="Eo Gio 2">
          </div>
        </div>

        <h1 class="title"><span>QUY NHON</span><small>🏝 EO GIO – TINH XA NGOC HOA – GREEN PATH TOUR 🏝</small></h1>

        <div class="tour-description">
          <p>
            If you are looking for a trip to “escape” the hustle and bustle of life, 
            <b>Eo Gio</b> – one of Quy Nhon's most iconic coastal spots – is a must-visit.
            With rugged cliffs, crystal clear waters, and breathtaking views, it’s the perfect place 
            to relax and connect with nature.
          </p>
        </div>
      </div>
    </section>

    <h2 class="itinerary-title">Itinerary</h2>
    <section class="itinerary">
      <div class="card">
        <h3>1 DAY</h3>
        <p><strong>EO GIO – TINH XA NGOC HOA – GREEN PATH TOUR</strong><br>
        - Depart from Quy Nhon, enjoy breakfast (local dishes like <i>bánh hỏi</i> or fish noodles).<br>
        - Travel to Eo Gio by car or motorbike.<br>
        - Explore Eo Gio: walk along the coastal path, take scenic photos.<br>
        - Visit Ngoc Hoa Monastery – home to the tallest twin Buddha statues in Vietnam.<br>
        - Lunch at a local seafood restaurant.<br>
        - Optional trip to Ky Co beach (canoe transfer).<br>
        - Try snorkeling or paddleboarding (weather permitting).<br>
        - Visit Nhơn Lý fishing village, learn about local life and buy specialties.<br>
        - Return to Quy Nhon – end of tour.
        </p>
      </div>
    </section>

    <h2>Tour Highlights</h2>
    <div class="tour-highlights">
      <img src="images/highlight1.jpg" alt="Highlight 1">
      <img src="images/highlightseogio1.jpg" alt="Highlight 2">
      <img src="images/highlightseogio2.jpg" alt="Highlight 3">
      <img src="images/highlight4.jpg" alt="Highlight 4">
      <img src="images/highlightseogio3.jpg" alt="Highlight 5">
      <img src="images/highlightseogio4.jpg" alt="Highlight 6">
      <img src="images/highlightseogio5.jpg" alt="Highlight 7">
      <img src="images/highlightseogio6.jpg" alt="Highlight 8">
      <img src="images/highlightseogio7.jpg" alt="Highlight 9">
      <img src="images/highlight5.jpg" alt="Highlight 10">
    </div>

    <section class="terms-section">
      <h2>Terms and Services</h2>
      <div class="terms-container">
        <div class="terms-box included">
          <h3>✅ Included Services</h3>
          <ul>
            <li>Two-way transportation</li>
            <li>Entrance tickets to all attractions</li>
            <li>Lunch with local seafood</li>
            <li>Bottled water (2 bottles/person)</li>
            <li>Professional tour guide</li>
            <li>Travel insurance</li>
          </ul>
        </div>

        <div class="terms-box excluded">
          <h3>❌ Excluded Services</h3>
          <ul>
            <li>Personal expenses (snacks, souvenirs, etc.)</li>
            <li>Extra drinks (beer, coffee, soft drinks, etc.)</li>
            <li>VAT 10% (if invoice required)</li>
          </ul>
        </div>

        <div class="terms-box notes">
          <h3>⚠️ Notes</h3>
          <ul>
            <li>Itinerary may change due to weather or actual conditions.</li>
            <li>Please book at least 1 day in advance.</li>
            <li>Inform dietary restrictions or allergies beforehand.</li>
          </ul>
        </div>
      </div>
    </section>

    <div class="booking-section">
      <p>
        <b>Click <strong>“Book Tour Now”</strong> to experience the beauty of Quy Nhon’s coast — 
        where adventure meets tranquility at Eo Gio! 🌊✨</b>
      </p>
      <h3>770.000 VND/person</h3>
      <button class="book-btn">Book Now</button>
    </div>

    <!-- FOOTER -->
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
  </main>
</body>
</html>
