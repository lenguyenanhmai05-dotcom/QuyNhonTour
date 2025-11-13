<%@ page import="java.util.List" %>
<%@ page import="com.quynhontours.dao.TourDAO" %>
<%@ page import="com.quynhontours.model.Tour" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String userEmail = (String) session.getAttribute("userEmail");

    TourDAO dao = new TourDAO();
    List<Tour> tours = dao.getAllTours();
%>

<!doctype html>
<html lang="vi">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>QuyNhonTour - Available Tours</title>
  <link href="https://fonts.googleapis.com/css2?family=Merriweather:wght@300;700&family=Montserrat:wght@400;600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="css/tour.css">
</head>

<body>

  <jsp:include page="header.jsp" />

<main>
  <section class="hero">
    <h1>Explore & Book Your Next Adventure</h1>
    <p class="subtitle">Browse curated tours with stunning views, local guides, and flexible dates.</p>

    <p class="desc">
      <b>Quy Nhon</b> is an ideal destination with blue seas, white sands, and delicious local cuisine.
      Quy Nhon tours offer diverse experiences such as visiting <b>Ky Co – Eo Gio</b>, exploring
      <b>Hon Kho Island</b>, checking in at <b>Ghenh Rang – Tien Sa</b>, or enjoying fresh seafood in
      <b>Nhon Hai fishing village</b>. Each journey lets you fully experience the peaceful beauty and
      warm hospitality of this coastal land.
    </p>
  </section>

  <section class="tours">
    <h2>Available Tours</h2>
    <div class="tour-container">
      <%
        if (tours != null && !tours.isEmpty()) {
            int index = 1;
            for (Tour t : tours) {
      %>
        <div class="tour-card">
          <img src="<%= t.getImage() != null ? t.getImage() : "images/tour" + index + ".jpg" %>" 
               alt="<%= t.getName() %>">
          <h3><%= t.getName() %></h3>
          <p class="tour-desc"><%= t.getDescription() %></p>
          <p><b>📍 Location:</b> <%= t.getLocation() %></p>
          <p><b>🚍 Departure:</b> <%= t.getDeparture() %></p>
          <p><b>⏱ Duration:</b> <%= t.getDuration() %></p>
          <p><b>📅 Dates:</b> <%= t.getStartDate() %> → <%= t.getEndDate() %></p>

          <!-- ✅ Hiển thị 2 loại giá -->
          <div class="price-box">
            <p><b>💰 Adult Price:</b> <%= String.format("%,.0f VNĐ", t.getAdultPrice()) %></p>
            <p><b>👦 Child Price:</b> <%= String.format("%,.0f VNĐ", t.getChildPrice()) %></p>
          </div>

          <div class="tour-btns">
            <% if (t.getDetailsPage() != null && !t.getDetailsPage().isEmpty()) { %>
              <a href="<%= t.getDetailsPage() %>" class="btn details">Details</a>
            <% } else { %>
              <a href="#" class="btn details">Details</a>
            <% } %>
            <a href="AddToCartServlet?id=<%= t.getId() %>" class="btn book">Add to Cart</a>
          </div>
        </div>
      <%
            index++;
            }
        } else {
      %>
        <p class="no-tour">No tours available at the moment.</p>
      <%
        }
      %>
    </div>
  </section>
</main>

<jsp:include page="footer.jsp" />

</body>
</html>
