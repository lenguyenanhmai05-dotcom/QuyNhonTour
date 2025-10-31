<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Chat với AI</title>
</head>
<body>
  <h2>Chat với AI</h2>
  <form action="ChatServlet" method="post">
    <textarea name="userMessage" rows="4" cols="50" placeholder="Nhập câu hỏi…"></textarea><br/>
    <input type="submit" value="Gửi"/>
  </form>
  
  <%
     String aiResponse = (String) request.getAttribute("aiResponse");
     if (aiResponse != null) {
  %>
     <h3>AI trả lời:</h3>
     <div style="border:1px solid #ccc;padding:10px;"><%= aiResponse %></div>
  <%
     }
  %>
</body>
</html>
