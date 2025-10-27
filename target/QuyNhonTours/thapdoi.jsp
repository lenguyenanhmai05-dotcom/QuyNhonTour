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
  <title>Tour Tháp Đôi – Di sản Chăm Pa | QuyNhonTour</title>
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
            <img src="images/thapdoi1.jpg" alt="pic1">
          </div>
          <div class="polaroid" style="--r:6deg">
            <img src="images/thapdoi2.jpg" alt="pic2">
          </div>
          <div class="polaroid" style="--r:-2deg">
            <img src="images/thapdoi3.jpg" alt="pic3">
          </div>
        </div>

        <h1 class="title"><span>QUY NHON</span><small>🛕 TWIN TOWERS TOUR – CHAM PA HERITAGE IN THE HEART OF QUY NHON 🛕</small></h1>

        <div class="tour-description">
            <p>
            A short but meaningful tour, taking you back to the ancient Cham Pa cultural vestiges in the heart of the coastal city of Quy Nhon.
            </p>
        </div>
      </div>
    </section>

        <h2 class="itinerary-title">Itinerary</h2>
    <section class="itinerary">
      <div class="card">
        <h3>DESTINATION INTRODUCTION</h3>
        <p><strong>  Quy Nhon Twin Towers (also known as Hung Thanh Tower)</strong><br>is one of the unique remaining Cham Pa architectural works in Binh Dinh. With its square architecture and curved roof, Twin Towers has both an ancient and mysterious beauty, an ideal place to learn about Cham culture and preserve artistic photos.
  </p>
      </div>

      <div class="card">
        <h3>📸 TIPS FOR TAKING BEAUTIFUL PHOTOS AT THE TWIN TOWERS</h3>
<br>- Clothing: choose ao dai, boho dress or white clothes to stand out against the ancient red brick background.
<br>- Time: early morning or cool afternoon for soft light and few people.
<br>- Shooting angle: from below to clearly see the curved roof, or from afar to capture both towers.
  </p>
      </div>

      <div class="card">
        <h3>1 DAY</h3>
        <p><strong>  ⏰ Time: Morning - Afternoon</strong>
<br>- 08:00 / 14:00 – Pick up guests at Quy Nhon city center.
<br>- 08:15 / 14:15 – Travel to Twin Towers (about 3km from the center).
<br>- 08:30 / 14:30 – Visit Twin Towers: Learn about ancient Champa architecture.
<br>- Listen to explanations about Cham history and culture.
<br>- Take photos freely, explore the green campus.
<br>- 09:30 / 15:30 – Stop by a cafe or restaurant near the tower to relax.
<br>- 10:30 / 16:30 – Drop guests back to the center – end of a gentle, inspiring journey.

  </p>
      </div>

    </section>

    <h2>Tour Highlights</h2>
        <div class="tour-highlights">
            <img src="images/highlightsthapdoi1.jpg" alt="Highlight 1">
            <img src="images/highlightsthapdoi2.jpg" alt="Highlight 2">
            <img src="images/highlightsthapdoi3.jpg" alt="Highlight 3">
            <img src="images/highlightsthapdoi4.jpg" alt="Highlight 4">
            <img src="images/highlightsthapdoi5.jpg" alt="Highlight 5">
            <img src="images/highlightsthapdoi6.jpg" alt="Highlight 6">
            <img src="images/highlightsthapdoi7.jpg" alt="Highlight 7">
            <img src="images/highlightsthapdoi8.jpg" alt="Highlight 8">
            <img src="images/highlightsthapdoi9.jpg" alt="Highlight 9">
            <img src="images/highlightsthapdoi10.jpg" alt="Highlight 10">
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
    <b>Click <strong>“Book Tour Now”</strong> The Twin Towers are not only a cultural destination, but also a place for you to calm down in the midst of modern life, feeling the breath of an ancient civilization that once flourished in Binh Dinh.! 🌊✨</b>
  </p>
  
    <div class="price-box">
    <div class="price-item adult">
      <h4>👨‍👩‍👧 Adult Price</h4>
      <p><strong>770.000 VNĐ / person</strong></p>
    </div>
    <div class="price-item child">
      <h4>🧒 Child Price</h4>
      <p><strong>470.000 VNĐ / child</strong></p>
    </div>
  </div>

  <button class="book-btn">Book Now</button>
</div>



<!-- GOOGLE MAPS SECTION -->
<section class="map-section">
  <h2>📍 Tour Location — Twin Towers, Quy Nhơn</h2>
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
    const twintowers = { lat: 13.7615, lng: 109.2385 };

    // Tạo bản đồ
    const map = new google.maps.Map(document.getElementById("map"), {
      zoom: 12,
      center: twintowers,
    });

    // Thêm ghim (marker)
    new google.maps.Marker({
      position: twintowers,
      map: map,
      title: "Twin Towers, Quy Nhơn",
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