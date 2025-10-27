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
            <img src="images/taysonquynhon.jpg" alt="pic1">
          </div>
          <div class="polaroid" style="--r:6deg">
            <img src="images/taysonquynhon1.jpg" alt="pic2">
          </div>
          <div class="polaroid" style="--r:-2deg">
            <img src="images/taysonquynhon2.jpg" alt="pic3">
          </div>
        </div>

        <h1 class="title"><span>QUY NHON</span><small>TAY SON - QUY NHON - GO TO THE SEA</small></h1>

        <div class="tour-description">
            <p>
            The 4-day, 3-night tour “Journey to the Land of Martial Arts” takes you from the coastal city of Quy Nhon to the historic Tay Son land, where the feats of King Quang Trung were recorded. You will admire ancient architectural works, immerse yourself in the amazing nature and enjoy the fresh sea air. This is an ideal journey for those who love culture - history - nature.
            </p>
        </div>
      </div>
    </section>

        <h2 class="itinerary-title">Itinerary</h2>
    <section class="itinerary">
      <div class="card">
        <h3>🗓️DAY 1</h3>
        <p><strong>  DEPARTURE – RETURN TO THE LAND OF MARTIAL ARTS</strong>
<br>- 07:30: Pick up at the hotel in Quy Nhon, depart for Tay Son (~50km)
<br>- 09:00: Visit Quang Trung Museum – where artifacts of King Quang Trung are kept, watch drum performances and traditional martial arts
<br>- 11:00: Visit Duong Long Tower – the tallest ancient Cham tower complex in Vietnam
<br>- 12:30: Lunch at a local restaurant
<br>- 14:00: Check in at the hotel, rest
<br>- 16:00: Visit the Altar of Heaven – where King Quang Trung once performed a ceremony to worship the heavens before marching to the North
<br>- 18:00: Dinner
<br>- 19:30: Stroll and check-in at Tay Son Square sparkling lights, enjoy the local cultural space
  </p>
      </div>

      <div class="card">
        <h3>🗓️DAY 2</h3>
        <p><strong>  TAY SON NATURE – DANG DAM BRIDGE</strong>
<br>- 07:30: Breakfast at the hotel
<br>- 08:30: Depart for Ham Ho – a famous eco-tourism area with stone streams, primeval forests, and canoeing
<br>- 11:30: Lunch at a restaurant in the tourist area
<br>- 13:00: Visit, bathe in the stream, take photos at Ham Ho rock beach
<br>- 15:30: Return to the hotel to rest
<br>- 17:30: Dinner
<br>- 19:00: Visit Phu Phong Dam Dang Bridge – watch the sunset and the lights reflecting on the water, take beautiful photos  
  </p>
      </div>  

      <div class="card">
        <h3>🗓️DAY 3</h3>
        <p><strong>  RETURN ABOUT QUY NHON – SEA AND CITY</strong>
<br>- 08:00: Breakfast, check out
<br>- 09:00: Depart for Quy Nhon City. Quy Nhon
<br>- 11:00: Check in to the hotel by the sea, rest
<br>- 12:30: Lunch at a seafood restaurant
<br>- 14:00: Free time to swim, walk around Quy Nhon Beach
<br>- 17:30: Dinner
<br>- 19:30: Visit Quy Nhon Square - open space, city symbol, ideal for night photography   
  </p>
      </div>

    <div class="card">
        <h3>🗓️DAY 4</h3>
        <p><strong>  FREE TIME - END OF TOUR</strong>
<br>- 07:30: Breakfast at the hotel
<br>- 08:30: Free time to swim, shop for specialties such as gai leaf cake, Huyen market spring rolls, dried seafood
<br>- 11:30: Light lunch, check out
<br>- 12:00: End of tour - goodbye and see you again!
  </p>
      </div>  

    </section>

    <h2>Tour Highlights</h2>
        <div class="tour-highlights">
            <img src="images/taysonquynhonhl1.jpg" alt="Highlight 1">
            <img src="images/taysonquynhonhl2.jpg" alt="Highlight 2">
            <img src="images/taysonquynhonhl3.jpg" alt="Highlight 3">
            <img src="images/taysonquynhonhl4.jpg" alt="Highlight 4">
            <img src="images/taysonquynhonhl5.jpg" alt="Highlight 5">
            <img src="images/taysonquynhonhl6.jpg" alt="Highlight 6">
            <img src="images/taysonquynhonhl7.jpg" alt="Highlight 7">
            <img src="images/taysonquynhonhl8.jpg" alt="Highlight 8">
            <img src="images/taysonquynhonhl9.jpg" alt="Highlight 9">
            <img src="images/taysonquynhonhl10.jpg" alt="Highlight 10">
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
    where adventure meets tranquility at Tay Son! 🌊✨</b>
  </p>

  <div class="price-box">
    <div class="price-item adult">
      <h4>👨‍👩‍👧 Adult Price</h4>
      <p><strong>3.800.000 VNĐ / person</strong></p>
    </div>
    <div class="price-item child">
      <h4>🧒 Child Price</h4>
      <p><strong>3.300.000 VNĐ / child (free for children under 2 years old) </strong></p>
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
