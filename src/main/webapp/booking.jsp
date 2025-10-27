<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Book Tour</title>
    <style>
        body { font-family: Arial; background: #fffaf5; text-align: center; }
        .container { margin-top: 60px; background: white; display: inline-block; padding: 30px; border-radius: 10px; box-shadow: 0 4px 10px rgba(0,0,0,0.1);}
        img { width: 300px; border-radius: 8px; }
        button { background-color: #007bff; color: white; padding: 10px 20px; border: none; border-radius: 6px; cursor: pointer; font-weight: bold;}
        button:hover { background-color: #0056b3; }
    </style>
</head>
<body>
<div class="container">
    <h2>Booking Confirmation</h2>
    <img src="${tour.image}" alt="${tour.name}">
    <h3>${tour.name}</h3>
    <p><b>Location:</b> ${tour.location}</p>
    <p><b>Departure:</b> ${tour.departure}</p>
    <p><b>Price:</b> <span style="color:green;">${tour.price} VNĐ</span></p>

    <form action="ConfirmBookingServlet" method="post">
        <input type="hidden" name="id" value="${tour.id}">
        <button type="submit">Confirm Booking</button>
    </form>
</div>
</body>
</html>
