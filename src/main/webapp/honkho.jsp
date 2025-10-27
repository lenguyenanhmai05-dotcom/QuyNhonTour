<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%
    // Lấy email người dùng từ session
    String userEmail = (String) session.getAttribute("userEmail");
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hòn Khô Tour | QuyNhonTour</title>
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

    <!-- NỘI DUNG CHÍNH -->
    <main class="poster">
    <section class="hero">
      <!-- hình nền chính (thay bằng ảnh của bạn nếu muốn) -->
      <div class="hero-inner">
        <div class="polaroids">
          <div class="polaroid" style="--r:-8deg">
            <img src="images/honkho.jpg" alt="pic1">
          </div>
          <div class="polaroid" style="--r:6deg">
            <img src="images/kyco-eogio1.jpg" alt="pic2">
          </div>
          <div class="polaroid" style="--r:-2deg">
            <img src="images/kyco-eogio2.jpg" alt="pic3">
          </div>
        </div>

        <h1 class="title"><span>QUY NHON</span><small>HON KHO — KY CO — EO GIO</small></h1>

        <div class="tour-description">
            <p>
            If you are looking for a trip to “escape” the hustle and bustle of life, <b>Hon Kho</b> – the rough gem of <i>Quy Nhon beach</i> – is the ideal choice. With clear blue water, fine white sand and colorful coral reefs, Hon Kho offers a wild and peaceful experience. Combined with <b>Ky Co and Eo Gio</b>, you will have a colorful 3-day 2-night journey, suitable for traveling with your lover, close friends or family.
            </p>
        </div>
      </div>
    </section>

        <h2 class="itinerary-title">Itinerary</h2>
    <section class="itinerary">
      <div class="card">
        <h3>DAY 1</h3>
        <p><strong>  DEPARTURE – EO GIO – TWIN TOWERS</strong><br>- Morning: Travel to Quy Nhon, check in hotel and rest.
<br>- Lunch: Enjoy local specialties such as jumping shrimp pancakes, fish noodle soup.
<br>- Afternoon: Visit Eo Gio - known as "Vietnam's Jeju" with winding cliffs by the sea.
<br>- Evening: Visit the Twin Towers - an ancient Cham Pa architectural work, then have dinner and rest.</p>
      </div>

      <div class="card">
        <h3>DAY 2</h3>
        <p><strong>  HON KHO – CORAL DIVING – KY CO</strong><br>- Morning: Travel by canoe to Hon Kho, experience snorkeling, swimming, taking photos with the famous wooden bridge.
<br>- Lunch: Eat fresh seafood at a floating house on the sea.
<br>- Afternoon: Visit Ky Co beach - where the sea water is two colors and the sand is as smooth as cream.
<br>- Evening: Return to the city, enjoy dinner at a restaurant by the sea.</p>
      </div>

      <div class="card">
        <h3>DAY 3</h3>
        <p><strong>  FREE TO EXPLORE - SHOPPING - END OF TRIP</strong><br>- Morning: Free time to walk around and buy souvenirs at Quy Nhon market.
<br>- Noon: Light lunch, prepare luggage.
<br>- Afternoon: Check out of the hotel, get on the bus back to the starting point.</p>
      </div>

    </section>

    <h2>Tour Highlights</h2>
        <div class="tour-highlights">
            <img src="images/highlight1.jpg" alt="Highlight 1">
            <img src="images/highlight2.jpg" alt="Highlight 2">
            <img src="images/highlight3.jpg" alt="Highlight 3">
            <img src="images/highlight4.jpg" alt="Highlight 4">
            <img src="images/highlight5.jpg" alt="Highlight 5">
            <img src="images/highlight6.jpg" alt="Highlight 6">
            <img src="images/highlight7.jpg" alt="Highlight 7">
            <img src="images/highlight8.jpg" alt="Highlight 8">
            <img src="images/highlight9.jpg" alt="Highlight 9">
            <img src="images/highlight10.jpg" alt="Highlight 10">
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
      <p><strong>2.980.000 VNĐ / person</strong></p>
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
  <h2>📍 Tour Location — Hon Kho, Quy Nhơn</h2>
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
    // 🏝️ Vị trí Hòn Khô - Quy Nhơn
    const honKho = { lat: 13.8683, lng: 109.2826 };

    // Tạo bản đồ
    const map = new google.maps.Map(document.getElementById("map"), {
      zoom: 14,
      center: honKho,
    });

    // Ghim (marker)
    new google.maps.Marker({
      position: honKho,
      map: map,
      title: "Hòn Khô - Quy Nhơn",
    });
  }
</script>

<!-- 🧭 Gọi Google Maps API -->
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
