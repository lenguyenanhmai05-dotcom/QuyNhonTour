<%@ page contentType="text/html; charset=UTF-8" language="java" %>
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
  <title>Trung Luong - Ong Nui Pagoda Tour</title>
  <link rel="stylesheet" href="css/honkho.css">
</head>
<body>
  <!-- HEADER (giống các trang khác) -->
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
            <img src="images/trungluong1.jpg" alt="pic1">
          </div>
          <div class="polaroid" style="--r:6deg">
            <img src="images/trungluong2.jpg" alt="pic2">
          </div>
          <div class="polaroid" style="--r:-2deg">
            <img src="images/trungluong3.jpg" alt="pic3">
          </div>
        </div>

        <h1 class="title"><span>QUY NHON</span><small>🏕️ TRUNG LUONG - ONG NUI PAGODA</small></h1>

        <div class="tour-description">
            <p>
            <b>Trung Luong Camping Site</b> is located about 30 km from Quy Nhon city center, in Cat Tien commune, Phu Cat district. 
            It’s famous for its crystal-clear beach, wide grassy areas perfect for camping, colorful seaside chairs, and breathtaking sunsets.
            This is an ideal destination for anyone looking to escape the city and reconnect with nature.
            </p>
        </div>
      </div>
    </section>

    <h2 class="itinerary-title">Itinerary</h2>
    <section class="itinerary">
      <div class="card">
        <h3>DAY 1</h3>
        <p><strong> DEPARTURE - CHECKIN - BEACH CHILL</strong><br>
        - Depart from Quy Nhon, light breakfast<br>
        - Travel to Trung Luong Camping Site<br>
        - Check in to your tent or room<br>
        - Explore the site, take photos with colorful chairs and wooden bridge<br>
        - Lunch at Trung Luong restaurant<br>
        - Swim, relax, and enjoy the beach<br>
        - Watch the sunset, stroll along the shore<br>
        - Outdoor BBQ dinner, campfire activities if available<br>
        - Stargazing, unwind in your tent or room
        </p>
      </div>

      <div class="card">
        <h3>DAY 2</h3>
        <p><strong> EXPLORE - EXPERIENCE - EMBRACE NATURE </strong><br>
        - Wake up early for sunrise and morning coffee<br>
        - Breakfast and prep for outdoor activities<br>
        - Light trekking around the area, explore rock formations and sea caves<br>
        - Lunch and rest<br>
        - Try paddleboarding or kayaking (if available)<br>
        - Paint, read, or play group games on the grass<br>
        - Dinner with local seafood<br>
        - Poetry night, music jam, or simply chatting under the lights
        </p>
      </div>

      <div class="card">
        <h3>DAY 3</h3>
        <p><strong> RELAX - FAREWELL </strong><br>
        - Morning walk and fresh air<br>
        - Breakfast and pack up<br>
        - Farewell Trung Luong, take final photos<br>
        - Stop by Ong Nui Pagoda or Thap Banh It on the way back<br>
        - Lunch in Quy Nhon<br>
        - End of trip, rest at home or hotel
        </p>
      </div>
    </section>

    <h2>Tour Highlights</h2>
    <div class="tour-highlights">
        <img src="images/trungluong5.jpg" alt="Highlight 1">
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
        where adventure meets tranquility at Trung Luong! 🌊✨</b>
      </p>
         <div class="price-box">
    <div class="price-item adult">
      <h4>👨‍👩‍👧 Adult Price</h4>
      <p><strong>2.000.000 VNĐ / person</strong></p>
    </div>
    <div class="price-item child">
      <h4>🧒 Child Price</h4>
      <p><strong>1.480.000 VNĐ / child (free for children under 2 years old)</strong></p>
    </div>
  </div>

  <button class="book-btn">Book Now</button>
</div>



<!-- GOOGLE MAPS SECTION -->
<section class="map-section">
  <h2>📍 Tour Location — Trung Luong, Quy Nhơn</h2>
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
    const trungluong = { lat: 13.7615, lng: 109.2385 };

    // Tạo bản đồ
    const map = new google.maps.Map(document.getElementById("map"), {
      zoom: 12,
      center: trungluong,
    });

    // Thêm ghim (marker)
    new google.maps.Marker({
      position: trungluong,
      map: map,
      title: "Trung Luong, Quy Nhơn",
    });
  }
</script>

<!-- 🧭 Gọi Google Maps JavaScript API -->
<script async defer
  src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBbhZOTVNIVpefOMiP5aPqN18S5EmzhGAo&callback=initMap">
</script>

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
