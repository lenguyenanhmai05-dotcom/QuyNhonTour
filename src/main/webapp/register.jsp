<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Create Account - QuyNhonTours</title>
  <link rel="stylesheet" href="css/register.css">
</head>
<body>
  <div class="register-container">
    <form action="send-register-otp" method="post" class="register-form">
      <h2>Create Account</h2>
      <p>Join <b>QuyNhonTours</b> and discover your perfect trip</p>

      <div class="name-row">
        <input type="text" name="firstName" placeholder="First name" required>
        <input type="text" name="lastName" placeholder="Last name" required>
      </div>

      <input type="email" name="email" placeholder="Enter your email" required>
      <input type="date" name="dob" required>
      <input type="password" name="password" placeholder="Create password" required>
      <input type="password" name="confirmPassword" placeholder="Confirm password" required>

      <label class="checkbox">
        <input type="checkbox" required>
        I agree to the <a href="#">Terms of Service</a> and <a href="#">Privacy Policy</a>
      </label>

      <label class="checkbox">
        <input type="checkbox"> Subscribe to our newsletter
      </label>

      <button type="submit" class="btn">Create Account</button>

      <p class="alt-text">Already have an account? <a href="login.jsp">Sign in</a></p>
    </form>
  </div>
</body>
</html>
