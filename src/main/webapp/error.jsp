<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>
</head>
<body>
    <h2 style="color:red;">An error occurred!</h2>
    <p>
        <% 
            String msg = request.getParameter("message");
            if (msg != null) { 
        %>
            <b><%= msg %></b>
        <% 
            } else { 
        %>
            Something went wrong. Please try again.
        <% 
            } 
        %>
    </p>
    <a href="index.jsp">Go Home</a>
</body>
</html>