<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Verify OTP - QuyNhonTour</title>
</head>

<style>
/* ===== GENERAL STYLE ===== */
    body {
      margin: 0;
      font-family: "Poppins", sans-serif;
      background-color: #ffffff;
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    /* ===== CONTAINER ===== */
    .login-container {
      width: 100%;
      max-width: 400px;
      background: #ffffff;
      border-radius: 20px;
      box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
      padding: 40px 35px;
      text-align: center;
      border: 1px solid #e3f2fd;
    }

    .login-header {
      background-color: #e3f2fd;
      border-radius: 15px;
      padding: 20px 10px;
      margin-bottom: 30px;
    }

    .login-header h2 {
      font-size: 24px;
      color: #000;
      margin-bottom: 8px;
    }

    .login-header p {
      font-size: 14px;
      color: #333;
    }

    /* ===== INPUT ===== */
    input[type="text"] {
      width: 100%;
      padding: 12px 15px;
      margin: 10px 0 20px;
      border: 1px solid #bbdefb;
      border-radius: 10px;
      background: #f9fbfd;
      font-size: 14px;
      outline: none;
      transition: 0.2s ease;
      box-sizing: border-box;
    }

    input:focus {
      border-color: #1565c0;
      box-shadow: 0 0 4px rgba(21, 101, 192, 0.3);
    }

    /* ===== BUTTON ===== */
    button {
      width: 100%;
      padding: 12px;
      background-color: #1565c0;
      border: none;
      border-radius: 10px;
      color: white;
      font-weight: bold;
      cursor: pointer;
      transition: 0.3s ease;
    }

    button:hover {
      background-color: #0d47a1;
      transform: translateY(-2px);
    }

    /* ===== ERROR ===== */
    .error {
      color: #d32f2f;
      background: #ffebee;
      border: 1px solid #ffcdd2;
      padding: 10px;
      border-radius: 10px;
      margin-top: 10px;
      font-size: 14px;
    }
  </style>
</head>

<body>
  <div class="login-container">
    <div class="login-header">
      <h2>Verify OTP</h2>
      <p>Please enter the 6-digit OTP sent to your email.</p>
    </div>

    <form action="verify-reset-otp" method="post">
      <input type="text" name="otp" placeholder="Enter 6-digit OTP" maxlength="6" required>
      <button type="submit" class="btn">Verify</button>
    </form>

    <% 
      String error = (String) request.getAttribute("error");
      if (error != null) { 
    %>
      <div class="error"><%= error %></div>
    <% } %>

    <div class="alt-text">
      <p>Didn’t receive the code? <a href="resend-otp">Resend OTP</a></p>
    </div>
  </div>
</body>
</html>
