<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Tour</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f4f4f4; margin: 40px; }
        form {
            max-width: 600px; margin: auto; background: white; padding: 20px;
            border-radius: 8px; box-shadow: 0 0 5px rgba(0,0,0,0.2);
        }
        label { display: block; margin-top: 10px; }
        input, textarea, select {
            width: 100%; padding: 8px; margin-top: 5px;
            border: 1px solid #ccc; border-radius: 4px;
        }
        button {
            background: #28a745; color: white; border: none;
            margin-top: 15px; padding: 10px 20px; border-radius: 4px; cursor: pointer;
        }
        button:hover { background: #218838; }
        a {
            text-decoration: none; color: white; background: #6c757d;
            padding: 8px 15px; border-radius: 4px;
        }
        a:hover { background: #5a6268; }
    </style>
</head>
<body>

<h2 style="text-align:center;">Add New Tour</h2>

<form action="<%=request.getContextPath()%>/admin/addTour" method="post">
    <label>Name:</label>
    <input type="text" name="name" required>

    <label>Description:</label>
    <textarea name="description" required></textarea>

    <label>Location:</label>
    <input type="text" name="location" required>

    <label>Departure:</label>
    <input type="text" name="departure" value="Quy Nhon" readonly>

    <label>Destination:</label>
    <input type="text" name="destination" placeholder="Hon Kho" required>

    <label>Duration:</label>
    <select name="duration">
        <option>1 day</option>
        <option>2 days 1 night</option>
        <option>3 days 2 nights</option>
        <option>4 days 3 nights</option>
    </select>

    <label>Start Date:</label>
    <input type="date" name="startDate" required>

    <label>End Date:</label>
    <input type="date" name="endDate" required>

    <label>Adult Price (VND):</label>
    <input type="number" step="0.01" name="adultPrice" required>

    <label>Child Price (VND):</label>
    <input type="number" step="0.01" name="childPrice" required>

    <label>Image URL:</label>
    <input type="text" name="image" required>

    <button type="submit">Save Tour</button>
    <a href="<%=request.getContextPath()%>/admin/tours">Back</a>
</form>

</body>
</html>
