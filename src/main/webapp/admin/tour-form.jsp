<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Add New Tour</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #e9f5ff, #ffffff);
            margin: 0;
            padding: 40px 0;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 25px;
            font-weight: 600;
            letter-spacing: 0.5px;
        }

        form {
            max-width: 700px;
            margin: auto;
            background: #fff;
            padding: 30px 40px;
            border-radius: 16px;
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        form:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.12);
        }

        label {
            display: block;
            font-weight: 500;
            margin-top: 15px;
            color: #444;
        }

        input,
        textarea,
        select {
            width: 100%;
            padding: 10px 12px;
            margin-top: 6px;
            border: 1px solid #d0d0d0;
            border-radius: 8px;
            font-size: 15px;
            transition: border-color 0.2s, box-shadow 0.2s;
        }

        input:focus,
        textarea:focus,
        select:focus {
            border-color: #007bff;
            box-shadow: 0 0 0 2px rgba(0, 123, 255, 0.15);
            outline: none;
        }

        textarea {
            min-height: 80px;
            resize: vertical;
        }

        .form-row {
            display: flex;
            gap: 20px;
        }

        .form-row .col {
            flex: 1;
        }

        .actions {
            margin-top: 25px;
            text-align: center;
        }

        button {
            background: #364ff0;
            color: white;
            border: none;
            padding: 10px 24px;
            border-radius: 8px;
            font-size: 15px;
            font-weight: 500;
            cursor: pointer;
            transition: background 0.25s ease, transform 0.1s ease;
        }

        button:hover {
            background: #218838;
            transform: translateY(-1px);
        }

        a {
            display: inline-block;
            text-decoration: none;
            color: white;
            background: #6c757d;
            padding: 10px 20px;
            border-radius: 8px;
            margin-left: 8px;
            font-size: 15px;
            transition: background 0.25s ease, transform 0.1s ease;
        }

        a:hover {
            background: #5a6268;
            transform: translateY(-1px);
        }
    </style>
</head>

<body>

    <h2>Add New Tour</h2>

    <form action="<%=request.getContextPath()%>/admin/addTour" method="post" enctype="multipart/form-data">

        <label>Name:</label>
        <input type="text" name="name" required>

        <label>Description:</label>
        <textarea name="description" required></textarea>

        <div class="form-row">
            <div class="col">
                <label>Location:</label>
                <input type="text" name="location" required>
            </div>
            <div class="col">
                <label>Departure:</label>
                <input type="text" name="departure" value="Quy Nhon" readonly>
            </div>
        </div>

        <div class="form-row">
            <div class="col">
                <label>Destination:</label>
                <input type="text" name="destination" placeholder="Hon Kho" required>
            </div>
            <div class="col">
                <label>Duration:</label>
                <select name="duration">
                    <option>1 day</option>
                    <option>2 days 1 night</option>
                    <option>3 days 2 nights</option>
                    <option>4 days 3 nights</option>
                </select>
            </div>
        </div>

        <div class="form-row">
            <div class="col">
                <label>Start Date:</label>
                <input type="date" name="startDate" required>
            </div>
            <div class="col">
                <label>End Date:</label>
                <input type="date" name="endDate" required>
            </div>
        </div>

        <div class="form-row">
            <div class="col">
                <label>Adult Price (VND):</label>
                <input type="number" step="0.01" name="adultPrice" required>
            </div>
            <div class="col">
                <label>Child Price (VND):</label>
                <input type="number" step="0.01" name="childPrice" required>
            </div>
        </div>

        <label>Upload Image:</label>
        <input type="file" name="image" accept="image/*" required>

        <div class="actions">
            <button type="submit">Save Tour</button>
            <a href="<%=request.getContextPath()%>/admin/tours">Back</a>
        </div>
    </form>

</body>

</html>
