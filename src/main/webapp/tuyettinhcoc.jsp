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

 <jsp:include page="header.jsp" />

  <main class="poster">
    <section class="hero">
      <!-- hình nền chính (thay bằng ảnh của bạn nếu muốn) -->
      <div class="hero-inner">
        <div class="polaroids">
          <div class="polaroid" style="--r:-8deg">
            <img src="images/tuyettinhcoc1.jpg" alt="pic1">
          </div>
          <div class="polaroid" style="--r:6deg">
            <img src="images/tuyettinhcoc2.jpg" alt="pic2">
          </div>
          <div class="polaroid" style="--r:-2deg">
            <img src="images/tuyettinhcoc3.jpg" alt="pic3">
          </div>
        </div>

        <h1 class="title"><span>QUY NHON</span><small>TUYET TINH COC</small></h1>

        <div class="tour-description">
            <p>
            <b>Tuyet Tinh Coc Quy Nhon</b> is like a watercolor painting hidden at the foot of the majestic Ham Rong mountain. Coming here, you will surely be amazed by the natural scenery full of life.
            </p>
        </div>
      </div>
    </section>

        <h2 class="itinerary-title">Itinerary</h2>
    <section class="itinerary">
      <div class="card">
        <h3>DAY 1</h3>
        <p><strong> Departure - Exploration - Camping </strong>
<br> <b>Morning:</b>
<br>- 6:30 AM: Depart from Quy Nhơn city center
<br>- 8:00 AM: Arrive at Tuyệt Tình Cốc, park your vehicle and prepare gear
<br>- 8:30 AM: Explore the surroundings, take photos by the turquoise lake, rocky cliffs, and wooden bridge
<br>- 10:30 AM: Light hiking or walking around the area to enjoy panoramic views
<br> <b>Afternoon:</b>
<br>- 12:00 PM: Picnic lunch (bring your own food or pre-order)
<br>- 1:00 PM: Relax under the trees, read a book or play card games
<br> <b>Evening:</b>
<br>- 3:00 PM: Set up tents and prepare the campsite
<br>- 4:30 PM: Capture sunset photos by the lake, start a campfire
<br>- 6:30 PM: Outdoor cooking (BBQ, mini hotpot, instant noodles…)
<br>- 8:00 PM: Group activities: singing, storytelling, games
<br>- 10:00 PM: Sleep in tents, enjoy the peaceful night
  </p>
      </div>

      <div class="card">
        <h3>DAY 2</h3>
        <p><strong>  SUNRISE – CHILL – RETURN</strong>
<br> <b>Morning:</b>
<br>- 5:30 AM: Wake up early to watch the sunrise over the lake
<br>- 6:30 AM: Make breakfast (coffee, sandwiches, eggs…)
<br>- 7:30 AM: Free time: yoga, journaling, photography
<br>- 9:00 AM: Pack up tents and clean the campsite
<br>- 11:00 AM: Depart back to Quy Nhơn city
  </p>
      </div>

    </section>

    <h2>Tour Highlights</h2>
        <div class="tour-highlights">
            <img src="images/tuyettinhcochl1.jpg" alt="Highlight 1">
            <img src="images/tuyettinhcochl2.jpg" alt="Highlight 2">
            <img src="images/tuyettinhcochl3.jpg" alt="Highlight 3">
            <img src="images/tuyettinhcochl4.jpg" alt="Highlight 4">
            <img src="images/tuyettinhcochl5.jpg" alt="Highlight 5">
            <img src="images/tuyettinhcochl6.jpg" alt="Highlight 6">
            <img src="images/tuyettinhcochl7.jpg" alt="Highlight 7">
            <img src="images/tuyettinhcochl8.jpg" alt="Highlight 8">
            <img src="images/tuyettinhcochl9.jpg" alt="Highlight 9">
            <img src="images/tuyettinhcochl10.jpg" alt="Highlight 10">
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
    where adventure meets tranquility at Tuyet Tinh Coc! 🌊✨</b>
  </p>
        <div class="price-box">
    <div class="price-item adult">
      <h4>👨‍👩‍👧 Adult Price</h4>
      <p><strong>1.000.000 VND / person</strong></p>
    </div>
    <div class="price-item child">
      <h4>🧒 Child Price</h4>
      <p><strong>500.000 VND / child (free for children under 2 years old)</strong></p>
    </div>
  </div>

<form action="booking.jsp" method="get">
    <input type="hidden" name="tourName" value="Tuyet Tinh Coc Tour"/>
    <input type="hidden" name="tourImage" value="images/tuyettinhcoc3.jpg"/>
    <input type="hidden" name="adultPrice" value="1000000"/>
    <input type="hidden" name="childPrice" value="500000"/>
    <button type="submit" class="book-btn">Book Now</button>
</form>
</div>



<!-- GOOGLE MAPS SECTION -->
<section class="map-section">
  <h2>📍 Tour Location — Tuyet Tinh Coc, Quy Nhon</h2>
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
    // 💧 Vị trí Tuyệt Tình Cốc - Quy Nhơn
    const tuyetTinhCoc = { lat: 13.8555, lng: 109.1658 };

    // Tạo bản đồ
    const map = new google.maps.Map(document.getElementById("map"), {
      zoom: 14,
      center: tuyetTinhCoc,
    });

    // Ghim (marker)
    new google.maps.Marker({
      position: tuyetTinhCoc,
      map: map,
      title: "Tuyet Tinh Coc - Quy Nhon",
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
