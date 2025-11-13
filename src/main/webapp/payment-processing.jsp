<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Processing Payment...</title>
    <style>
        body { font-family: Arial; text-align: center; margin-top: 100px; }
        .loader {
            border: 16px solid #f3f3f3;
            border-top: 16px solid #3498db;
            border-radius: 50%;
            width: 120px;
            height: 120px;
            margin: auto;
            animation: spin 2s linear infinite;
        }
        @keyframes spin { 100% { transform: rotate(360deg); } }
    </style>
    <script>
        function redirectSuccess() {
            // sau 3 giây sẽ submit form sang PaymentServlet
            setTimeout(function() {
                document.getElementById("processingForm").submit();
            }, 3000);
        }
        window.onload = redirectSuccess;
    </script>
</head>
<body>
    <h2>Processing Payment...</h2>
    <div class="loader"></div>
    <form id="processingForm" action="PaymentServlet" method="post">
        <input type="hidden" name="bookingId" value="<%= request.getParameter("bookingId") %>"/>
    </form>
</body>
</html>
