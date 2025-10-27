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
  <title>Tour Tây Sơn – Đất Võ Anh Hùng | QuyNhonTour</title>
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


  <!-- MAIN -->
  <main class="poster">
    <section class="hero">
      <!-- hình nền chính (thay bằng ảnh của bạn nếu muốn) -->
      <div class="hero-inner">
        <div class="polaroids">
          <div class="polaroid" style="--r:-8deg">
            <img src="images/tayson.jpg" alt="pic1">
          </div>
          <div class="polaroid" style="--r:6deg">
            <img src="images/tayson2.jpg" alt="pic2">
          </div>
          <div class="polaroid" style="--r:-2deg">
            <img src="images/tayson3.jpg" alt="pic3">
          </div>
        </div>

        <h1 class="title"><span>QUY NHON</span><small>🌿 TAY SON TOUR – LAND OF MARTIAL ARTS 2 DAYS 1 NIGHT 🌿</small></h1>

        <div class="tour-description">
            <p>
            A journey to the historical land, where the heroic imprint of the <b>Tay Son</b> movement and the wild natural beauty of Binh Dinh are preserved.
            </p>
        </div>
      </div>
    </section>

        <h2 class="itinerary-title">Itinerary</h2>
    <section class="itinerary">
      <div class="card">
        <h3>DAY 1</h3>
        <p><strong>  QUY NHON – TAY SON – DAP DANG PHU PHONG</strong><br>- Pick up guests at Quy Nhon center, depart for Tay Son.
<br>- Visit the Heaven and Earth Altar Area – where King Nguyen Nhac once set up an altar to worship heaven, a sacred space in the middle of the mountains and forests.
<br>- Visit Quang Trung Museum – learn about the history of the Tay Son movement, admire the ancient well and the ancient tamarind tree.
<br>- Watch the Tay Son drum performance and Binh Dinh traditional martial arts.
<br>- Have dinner at a local restaurant with specialties of the martial arts land.
<br>- Visit Phu Phong Dam – an irrigation project combined with beautiful landscape, an ideal place to watch the sunset.
<br>- Attend a BBQ party, cultural exchange.
<br>- Stay overnight at a homestay or resort near Ham Ho or Phu Phong.
  </p>
      </div>

      <div class="card">
        <h3>DAY 2</h3>
        <p><strong>  TAY SON - THIEN HUNG PAGODA – QUY NHON</strong>
<br>- Wake up early, have a light breakfast.
<br>- Visit Thien Hung Pagoda – a famous sacred pagoda, where Buddha relics are kept and has unique architecture.
<br>- Lunch at Quy Nhon specialty restaurant.
<br>- Free shopping for Binh Dinh specialties.
<br>- Return guests to the center – end of the exciting journey.
  </p>
      </div>

    </section>

    <h2>Tour Highlights</h2>
        <div class="tour-highlights">
            <img src="images/highlightstayson1.jpg" alt="Highlight 1">
            <img src="images/highlightstayson2.jpg" alt="Highlight 2">
            <img src="images/highlightstayson3.jpg" alt="Highlight 3">
            <img src="images/highlightstayson4.jpg" alt="Highlight 4">
            <img src="images/highlightstayson5.jpg" alt="Highlight 5">
            <img src="images/highlightstayson6.jpg" alt="Highlight 6">
            <img src="images/highlightstayson7.jpg" alt="Highlight 7">
            <img src="images/highlightstayson8.jpg" alt="Highlight 8">
            <img src="images/highlightstayson9.jpg" alt="Highlight 9">
            <img src="images/highlightstayson10.jpg" alt="Highlight 10">
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
    <b>Click <strong>“Book Tour Now”</strong> Tay Son - Binh Dinh 2N1D Tour is a journey back to the source, where you not only explore the wild nature but also feel the heroic spirit of the nation through each historical vestige.! 🌊✨</b>
  </p>
  
    <div class="price-box">
    <div class="price-item adult">
      <h4>👨‍👩‍👧 Adult Price</h4>
      <p><strong>950.000 VNĐ / person</strong></p>
    </div>
    <div class="price-item child">
      <h4>🧒 Child Price</h4>
      <p><strong>750.000 VNĐ / child (free for children under 2 years old)</strong></p>
    </div>
  </div>

  <button class="book-btn">Book Now</button>
</div>



<!-- GOOGLE MAPS SECTION -->
<section class="map-section">
  <h2>📍 Tour Location — Tay Son, Quy Nhơn</h2>
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
    const tayson = { lat: 13.7615, lng: 109.2385 };

    // Tạo bản đồ
    const map = new google.maps.Map(document.getElementById("map"), {
      zoom: 12,
      center: tayson,
    });

    // Thêm ghim (marker)
    new google.maps.Marker({
      position: tayson,
      map: map,
      title: "Tay Son, Quy Nhơn",
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