<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<footer class="site-footer">
  <div class="footer-container">
    <!-- Logo & slogan -->
    <div class="footer-section brand">
        <p>🪼QuyNhonTour</p>
        <p>Discover the beauty of Quy Nhơn with us.</p>
    </div>

    <!-- Contact info -->
    <div class="footer-section contact">
      <h3>Contact</h3>
      <p><i class="fa-solid fa-envelope"></i> quynhontour@gmail.com</p>
      <p><i class="fa-solid fa-phone"></i> +84 384 757 752</p>
      <p><i class="fa-solid fa-location-dot"></i> Quy Nhơn - Gia Lai</p>
    </div>

    <!-- Quick links -->
    <div class="footer-section links">
      <h3>Quick Links</h3>
      <a href="index.jsp">Home</a>
      <a href="tour.jsp">Tours</a>
      <a href="aboutus.html">About</a>
      <a href="news.jsp">News</a>
    </div>
  </div>

  <div class="footer-bottom">
    <p>© 2025 <span>QuyNhonTour</span>. All rights reserved.</p>
  </div>
</footer>

<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
  
  .site-footer {
    background: linear-gradient(135deg, #0077b6, #00b4d8);
    color: #fff;
    padding: 50px 0 20px;
    font-family: 'Poppins', sans-serif;
  }

  .footer-container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    width: 90%;
    margin: auto;
    gap: 30px;
  }

  .footer-section h3 {
    font-size: 18px;
    margin-bottom: 15px;
    color: #e0f7fa;
  }

  .footer-section p, 
  .footer-section a {
    font-size: 14px;
    color: #f0f8ff;
    text-decoration: none;
    line-height: 1.8;
    display: block;
  }

  .footer-section a:hover {
    color: #caf0f8;
    text-decoration: underline;
  }

  .footer-bottom {
    text-align: center;
    margin-top: 40px;
    border-top: 1px solid rgba(255,255,255,0.2);
    padding-top: 15px;
    font-size: 13px;
    color: #e0f7fa;
  }

  .footer-bottom span {
    color: #fff;
    font-weight: bold;
  }

  .site-footer {
  background: linear-gradient(135deg, #0077b6, #00b4d8);
  color: #fff;
  padding: 50px 0 20px;
  font-family: 'Poppins', sans-serif;
  width: 100%;
  z-index: 10;
  position: relative;
}

.site-footer .footer-logo,
.site-footer span {
  color: #fff;
}
</style>
