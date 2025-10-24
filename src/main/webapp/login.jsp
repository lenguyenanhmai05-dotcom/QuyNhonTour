<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Login - QuyNhonTour</title>
  <link rel="stylesheet" href="css/login.css" />
</head>
<body>
  <div class="login-container">
    <div class="login-box">
      <h2>Login</h2>

      <form action="login" method="post">
        <input type="email" name="email" placeholder="Email" required />
        <input type="password" name="password" placeholder="Password" required />
        <button type="submit" class="btn">Login</button>
      </form>

      <div id="error-box" class="error" style="display:none;"></div>

      <p class="alt-text">
        <a href="forgot-password.jsp">Forgot password?</a>
      </p>

      <p class="alt-text">
        Don’t have an account? <a href="register.jsp">Register now</a>
      </p>
    </div>
  </div>

  <script>
    const params = new URLSearchParams(window.location.search);
    const errorBox = document.getElementById("error-box");

    if (params.get("error") === "invalid") {
      errorBox.style.display = "block";
      errorBox.textContent = "Invalid email or password.";
    }
  </script>
</body>
</html>
