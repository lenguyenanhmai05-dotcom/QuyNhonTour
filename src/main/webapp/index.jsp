<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quy Nhơn Tours</title>
    <link rel="stylesheet" href="css/test-style.css">
</head>
<body>

<jsp:include page="header.jsp" />

<main class="hero">
  <div class="hero-content">
    <h1>
      Discover the beauty of Quy Nhon 
      <span class="palm">🌴</span>
    </h1>
    <p>Experience blue sea, white sand, and golden sunshine with QuyNhonTour!</p>
    <a href="tour.jsp" class="explore-btn">Explore Now</a>
  </div>
</main>

<!-- ====== PHẦN TÌM TOUR ====== -->
<section class="search-tour">
    <h2>Find Tours</h2>
    <form class="search-form">
        <div class="form-group">
            <label>Departure point</label>
            <input type="text" placeholder="VD: TP. Hồ Chí Minh">
        </div>
        <div class="form-group">
            <label>Destination</label>
            <input type="text" placeholder="VD: Quy Nhơn">
        </div>
        <div class="form-group">
            <label>Departure date</label>
            <input type="date">
        </div>
        <div class="form-group">
            <label>Tour duration</label>
            <select>
                <option>2 days 1 night</option>
                <option>3 days 2 nights</option>
                <option>4 days 3 nights</option>
            </select>
        </div>
        <button type="submit" class="btn-search">Find tour</button>
    </form>
</section>

<!-- ====== DỊCH VỤ NỔI BẬT ====== -->
<section class="services">
    <div class="service-item">
        <i class="fa-solid fa-umbrella-beach"></i>
        <p>Package tour</p>
    </div>
    <div class="service-item">
        <i class="fa-solid fa-hotel"></i>
        <p>Hotels & Resorts</p>
    </div>
    <div class="service-item">
        <i class="fa-solid fa-utensils"></i>
        <p>Local cuisine</p>
    </div>
    <div class="service-item">
        <i class="fa-solid fa-gift"></i>
        <p>Special Offers</p>
    </div>
</section>

<section class="featured-tours">
  <h2>Featured Tours in Quy Nhon</h2>
  <p class="subtitle">Explore the most popular destinations loved by travelers</p>

  <div class="tour-gallery">
    <div class="tour-item">
      <img src="images/tour1.jpg" alt="Tour 1">
      <div class="tour-info">
        <h3>Ky Co Island</h3>
        <p>White sand beaches and turquoise sea.</p>
      </div>
    </div>
    <div class="tour-item">
      <img src="images/tour2.jpg" alt="Tour 2">
      <div class="tour-info">
        <h3>Hon Kho Island</h3>
        <p>Enjoy coral reefs and fishing village life.</p>
      </div>
    </div>
    <div class="tour-item">
      <img src="images/tour3.jpg" alt="Tour 3">
      <div class="tour-info">
        <h3>Cu Lao Xanh Island</h3>
        <p>Hidden gem of crystal-clear blue sea.</p>
      </div>
    </div>
    <div class="tour-item">
      <img src="images/tour4.jpg" alt="Tour 4">
      <div class="tour-info">
        <h3>	Tay Son Arts Tour</h3>
        <p>Visit Quang Trung Museum, see art exhibitions.</p>
      </div>
    </div>
    <div class="tour-item">
      <img src="images/tour5.jpg" alt="Tour 5">
      <div class="tour-info">
        <h3>Twin Towers City Tour</h3>
        <p>Discover ancient Cham architecture, great for photos.</p>
      </div>
    </div>
    <div class="tour-item">
      <img src="images/tour6.jpg" alt="Tour 6">
      <div class="tour-info">
        <h3>Eo Gio – Tinh Xa Ngoc Hoa – Green Path Tour</h3>
        <p>Discover coastal cliffs, spiritual serenity, and a scenic eco walking trail</p>
      </div>
    </div>
    <div class="tour-item">
      <img src="images/tour7.jpg" alt="Tour 7">
      <div class="tour-info">
        <h3>Ghenh Rang – Tien Sa Tour</h3>
        <p>Visit Han Mac Tu’s tomb, enjoy Quy Hoa beach view.</p>
      </div>
    </div>
    <div class="tour-item">
      <img src="images/tour8.jpg" alt="Tour 8">
      <div class="tour-info">
        <h3>	Hon Seo Island Adventure</h3>
        <p>Fishing and snorkeling on a secluded island.</p>
      </div>
    </div>
    <div class="tour-item">
      <img src="images/tour9.jpg" alt="Tour 9">
      <div class="tour-info">
        <h3>Camping Trung Luong - Ong Nui Pagoda</h3>
        <p>Beach camping, BBQ night, spiritual visit to Ông Nui Pagoda, and outdoor activities in Quy Nhon.</p>
      </div>
    </div>
    <div class="tour-item">
      <img src="images/tour10.jpg" alt="Tour 10">
      <div class="tour-info">
        <h3>FLC Quy Nhon Resort Getaway</h3>
        <p>Luxury resort, spa, infinity pool.</p>
      </div>
    </div>
  </div>
