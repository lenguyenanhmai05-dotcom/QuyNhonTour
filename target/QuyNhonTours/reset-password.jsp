<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Reset Password - QuyNhonTour</title>
  <link rel="stylesheet" href="css/login.css">
</head>
<body>
  <div class="login-container">
    <div class="login-box">
      <h2>Reset Password</h2>
      <form action="reset-password" method="post">
        <input type="password" name="newPassword" placeholder="New password" required>
        <input type="password" name="confirmPassword" placeholder="Confirm new password" required>
        <button type="submit" class="btn">Update Password</button>
      </form>
    </div>
  </div>
</body>
</html>
