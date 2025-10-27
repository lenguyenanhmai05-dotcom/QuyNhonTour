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
  <title>Ky Co - Eo Gio Tour | QuyNhonTour</title>
  <link rel="stylesheet" href="css/honkho.css">
  <link href="https://fonts.googleapis.com/css2?family=Merriweather:wght@300;700&family=Montserrat:wght@400;600&display=swap" rel="stylesheet">
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
      <!-- hình nền chính (thay bằng ảnh của bạn nếu muốn) -->
      <div class="hero-inner">
        <div class="polaroids">
          <div class="polaroid" style="--r:-8deg">
            <img src="images/kyco-eogio4.jpg" alt="pic1">
          </div>
          <div class="polaroid" style="--r:6deg">
            <img src="images/kyco-eogio5.jpg" alt="pic2">
          </div>
          <div class="polaroid" style="--r:-2deg">
            <img src="images/kyco-eogio6.jpg" alt="pic3">
          </div>
        </div>

        <h1 class="title"><span>QUY NHON</span><small>KY CO — EO GIO</small></h1>

        <div class="tour-description">
            <p>
            If you are looking for a relaxing trip while exploring the wild beauty of the Central region, <b>the Ky Co - Eo Gio 2 days 1 night tour</b> is the ideal choice! The journey takes you to Ky Co - the Maldives paradise of Vietnam with emerald green water, fine white sand and brilliant coral reefs. Next is Eo Gio - the most beautiful place to watch the sunset in Quy Nhon, with winding cliffs embracing the vast ocean.
            </p>
        </div>
      </div>
    </section>

        <h2 class="itinerary-title">Itinerary</h2>
    <section class="itinerary">
      <div class="card">
        <h3>DAY 1</h3>
        <p><strong>  QUY NHON –KY CO – CAMPING BY THE SEA</strong><br>- Pick up guests at Quy Nhon center, move to the canoe pier.
<br>- High-speed canoe takes you to Ky Co island, swim, snorkel to see coral, check-in the legendary wooden bridge.
<br>- Enjoy fresh seafood at a restaurant by the sea.
<br>- Afternoon: Free time to relax and have fun on the beach.
<br>- Evening: Seafood BBQ party, campfire, socialize and watch the stars.
<br>- Stay overnight in a tent in the middle of wild nature.
  </p>
      </div>

      <div class="card">
        <h3>DAY 2</h3>
        <p><strong>  KY CO – EO GIO – QUY NHON</strong><br>- Wake up early to catch the sunrise, have a light breakfast.
<br>- Move to Eo Gio – where there is a picturesque coastal walking path.
<br>- Visit Ngoc Hoa Pagoda, admire the tallest pair of Guanyin Buddha statues in Vietnam.
<br>- Have lunch at a local restaurant.
<br>- Drop guests back to Quy Nhon – end of the emotional journey.   
  </p>
      </div>

    </section>

    <h2>Tour Highlights</h2>
        <div class="tour-highlights">
            <img src="images/highlightskyco-eogio1.jpg" alt="Highlight 1">
            <img src="images/highlightskyco-eogio2.jpg" alt="Highlight 2">
            <img src="images/highlightskyco-eogio3.jpg" alt="Highlight 3">
            <img src="images/highlightskyco-eogio4.jpg" alt="Highlight 4">
            <img src="images/highlightskyco-eogio5.jpg" alt="Highlight 5">
            <img src="images/highlightskyco-eogio6.jpg" alt="Highlight 6">
            <img src="images/highlightskyco-eogio7.jpg" alt="Highlight 7">
            <img src="images/highlightskyco-eogio8.jpg" alt="Highlight 8">
            <img src="images/highlightskyco-eogio9.jpg" alt="Highlight 9">
            <img src="images/highlightskyco-eogio10.jpg" alt="Highlight 10">
        </div>

        <section class="terms-section">
  <h2>Terms and services</h2>
  <div class="terms-container">
    <div class="terms-box included">
      <h3>✅ Included Services</h3>
      <ul>
        <li>Two-way transportation</li>
        <li>Entrance tickets to all attractions</li>
        <li>Lunch with local seafood menu</li>
        <li>Bottled water (2 bottles/person)</li>
        <li>Professional and friendly tour guide</li>
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
        <li>The itinerary may change depending on weather or actual conditions.</li>
        <li>Please book at least 1 day in advance.</li>
        <li>Guests with dietary restrictions or allergies should inform in advance.</li>
      </ul>
    </div>
  </div>
</section>

        <div class="booking-section">
  <p>
    <b>Click <strong>“Book Tour Now”</strong> to experience the magnificent beauty of Quy Nhon’s sea — 
    where adventure meets tranquility at Ky Co and Eo Gio! 🌊✨</b>
  </p>

  <div class="price-box">
    <div class="price-item adult">
      <h4>👨‍👩‍👧 Adult Price</h4>
      <p><strong>1.380.000 VNĐ / person</strong></p>
    </div>
    <div class="price-item child">
      <h4>🧒 Child Price</h4>
      <p><strong>880.000 VNĐ / child (free for children under 2 years old)</strong></p>
    </div>
  </div>

  <button class="book-btn">Book Now</button>
</div>



<!-- GOOGLE MAPS SECTION -->
<section class="map-section">
  <h2>📍 Tour Location — Ky Co & Eo Gio, Quy Nhơn</h2>
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
    // 🗺️ Vị trí Ky Co - Eo Gio (gần Quy Nhơn)
    const kyCoEoGio = { lat: 13.7615, lng: 109.2385 };

    // Tạo bản đồ
    const map = new google.maps.Map(document.getElementById("map"), {
      zoom: 12,
      center: kyCoEoGio,
    });

    // Thêm ghim (marker)
    new google.maps.Marker({
      position: kyCoEoGio,
      map: map,
      title: "Ky Co - Eo Gio, Quy Nhơn",
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