</section>

<section class="why-choose-us">
  <h2>Why Choose <span>QuyNhonTour</span>?</h2>
  <div class="reasons">
    <div class="reason-card">
      <div class="icon">🚌</div>
      <h3>Local Expert Guides</h3>
      <p>Our experienced guides know every hidden gem of Quy Nhơn, giving you an authentic local experience.</p>
    </div>

    <div class="reason-card">
      <div class="icon">⏱️</div>
      <h3>Easy Booking</h3>
      <p>Book your dream tour in just a few clicks. Fast confirmation and flexible cancellation options.</p>
    </div>

    <div class="reason-card">
      <div class="icon">💬</div>
      <h3>24/7 Support</h3>
      <p>We’re always here to help — anytime, anywhere. Friendly support team available around the clock.</p>
    </div>

    <div class="reason-card">
      <div class="icon">🌟</div>
      <h3>Customer Reviews</h3>
      <p>Thousands of happy travelers have shared their unforgettable experiences with QuyNhonTour.</p>
    </div>
  </div>
</section>

<footer class="footer">
  <div class="footer-container">

    <!-- BRAND + SLOGAN -->
    <div class="footer-brand">
      <h2>QuyNhonTour</h2>
      <p>Discover the beauty of Quy Nhơn with us.</p>
    </div>

    <!-- QUICK LINKS -->
    <div class="footer-links">
      <h3>Quick Links</h3>
      <ul>
        <li><a href="#">Home</a></li>
        <li><a href="#">Tours</a></li>
        <li><a href="#">About Us</a></li>
        <li><a href="#">Blog</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
    </div>

    <!-- CONTACT INFO -->
    <div class="footer-contact">
      <h3>Contact</h3>
      <p><i class="fa-solid fa-envelope"></i> quynhontour@gmail.com</p>
      <p><i class="fa-solid fa-phone"></i> +84 384 757 752</p>
      <p><i class="fa-solid fa-location-dot"></i> Quy Nhơn - Gia Lai</p>
    </div>

    <!-- NEWSLETTER -->
    <div class="footer-newsletter">
      <h3>Stay Updated</h3>
      <p>Subscribe to get the latest travel deals and news.</p>
      <form>
        <input type="email" placeholder="Enter your email" required>
        <button type="submit">Subscribe</button>
      </form>
      <div class="social-icons">
        <a href="#"><i class="fa-brands fa-facebook-f"></i></a>
        <a href="#"><i class="fa-brands fa-instagram"></i></a>
        <a href="#"><i class="fa-brands fa-tiktok"></i></a>
      </div>
    </div>
  </div>

  <div class="footer-bottom">
    <p>© 2025 QuyNhonTour. All rights reserved.</p>
  </div>
</footer>

<jsp:include page="chatbox.jsp" />

</body>
</html>