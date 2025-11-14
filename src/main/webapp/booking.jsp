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
        background: linear-gradient(180deg, #fff8f3, #fffdfb);
        margin: 0;
        padding: 40px 0 80px;
    }

    h1 {
        text-align: center;
        color: #1e293b;
        font-size: 30px;
        font-weight: 600;
        margin-bottom: 40px;
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
        box-shadow: inset 0 0 8px rgba(0,0,0,0.05);
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        align-items: center;
    }

    .info-section img {
        width: 100%;
        max-height: 260px;
        object-fit: cover;
        border-radius: 12px;
        margin-bottom: 20px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    }

    .price-info {
        width: 100%;
        text-align: left;
        margin-bottom: 20px;
    }

    .price-info p {
        margin: 6px 0;
        font-size: 16px;
        color: #374151;
    }

    .price-info strong {
        color: #1e293b;
    }

    .total-highlight {
        text-align: right;
        font-size: 22px;
        font-weight: 700;
        color: #e11d48;
        border-top: 2px solid #eee;
        padding-top: 18px;
        width: 100%;
        letter-spacing: 0.5px;
    }

    label {
        font-weight: 600;
        display: block;
        margin: 15px 0 5px;
        color: #374151;
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
        border-color: #2563eb;
        outline: none;
        box-shadow: 0 0 4px rgba(37,99,235,0.3);
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
        background: #2563eb;
        color: #fff;
        font-size: 18px;
        cursor: pointer;
        transition: background 0.3s ease;
    }

    .counter-group button:hover {
        background: #1e40af;
    }

    .counter-group input {
        width: 60px;
        text-align: center;
        border: 1px solid #ccc;
        border-radius: 6px;
    }

    .confirm-btn {
        width: 100%;
        background: linear-gradient(135deg, #2563eb, #1d4ed8);
        color: #fff;
        padding: 14px;
        border: none;
        border-radius: 8px;
        font-size: 17px;
        font-weight: 600;
        margin-top: 30px;
        cursor: pointer;
        box-shadow: 0 6px 16px rgba(37,99,235,0.25);
        transition: 0.3s;
    }

    .confirm-btn:hover {
        background: #1e40af;
        transform: translateY(-2px);
    }

    @media(max-width: 900px){
        .booking-wrapper { flex-direction: column; }
        .total-highlight { text-align: center; font-size: 20px; }
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
                <input type="hidden" name="paymentMethod" value="ONLINE"/>

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

                <label for="startDate">Departure Date</label>
                <input type="date" name="startDate" id="startDate" required/>

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
                <p><strong>Payment Method:</strong> Online Payment 💳</p>
            </div>
            <div class="total-highlight">
                Total: <span id="totalPrice">0</span> VNĐ
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
