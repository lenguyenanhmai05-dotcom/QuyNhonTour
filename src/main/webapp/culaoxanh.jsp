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
  <h3>990.000 VND/person</h3>
  <button class="book-btn">Book Now</button>
</div>

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
