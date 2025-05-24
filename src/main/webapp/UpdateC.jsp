<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/StyleupdateC.css">

</head>
<body>

<%
String id = request.getParameter("id");
String username = request.getParameter("username");
String email = request.getParameter("email");
String licenseno = request.getParameter("licenseno");
String phoneno = request.getParameter("phoneno");
String dob = request.getParameter("dob");
%>
<h2>Update Tour Guide</h2>
<form action="UpdateServletC" method="post">
      <table>
      
      <tr>
           <td>ID:</td>
           <td><input type="text" id="id" name="id" value="<%=id%>" readonly></td>
       
        </tr>
        
      
        <tr>
           <td>User Name:</td>
           <td><input type="text" id="username" name="username" value="<%=username%>" required></td>
       
        </tr>
        
         <tr>
           <td>Email:</td>
           <td><input type="text" id="email" name="email" value="<%=email%>" required></td>
        
        
        </tr>
        
         <tr>
          <td>License No:</td>
           <td><input type="text" id="licenseno" name="licenseno" value="<%=licenseno%>" required></td>
        
        </tr>
        
         <tr>
          <td>Phone no:</td>
           <td><input type="text" id="phoneno" name="phoneno" value="<%=phoneno%>" required></td>
        
        </tr>
           
          
        
         <tr>
           <td>DOB:</td>
           <td><input type="text" id="dob" name="dob" value="<%=dob%>" required></td>
        
        </tr>
        
         <tr>
           
            <td colspan="2"><input type="submit"  value="submit"></td>
        
        </tr>
        
           
      </table>

 </form>

</body>
</html>