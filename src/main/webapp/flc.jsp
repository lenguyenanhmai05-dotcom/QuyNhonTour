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
  <title>FLC Resort Quy Nhon Gateway 3N2D — QuyNhonTour</title>
  <link rel="stylesheet" href="css/honkho.css">
</head>
<body>
  <!-- HEADER -->
    <header class="header">
      <div class="logo">🌊QuyNhonTour</div>
      <nav class="nav">
          <a href="index.jsp">Home</a>
          <a href="tours.jsp" class="active">Tours</a>
          <a href="aboutus.html">About</a>
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
            <img src="images/flc1.jpg" alt="pic1">
          </div>
          <div class="polaroid" style="--r:6deg">
            <img src="images/flc2.jpg" alt="pic2">
          </div>
          <div class="polaroid" style="--r:-2deg">
            <img src="images/flc3.jpg" alt="pic3">
          </div>
        </div>

        <h1 class="title"><span>QUY NHON</span><small>🏖 FLC RESORT QUY NHON GATEWAY TOUR 3N2D 🏖</small></h1>

        <div class="tour-description">
          <p>
            <i>3 days 2 nights</i> journey at <b>FLC Resort Quy Nhon Gateway</b> – enjoy luxurious space, 
            immerse in nature and explore the most iconic destinations of Quy Nhon coastal city.
          </p>
        </div>
      </div>
    </section>

    <h2 class="itinerary-title">Itinerary</h2>
    <section class="itinerary">
      <div class="card">
        <h3>DAY 1</h3>
        <p><strong>CHECK-IN FLC RESORT – LUXURY RESORT</strong><br>
          - Pick up guests at the airport or Quy Nhon center.<br>
          - Check-in luxury room or villa, relax and enjoy resort facilities.<br>
          - Afternoon: Visit Love Bridge, Sea Square, or Golf Course.<br>
          - Evening: Dine at the restaurant, enjoy high-class cuisine.
        </p>
      </div>

      <div class="card">
        <h3>DAY 2</h3>
        <p><strong>FLC ZOO SAFARI PARK – SEA GATE TOURIST AREA</strong><br>
          - Visit FLC Zoo Safari Park, see rare animals like giraffes, white tigers, zebras.<br>
          - Explore Cua Bien Tourist Area, try zipline, kayaking, mountain climbing.<br>
          - Swim and relax in wild natural scenery.<br>
          - Return to FLC for rest and evening activities.
        </p>
      </div>

      <div class="card">
        <h3>DAY 3</h3>
        <p><strong>RELAX – RETURN GUESTS</strong><br>
          - Sunrise, buffet breakfast, relax at the spa or pool.<br>
          - Check out and return to the airport or city center – end of the trip.
        </p>
      </div>
    </section>

    <h2>Tour Highlights</h2>
    <div class="tour-highlights">
      <img src="images/highlightsflc1.jpg" alt="Highlight 1">
      <img src="images/highlightsflc2.jpg" alt="Highlight 2">
      <img src="images/highlightsflc3.jpg" alt="Highlight 3">
      <img src="images/highlightsflc4.jpg" alt="Highlight 4">
      <img src="images/highlightsflc5.jpg" alt="Highlight 5">
      <img src="images/highlightsflc6.jpg" alt="Highlight 6">
      <img src="images/highlightsflc7.jpg" alt="Highlight 7">
      <img src="images/highlightsflc8.jpg" alt="Highlight 8">
      <img src="images/highlightsflc9.jpg" alt="Highlight 9">
      <img src="images/highlightsflc10.jpg" alt="Highlight 10">
    </div>

    <section class="terms-section">
      <h2>Terms and Services</h2>
      <div class="terms-container">
        <div class="terms-box included">
          <h3>✅ Included Services</h3>
          <ul>
            <li>Two-way transportation</li>
            <li>Entrance tickets to all attractions</li>
            <li>3 buffet breakfasts, 2 main meals</li>
            <li>Resort amenities & infinity pool access</li>
            <li>Professional tour guide</li>
            <li>Travel insurance</li>
          </ul>
        </div>

        <div class="terms-box excluded">
          <h3>❌ Excluded Services</h3>
          <ul>
            <li>Personal expenses (souvenirs, drinks, etc.)</li>
            <li>VAT 10% (if invoice required)</li>
          </ul>
        </div>

        <div class="terms-box notes">
          <h3>⚠️ Notes</h3>
          <ul>
            <li>The itinerary may change depending on weather or conditions.</li>
            <li>Please book at least 1 day in advance.</li>
            <li>Inform us in advance of allergies or dietary requests.</li>
          </ul>
        </div>
      </div>
    </section>

    <div class="booking-section">
      <p>
        <b>Click <strong>“Book Now”</strong> to reserve the FLC Resort Quy Nhon Gateway 3N2D Tour — 
        the perfect combination of relaxation and exploration, where you can enjoy luxury and capture stunning moments by the sea and sky of Bình Định! 🌊✨</b>
      </p>
         <div class="price-box">
    <div class="price-item adult">
      <h4>👨‍👩‍👧 Adult Price</h4>
      <p><strong>5.000.000 VNĐ / person</strong></p>
    </div>
    <div class="price-item child">
      <h4>🧒 Child Price</h4>
      <p><strong>4.300.000 VNĐ / child (free for children under 2 years old)</strong></p>
    </div>
  </div>

  <button class="book-btn">Book Now</button>
</div>



<!-- GOOGLE MAPS SECTION -->
<section class="map-section">
  <h2>📍 Tour Location — FLC, Quy Nhơn</h2>
  <div id="map"></div>
</section>

<style>
  .map-section {
    margin: 60px auto;
    text-align: center;
  }
  #map {
    width: 90%;
    height: 450px;
    border-radius: 12px;
    margin: 0 auto;
    box-shadow: 0 4px 10px rgba(0,0,0,0.2);
  }
</style>

<script>
  function initMap() {
    const flc = { lat: 13.7615, lng: 109.2385 };

    // Tạo bản đồ
    const map = new google.maps.Map(document.getElementById("map"), {
      zoom: 12,
      center: flc,
    });

    // Thêm ghim (marker)
    new google.maps.Marker({
      position: flc,
      map: map,
      title: "FLC, Quy Nhơn",
    });
  }
</script>

<!-- 🧭 Gọi Google Maps JavaScript API -->
<script async defer
  src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBbhZOTVNIVpefOMiP5aPqN18S5EmzhGAo&callback=initMap">
</script>

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
