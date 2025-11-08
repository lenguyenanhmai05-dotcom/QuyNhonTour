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
  <title>Hòn Khô Tour — QuyNhonTour</title>
  <link rel="stylesheet" href="css/honkho.css">
</head>
<body>
  <jsp:include page="header.jsp" />

<main class="poster">
    <section class="hero">
      <!-- hình nền chính (thay bằng ảnh của bạn nếu muốn) -->
      <div class="hero-inner">
        <div class="polaroids">
          <div class="polaroid" style="--r:-8deg">
            <img src="images/ghenhrangtiensa.jpg" alt="pic1">
          </div>
          <div class="polaroid" style="--r:6deg">
            <img src="images/ghenhrangtiensa1.jpg" alt="pic2">
          </div>
          <div class="polaroid" style="--r:-2deg">
            <img src="images/ghenhrangtiensa2.jpg" alt="pic3">
          </div>
        </div>

        <h1 class="title"><span>QUY NHON</span><small> GHENH RANG - TIEN SA TOUR</small></h1>

        <div class="tour-description">
            <p>
            <b>Ghenh Rang Tien Sa</b> is a scenic coastal area located just 2 km south of Quy Nhon city center. It’s known for its wild beauty, stacked rock formations, and the famous Queen’s Beach with smooth round pebbles. This is also where poet Han Mac Tu spent his final years. Nearby is Lang Phong Quy Hoa, a peaceful village that once served as a treatment center for leprosy patients and holds deep cultural and historical significance. The village is quiet, green, and full of humanity.
            </p>
        </div>
      </div>
    </section>

        <h2 class="itinerary-title">Itinerary</h2>
    <section class="itinerary">

      <div class="card">
        <h3>📸 TIPS FOR TAKING BEAUTIFUL PHOTOS AT THE BANH IT TOWER AND THIEN HUONG PAGODA TOUR</h3>
<br>- Clothing: choose ao dai, boho dress or white clothes to stand out against the ancient red brick background.
<br>- Time: early morning or cool afternoon for soft light and few people.
<br>- Shooting angle: from below to clearly see the curved roof, or from afar to capture both towers.
  </p>
      </div>
      
      <div class="card">
        <h3>1 DAY</h3>
        <p><strong>  GHENH RANG – TIEN SA - LANG PHONG QUY HOA</strong>
<br>- Breakfast in Quy Nhon (try banh hoi or fish noodle soup)
<br>- Travel to Ghenh Rang Tien Sa by motorbike or taxi
<br>- Visit Bai Da Chong and Queen’s Beach, take photos
<br>- Visit Han Mac Tu’s grave, listen to poetry and learn about his life
<br>- Walk around Thi Nhan Hill, enjoy panoramic views of Quy Nhon Bay
<br>- Lunch at a seaside restaurant with fresh seafood
<br>- Head to Lang Phong Quy Hoa, visit the leprosy treatment center and Han Mac Tu memorial house
<br>- Stroll through the village, enjoy the peaceful scenery, chat with locals
<br>- Visit Quy Hoa Church and take photos
<br>- Return to Quy Nhon city center, end of the day trip
  </p>
      </div>

    </section>

    <h2>Tour Highlights</h2>
        <div class="tour-highlights">
            <img src="images/highlightsghenhrangtiensa1.jpg" alt="Highlight 1">
            <img src="images/highlightsghenhrangtiensa2.jpg" alt="Highlight 2">
            <img src="images/highlightsghenhrangtiensa3.jpg" alt="Highlight 3">
            <img src="images/highlightsghenhrangtiensa4.jpg" alt="Highlight 4">
            <img src="images/highlight1.jpg" alt="Highlight 5">
            <img src="images/highlightsthapdoi5.jpg" alt="Highlight 6">
            <img src="images/highlightskyco-eogio4.jpg" alt="Highlight 7">
            <img src="images/highlight3.jpg" alt="Highlight 8">
            <img src="images/highlight4.jpg" alt="Highlight 9">
            <img src="images/highlightsghenhrangtiensa10.jpg" alt="Highlight 10">
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
    <b>Click <strong>“Book Tour Now”</strong> FLC Resort Quy Nhon Gateway 3N2D Tour is an ideal choice for a vacation combined with exploration, helping you recharge, enjoy luxury and capture wonderful moments by the sea and sky of Binh Dinh.! 🌊✨</b>
  </p>
  
  <div class="price-box">
    <div class="price-item adult">
      <h4>👨‍👩‍👧 Adult Price</h4>
      <p><strong>800.000 VNĐ / person</strong></p>
    </div>
    <div class="price-item child">
      <h4>🧒 Child Price</h4>
      <p><strong>500.000 VNĐ / child (free for children under 2 years old)</strong></p>
    </div>
  </div>

  <form action="booking.jsp" method="get">
    <input type="hidden" name="tourName" value="Ghenh Rang Tien Sa Tour"/>
    <input type="hidden" name="tourImage" value="images/ghenhrangtiensa1.jpg"/>
    <input type="hidden" name="adultPrice" value="800000"/>
    <input type="hidden" name="childPrice" value="500000"/>
    <button type="submit" class="book-btn">Book Now</button>
</form>
</div>



<!-- GOOGLE MAPS SECTION -->
<section class="map-section">
  <h2>📍 Tour Location — Ghenh Rang Tien Sa, Quy Nhơn</h2>
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
    // 🌺 Vị trí Ghềnh Ráng Tiên Sa - Quy Nhơn
    const ghenhRang = { lat: 13.7545, lng: 109.2372 };

    // Tạo bản đồ
    const map = new google.maps.Map(document.getElementById("map"), {
      zoom: 15,
      center: ghenhRang,
    });

    // Ghim (marker)
    new google.maps.Marker({
      position: ghenhRang,
      map: map,
      title: "Ghềnh Ráng Tiên Sa - Quy Nhơn",
    });
  }
</script>

<!-- 🧭 Gọi Google Maps API -->
<script async defer
  src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBbhZOTVNIVpefOMiP5aPqN18S5EmzhGAo&callback=initMap">
</script>

  </main>
  <jsp:include page="footer.jsp" />
</body>
</html>
 