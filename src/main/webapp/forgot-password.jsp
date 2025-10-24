<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Forgot Password - QuyNhonTour</title>
  <link rel="stylesheet" href="css/login.css">
</head>
<body>
  <div class="login-container">
    <div class="login-box">
      <h2>Forgot Password</h2>
      <p>Enter your registered email to receive a reset OTP.</p>

      <form action="${pageContext.request.contextPath}/send-forgot-otp" method="post">
        <input type="email" name="email" placeholder="Email address" required>
        <button type="submit" class="btn">Send OTP</button>
      </form>

      <p class="alt-text">
        <a href="login.jsp">← Back to login</a>
      </p>
    </div>
  </div>
</body>
</html>
