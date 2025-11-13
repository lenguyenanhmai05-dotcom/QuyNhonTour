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
  <title>Cu Lao Xanh Tour — QuyNhonTour</title>
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
            <img src="images/culaoxanh.jpg" alt="pic1">
          </div>
          <div class="polaroid" style="--r:6deg">
            <img src="images/culaoxanh1.jpg" alt="pic2">
          </div>
          <div class="polaroid" style="--r:-2deg">
            <img src="images/culaoxanh2.jpg" alt="pic3">
          </div>
        </div>

        <h1 class="title"><span>QUY NHON</span><small>🏝 CU LAO XANH TOUR – THE PEARL OF THE SEA 2 DAYS 1 NIGHT 🏝</small></h1>

        <div class="tour-description">
            <p>
            The <b>2-day 1-night</b> journey to explore <b>Cu Lao Xanh Island</b> – a place where wild beauty and peace converge and experience the life of fishermen in the middle of Quy Nhon sea and sky. is an ideal journey for you to "touch nature", slow down and feel the peace in the middle of the vast sea and sky.
            </p>
        </div>
      </div>
    </section>

        <h2 class="itinerary-title">Itinerary</h2>
    <section class="itinerary">
      <div class="card">
        <h3>DAY 1</h3>
        <p><strong>  QUY NHON – CU LAO XANH – CAMPING ON THE BEACH</strong><br>Morning:
<br>- Pick up guests at the center of Quy Nhon, move to Ham Tu port.
<br>- High-speed canoe takes you to Cu Lao Xanh island – only takes about 30 minutes of surfing.
<br>- Check-in at Cu Lao Xanh lighthouse – the symbol of the island, where you can see the whole view of the sea and sky.
<br>- Visit the national flagpole – a sacred place affirming the sovereignty of the sea and islands.
<br>- Afternoon – Evening:
<br>- Camp on a pristine beach, organize a seafood BBQ party.
<br>- Stay overnight in a tent or homestay on the island.
  </p>
      </div>

      <div class="card">
        <h3>DAY 2</h3>
        <p><strong>  DISCOVER THE LIFE OF FISHERMEN – QUY NHON</strong>
<br>- Wake up early to catch the sunrise, have a light breakfast.
<br>- Visit Nhon Chau fishing village, learn about the life of fishermen, experience pulling nets, fishing.
<br>- Visit the local seafood market – where you can buy seafood specialties as gifts.
<br>- Have lunch at a local's house with traditional dishes of the island.  
<br>- Return guests to Quy Nhon by speedboat – end of the exciting journey. 
  </p>
      </div>

    </section>

    <h2>Tour Highlights</h2>
        <div class="tour-highlights">
            <img src="images/highlightsculaoxanh1.jpg" alt="Highlight 1">
            <img src="images/highlightsculaoxanh2.jpg" alt="Highlight 2">
            <img src="images/highlightsculaoxanh3.jpg" alt="Highlight 3">
            <img src="images/highlightsculaoxanh4.jpg" alt="Highlight 4">
            <img src="images/highlightsculaoxanh5.jpg" alt="Highlight 5">
            <img src="images/highlightsculaoxanh6.jpg" alt="Highlight 6">
            <img src="images/highlightsculaoxanh7.jpg" alt="Highlight 7">
            <img src="images/highlightsculaoxanh11.jpg" alt="Highlight 8">
            <img src="images/highlightsculaoxanh12.jpg" alt="Highlight 9">
            <img src="images/highlightsculaoxanh10.jpg" alt="Highlight 10">
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
    where adventure meets tranquility at Cu Lao Xanh Island! 🌊✨</b>
  </p>
    <div class="price-box">
    <div class="price-item adult">
      <h4>👨‍👩‍👧 Adult Price</h4>
      <p><strong>1.300.000 VND / person</strong></p>
    </div>
    <div class="price-item child">
      <h4>🧒 Child Price</h4>
      <p><strong>800.000 VND / child (free for children under 2 years old)</strong></p>
    </div>
  </div>

  <form action="booking.jsp" method="get">
    <input type="hidden" name="tourName" value="Cu Lao Xanh Tour"/>
    <input type="hidden" name="tourImage" value="images/culaoxanh.jpg"/>
    <input type="hidden" name="adultPrice" value="1300000"/>
    <input type="hidden" name="childPrice" value="800000"/>
    <button type="submit" class="book-btn">Book Now</button>
</form>

</div>



<!-- GOOGLE MAPS SECTION -->
<section class="map-section">
  <h2>📍 Tour Location — Cu Lao Xanh, Quy Nhon</h2>
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
    // 🏝️ Vị trí Cù Lao Xanh - Quy Nhơn
    const cuLaoXanh = { lat: 13.5964, lng: 109.3857 };

    // Tạo bản đồ
    const map = new google.maps.Map(document.getElementById("map"), {
      zoom: 13,
      center: cuLaoXanh,
    });

    // Ghim (marker)
    new google.maps.Marker({
      position: cuLaoXanh,
      map: map,
      title: "Cu Lao Xanh - Quy Nhon",
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
