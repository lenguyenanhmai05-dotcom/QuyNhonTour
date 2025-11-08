<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String tourName = request.getParameter("tourName");
    String tourImage = request.getParameter("tourImage");

    int adultPrice = 0;
    int childPrice = 0;

    try {
        adultPrice = Integer.parseInt(request.getParameter("adultPrice"));
        childPrice = Integer.parseInt(request.getParameter("childPrice"));
    } catch (Exception e) {
        // Nếu không có giá thì đặt tạm = 0
        adultPrice = 0;
        childPrice = 0;
    }

    if (tourName == null || tourName.isEmpty()) {
        out.println("<h2 style='color:red;text-align:center;'>❌ Thiếu thông tin tour. Vui lòng quay lại trang Tour.</h2>");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Booking - <%= tourName %></title>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
<style>
    body {
        font-family: 'Poppins', sans-serif;
        margin: 0; padding: 0;
        background: #f5f5f5;
    }
    .booking-container {
        max-width: 800px;
        margin: 50px auto;
        background: #fff;
        border-radius: 12px;
        box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        padding: 40px;
    }
    h1 {
        text-align: center;
        color: #2c3e50;
        margin-bottom: 20px;
    }
    .tour-info {
        display: flex;
        flex-wrap: wrap;
        margin-bottom: 30px;
    }
    .tour-info img {
        max-width: 300px;
        border-radius: 12px;
        margin-right: 30px;
        flex: 1;
    }
    .tour-info .tour-details {
        flex: 2;
        min-width: 200px;
    }
    .tour-info .tour-details p {
        font-size: 18px;
        margin: 8px 0;
    }
    form label {
        display: block;
        margin: 15px 0 5px;
        font-weight: 600;
        color: #34495e;
    }
    form input, form select {
        width: 100%;
        padding: 10px;
        border-radius: 6px;
        border: 1px solid #ccc;
        font-size: 16px;
    }
    .total-price {
        margin-top: 20px;
        font-size: 20px;
        font-weight: 600;
        color: #e74c3c;
        text-align: right;
    }
    .confirm-btn {
        width: 100%;
        background: #3498db;
        color: white;
        padding: 15px;
        font-size: 18px;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        margin-top: 30px;
        transition: 0.3s;
    }
    .confirm-btn:hover {
        background: #2980b9;
    }
    @media(max-width:768px){
        .tour-info { flex-direction: column; align-items: center; }
        .tour-info img { margin: 0 0 20px 0; }
    }
</style>
</head>
<body>
<div class="booking-container">
    <h1>Booking for <%= tourName %></h1>

    <div class="tour-info">
        <img src="<%= tourImage %>" alt="<%= tourName %>">
        <div class="tour-details">
            <p><strong>Adult Price:</strong> <%= adultPrice %> VNĐ/person</p>
            <p><strong>Child Price:</strong> <%= childPrice %> VNĐ/child</p>
        </div>
    </div>

    <form action="<%= request.getContextPath() %>/BookingServlet" method="post">
        <input type="hidden" name="tourName" value="<%= tourName %>"/>
        <input type="hidden" name="adultPrice" value="<%= adultPrice %>"/>
        <input type="hidden" name="childPrice" value="<%= childPrice %>"/>

        <label for="name">Full Name</label>
        <input type="text" name="name" id="name" required/>

        <label for="email">Email</label>
        <input type="email" name="email" id="email" required/>

        <label for="phone">Phone Number</label>
        <input type="text" name="phone" id="phone" required/>

        <label for="numAdults">Number of Adults</label>
        <input type="number" name="numAdults" id="numAdults" min="0" value="1" required/>

        <label for="numChildren">Number of Children</label>
        <input type="number" name="numChildren" id="numChildren" min="0" value="0" required/>

        <label for="paymentMethod">Payment Method</label>
        <select name="paymentMethod" id="paymentMethod">
            <option value="COD">Cash on Delivery</option>
            <option value="ONLINE">Online Payment</option>
        </select>

        <p class="total-price">Total Price: <span id="totalPrice">0</span> VNĐ</p>

        <button type="submit" class="confirm-btn">Confirm Booking</button>
    </form>
</div>

<script>
const adultPrice = Number('<%= adultPrice %>');
const childPrice = Number('<%= childPrice %>');

function updateTotal() {
    const adults = parseInt(document.getElementById("numAdults").value) || 0;
    const children = parseInt(document.getElementById("numChildren").value) || 0;
    const total = adults * adultPrice + children * childPrice;
    document.getElementById("totalPrice").textContent = total.toLocaleString();
}
document.getElementById("numAdults").addEventListener("input", updateTotal);
document.getElementById("numChildren").addEventListener("input", updateTotal);
updateTotal();
</script>



</body>
</html>
