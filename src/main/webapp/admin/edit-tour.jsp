<%@ page import="com.quynhontours.model.Tour" %>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <% Tour tour=(Tour) request.getAttribute("tour"); if (tour==null) {
            response.sendRedirect(request.getContextPath() + "/admin/tours" ); return; } %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>Edit Tour</title>
                <style>
                    body {
                        font-family: Arial, sans-serif;
                        background: #f4f4f4;
                        margin: 40px;
                    }

                    h2 {
                        text-align: center;
                    }

                    form {
                        max-width: 600px;
                        margin: auto;
                        background: white;
                        padding: 20px;
                        border-radius: 8px;
                        box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
                    }

                    label {
                        display: block;
                        margin-top: 10px;
                    }

                    input,
                    textarea,
                    select {
                        width: 100%;
                        padding: 8px;
                        margin-top: 5px;
                        border: 1px solid #ccc;
                        border-radius: 4px;
                    }

                    button {
                        background: #007bff;
                        color: white;
                        border: none;
                        margin-top: 15px;
                        padding: 10px 20px;
                        border-radius: 4px;
                        cursor: pointer;
                    }

                    button:hover {
                        background: #0056b3;
                    }

                    a {
                        text-decoration: none;
                        color: white;
                        background: #6c757d;
                        padding: 8px 15px;
                        border-radius: 4px;
                        margin-left: 10px;
                    }

                    a:hover {
                        background: #5a6268;
                    }
                </style>
            </head>

            <body>

                <h2>Edit Tour</h2>

                <form action="<%=request.getContextPath()%>/admin/updateTour" method="post">
                    <input type="hidden" name="id" value="<%=tour.getId()%>">

                    <label>Name:</label>
                    <input type="text" name="name" value="<%=tour.getName()%>" required>

                    <label>Description:</label>
                    <textarea name="description" rows="3" required><%=tour.getDescription()%></textarea>

                    <label>Location:</label>
                    <input type="text" name="location" value="<%=tour.getLocation()%>" required>

                    <label>Departure:</label>
                    <input type="text" name="departure" value="Quy Nhon" readonly>

                    <label>Destination:</label>
                    <input type="text" name="destination" value="<%=tour.getDestination()%>" required>

                    <label>Tour duration:</label>
                    <select name="duration">
                        <option>1 day</option>
                        <option>2 days 1 night</option>
                        <option>3 days 2 nights</option>
                        <option>4 days 3 nights</option>
                    </select>

                    <label>Adult Price (VND):</label>
                    <input type="number" name="adultPrice" step="0.01" value="<%=tour.getAdultPrice()%>" required>

                    <label>Child Price (VND):</label>
                    <input type="number" name="childPrice" step="0.01" value="<%=tour.getChildPrice()%>" required>

                    <label>Start Date:</label>
                    <input type="date" name="startDate" value="<%=tour.getStartDate()%>" required>

                    <label>End Date:</label>
                    <input type="date" name="endDate" value="<%=tour.getEndDate()%>" required>

                    <label>Image URL:</label>
                    <input type="text" name="image" value="<%=tour.getImage()%>" required>

                    <button type="submit">Update Tour</button>
                    <a href="<%=request.getContextPath()%>/admin/tours">Cancel</a>
                </form>

            </body>

            </html>