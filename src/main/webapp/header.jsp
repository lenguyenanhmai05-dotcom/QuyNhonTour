<%@ page session="true" contentType="text/html; charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<header class="navbar">
  <div class="logo">
    <a href="index.jsp">
      <i class="fa-solid fa-anchor"></i>
      <span class="logo-text">QuyNhonTour</span>
    </a>
  </div>

  <nav class="nav-links">
    <a href="index.jsp">Home</a>
    <a href="tour.jsp">Tours</a>
    <a href="aboutus.html">About</a>
    <a href="travel-news">News</a>
  </nav>

  <div class="user-section">
    <%
        String firstName = (String) session.getAttribute("firstName");
        String role = (String) session.getAttribute("role");
    %>

    <% if (firstName != null) { %>
        <div class="user-info">
          <img src="https://cdn-icons-png.flaticon.com/512/847/847969.png" class="user-icon" alt="user">
          <span class="username"><%= firstName %></span>

          <% if ("admin".equalsIgnoreCase(role)) { %>
              <a href="admin/dashboard" class="admin-link">Dashboard</a>
          <% } %>

          <div class="menu-container">
            <div class="hamburger" id="hamburger">&#9776;</div>
            <div class="dropdown-menu" id="userMenu">
                <a href="cart.jsp"><i class="fa-solid fa-cart-shopping"></i> View Cart</a>
                <a href="BookingHistoryServlet"><i class="fa-solid fa-clock-rotate-left"></i> Booking History</a>
                <a href="logout.jsp"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
            </div>
          </div>
        </div>
    <% } else { %>
        <a href="login.jsp" class="btn">Login</a>
        <a href="register.jsp" class="btn">Sign Up</a>
    <% } %>
  </div>
</header>

<style>
/* === Font mặc định toàn site === */
body, * {
  font-family: 'Poppins', sans-serif;
}

/* === Logo "QuyNhonTour" riêng font emoji === */
.logo-text {
  font-family: 'Segoe UI Emoji', 'Noto Color Emoji', 'Apple Color Emoji', sans-serif;
  font-weight: 700;
  font-size: 22px;
  color: #fff;
  letter-spacing: 1px;
}

/* === Biểu tượng === */
.fa-anchor {
  color: #aee1ff;
  margin-right: 6px;
}

/* 🌊 Navbar tổng thể */
.navbar {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 15px 40px;
  background: linear-gradient(135deg, #00b4db, #0083b0);
  box-shadow: 0 3px 8px rgba(0,0,0,0.15);
  position: sticky;
  top: 0;
  z-index: 1000;
}

/* === Liên kết logo === */
.logo a {
  text-decoration: none;
  display: flex;
  align-items: center;
}

/* === Menu chính === */
.nav-links a {
  margin: 0 15px;
  color: #fff;
  text-decoration: none;
  font-weight: 500;
  transition: color 0.3s ease;
}

.nav-links a:hover {
  color: #f39f56;
}

/* === User section === */
.user-section {
  display: flex;
  align-items: center;
}

.user-info {
  display: flex;
  align-items: center;
  gap: 10px;
  position: relative;
}

.user-icon {
  width: 35px;
  height: 35px;
  border-radius: 50%;
  border: 2px solid #fff;
}

.username {
  font-weight: 600;
  color: #fff;
}

.admin-link {
  color: #1f4d75;
  font-size: 14px;
  text-decoration: underline;
}

/* === Dropdown === */
.hamburger {
  font-size: 24px;
  cursor: pointer;
  margin-left: 10px;
  color: #fff;
}

.dropdown-menu {
  display: none;
  position: absolute;
  right: 0;
  top: 45px;
  background: #fff;
  border-radius: 8px;
  box-shadow: 0 4px 12px rgba(0,0,0,0.15);
  overflow: hidden;
  min-width: 190px;
  opacity: 0;
  transform: translateY(-10px);
  transition: all 0.25s ease;
}

.dropdown-menu.show {
  display: block;
  opacity: 1;
  transform: translateY(0);
}

.dropdown-menu a {
  display: block;
  padding: 10px 15px;
  color: #333;
  text-decoration: none;
}

.dropdown-menu a:hover {
  background-color: #f0f8ff;
}

/* === Guest buttons === */
.btn {
  background: #ffffff33;
  color: #fff;
  padding: 8px 15px;
  border-radius: 5px;
  margin-left: 10px;
  text-decoration: none;
  border: 1px solid #fff;
  transition: 0.3s;
}

.btn:hover {
  background: #ffffff55;
}
</style>

<script>
document.addEventListener("DOMContentLoaded", function() {
  const hamburger = document.getElementById("hamburger");
  const menu = document.getElementById("userMenu");
  if (hamburger && menu) {
    hamburger.addEventListener("click", (e) => {
      e.stopPropagation();
      menu.classList.toggle("show");
    });
    window.addEventListener("click", (e) => {
      if (!e.target.closest(".menu-container")) {
        menu.classList.remove("show");
      }
    });
  }
});
</script>
