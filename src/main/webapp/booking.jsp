<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String tourName = request.getParameter("tourName");
    String tourImage = request.getParameter("tourImage");
    int adultPrice = 0, childPrice = 0;

    try {
        adultPrice = Integer.parseInt(request.getParameter("adultPrice"));
        childPrice = Integer.parseInt(request.getParameter("childPrice"));
    } catch (Exception e) {
        adultPrice = childPrice = 0;
    }

    if (tourName == null || tourName.isEmpty()) {
        out.println("<h2 style='color:red;text-align:center;'>❌ Missing tour info. Please return to Cart.</h2>");
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
        background: linear-gradient(135deg, #fdf6f0, #f9f9f9);
        margin: 0;
        padding: 40px 0;
    }

    .booking-wrapper {
        max-width: 1100px;
        margin: auto;
        display: flex;
        gap: 40px;
        background: #fff;
        border-radius: 16px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.08);
        padding: 40px;
        flex-wrap: wrap;
    }

    .form-section {
        flex: 1.2;
        min-width: 320px;
    }

    .info-section {
        flex: 0.8;
        background: #fafafa;
        border-radius: 12px;
        padding: 25px;
        text-align: center;
        box-shadow: inset 0 0 8px rgba(0,0,0,0.05);
    }

    .info-section img {
        width: 100%;
        max-height: 250px;
        object-fit: cover;
        border-radius: 12px;
        margin-bottom: 20px;
        box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    }

    h1 {
        text-align: center;
        color: #2c3e50;
        font-size: 28px;
        font-weight: 600;
        margin-bottom: 35px;
    }

    label {
        font-weight: 600;
        display: block;
        margin: 15px 0 5px;
        color: #34495e;
    }

    input, select {
        width: 100%;
        padding: 10px 12px;
        border: 1px solid #ccc;
        border-radius: 8px;
        font-size: 15px;
        transition: 0.2s ease;
    }

    input:focus, select:focus {
        border-color: #3498db;
        outline: none;
        box-shadow: 0 0 4px rgba(52,152,219,0.3);
    }

    .counter-group {
        display: flex;
        align-items: center;
        gap: 10px;
        margin-top: 5px;
    }

    .counter-group button {
        width: 32px;
        height: 32px;
        border-radius: 50%;
        border: none;
        background: #3498db;
        color: #fff;
        font-size: 18px;
        cursor: pointer;
        transition: background 0.3s ease;
    }

    .counter-group button:hover {
        background: #2179c8;
    }

    .counter-group input {
        width: 60px;
        text-align: center;
    }

    .total-price {
        font-size: 18px;
        font-weight: 600;
        color: #e74c3c;
        margin-top: 25px;
        text-align: right;
    }

    .confirm-btn {
        width: 100%;
        background: #3498db;
        color: #fff;
        padding: 14px;
        border: none;
        border-radius: 8px;
        font-size: 17px;
        font-weight: 600;
        margin-top: 30px;
        cursor: pointer;
        transition: 0.3s;
    }

    .confirm-btn:hover {
        background: #2179c8;
    }

    .price-info p {
        margin: 8px 0;
        font-size: 16px;
    }

    .price-info strong {
        color: #2c3e50;
    }

    @media(max-width: 900px){
        .booking-wrapper { flex-direction: column; }
    }
</style>
</head>

<body>
    <h1>Booking for <%= tourName %></h1>
    <div class="booking-wrapper">
        <!-- LEFT FORM -->
        <div class="form-section">
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

                <label>Number of Adults</label>
                <div class="counter-group">
                    <button type="button" onclick="changeCount('numAdults', -1)">-</button>
                    <input type="text" name="numAdults" id="numAdults" value="1" readonly/>
                    <button type="button" onclick="changeCount('numAdults', 1)">+</button>
                </div>

                <label>Number of Children</label>
                <div class="counter-group">
                    <button type="button" onclick="changeCount('numChildren', -1)">-</button>
                    <input type="text" name="numChildren" id="numChildren" value="0" readonly/>
                    <button type="button" onclick="changeCount('numChildren', 1)">+</button>
                </div>

                <label for="paymentMethod">Payment Method</label>
                <select name="paymentMethod" id="paymentMethod">
                    <option value="COD">Cash on Delivery</option>
                    <option value="ONLINE">Online Payment</option>
                </select>

                <p class="total-price">Total: <span id="totalPrice">0</span> VNĐ</p>
                <button type="submit" class="confirm-btn">Confirm Booking</button>
            </form>
        </div>

        <!-- RIGHT INFO -->
        <div class="info-section">
            <img src="<%= tourImage %>" alt="<%= tourName %>">
            <div class="price-info">
                <p><strong>Tour:</strong> <%= tourName %></p>
                <p><strong>Adult Price:</strong> <%= String.format("%,d", adultPrice) %> VNĐ / person</p>
                <p><strong>Child Price:</strong> <%= String.format("%,d", childPrice) %> VNĐ / child</p>
            </div>
        </div>
    </div>

<script>
const adultPrice = Number('<%= adultPrice %>');
const childPrice = Number('<%= childPrice %>');

function changeCount(id, delta) {
    const input = document.getElementById(id);
    let value = parseInt(input.value) + delta;
    if (value < 0) value = 0;
    input.value = value;
    updateTotal();
}

function updateTotal() {
    const adults = parseInt(document.getElementById("numAdults").value) || 0;
    const children = parseInt(document.getElementById("numChildren").value) || 0;
    const total = adults * adultPrice + children * childPrice;
    document.getElementById("totalPrice").textContent = total.toLocaleString();
}

updateTotal();
</script>
</body>
</html>
