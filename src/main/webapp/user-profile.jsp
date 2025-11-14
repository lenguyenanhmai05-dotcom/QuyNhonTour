<%
    // Check login
    String email = (String) session.getAttribute("email");
    String lastName = (String) session.getAttribute("lastName");
    if (email == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }

    // Get user details from DAO
    com.quynhontours.dao.UserDAO userDAO = new com.quynhontours.dao.UserDAO();
    com.quynhontours.model.User user = userDAO.getUserByEmail(email);
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>My Profile - QuyNhonTour</title>
    <link rel="stylesheet" href="css/test-style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        .profile-section {
            text-align: center;
            padding: 80px 20px;
            background: linear-gradient(180deg, #f7fbff 0%, #ffffff 100%);
        }
        .profile-card {
            background: #ffffff;
            border-radius: 18px;
            padding: 40px 30px;
            max-width: 500px;
            margin: 0 auto;
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }
        .profile-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 25px rgba(0, 0, 0, 0.15);
        }
        .profile-icon {
            font-size: 60px;
            color: #0077b6;
            margin-bottom: 20px;
        }
        .profile-card h2 {
            font-size: 2rem;
            color: #1d3557;
            margin-bottom: 30px;
            font-weight: 700;
        }
        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: 600;
            color: #555;
        }
        input[type="text"], input[type="email"], input[type="tel"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }
        input:focus {
            border-color: #007BFF;
            outline: none;
        }
        .readonly {
            background: #f9f9f9;
            cursor: not-allowed;
        }
        .edit-btn, .save-btn {
            background: linear-gradient(90deg, #007BFF, #00BFFF);
            color: white;
            border: none;
            padding: 12px 30px;
            border-radius: 25px;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.3s ease;
            margin-top: 20px;
        }
        .edit-btn:hover, .save-btn:hover {
            background: linear-gradient(90deg, #0066cc, #0099e6);
        }
        .message {
            text-align: center;
            margin-bottom: 20px;
            padding: 10px;
            border-radius: 5px;
        }
        .success {
            background: #d4edda;
            color: #155724;
        }
        .error {
            background: #f8d7da;
            color: #721c24;
        }
    </style>
</head>
<body>
    <jsp:include page="header.jsp" />

    <section class="profile-section">
        <div class="profile-card">
            <div class="profile-icon">
                <i class="fas fa-user-circle"></i>
            </div>
            <h2>My Profile</h2>

            <% String message = (String) request.getAttribute("message"); %>
            <% if (message != null) { %>
                <div class="message success"><%= message %></div>
            <% } %>

            <% String error = (String) request.getAttribute("error"); %>
            <% if (error != null) { %>
                <div class="message error"><%= error %></div>
            <% } %>

            <form id="profileForm" action="UpdateUserProfileServlet" method="post">
                <div class="form-group">
                    <label for="firstName">First Name</label>
                    <input type="text" id="firstName" name="firstName" value="<%= user != null ? user.getFirstName() : "" %>" readonly required>
                </div>

                <div class="form-group">
                    <label for="lastName">Last Name</label>
                    <input type="text" id="lastName" name="lastName" value="<%= user != null ? user.getLastName() : "" %>" readonly required>
                </div>

                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" value="<%= email %>" class="readonly" readonly>
                </div>

                <div class="form-group">
                    <label for="phone">Phone Number</label>
                    <input type="tel" id="phone" name="phone" value="<%= user != null && user.getPhone() != null ? user.getPhone() : "" %>" readonly>
                </div>

                <button type="button" class="edit-btn" id="editBtn">Edit Profile</button>
                <button type="submit" class="save-btn" id="saveBtn" style="display: none;">Save Changes</button>
            </form>
        </div>
    </section>

    <jsp:include page="footer.jsp" />

    <script>
        document.getElementById('editBtn').addEventListener('click', function() {
            // Enable editing
            document.getElementById('firstName').removeAttribute('readonly');
            document.getElementById('lastName').removeAttribute('readonly');
            document.getElementById('phone').removeAttribute('readonly');

            // Hide edit button, show save button
            this.style.display = 'none';
            document.getElementById('saveBtn').style.display = 'inline-block';
        });
    </script>
</body>
</html>