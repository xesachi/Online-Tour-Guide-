<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Tour Guide</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/StyleinsertC.css">
<script type="text/javascript">
    function validateForm() {
        // Get form values
        var username = document.forms[0]["username"].value;
        var email = document.forms[0]["email"].value;
        var licenseno = document.forms[0]["licenseno"].value;
        var phoneno = document.forms[0]["phoneno"].value;
        var dob = document.forms[0]["dob"].value;
        
        // Validation check
        if (username == "") {
            alert("Name must be filled out");
            return false;
        }
        
        if (email == "") {
            alert("Email must be filled out");
            return false;
        } else if (!validateEmail(email)) {
            alert("Please enter a valid email address");
            return false;
        }
        
        if (licenseno == "") {
            alert("License number must be filled out");
            return false;
        } else if (!/^[A-Za-z0-9]{6,12}$/.test(licenseno)) {
            alert("License number should be 6-12 alphanumeric characters");
            return false;
        }
        
        if (phoneno == "") {
            alert("Phone number must be filled out");
            return false;
        } else if (!/^\d{10}$/.test(phoneno)) {
            alert("Phone number should be 10 digits");
            return false;
        }
        
        if (dob == "") {
            alert("Date of birth must be filled out");
            return false;
        }
        
        return true;
    }
    
    function validateEmail(email) {
        var re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return re.test(email);
    }
</script>
</head>
<body>

<h2>Add Tour Guide</h2>
 <form action="InsertServletC" method="post" onsubmit="return validateForm()">
      <table>
      
        <tr>
           <td>Name:</td>
           <td><input type="text" name="username" required></td>
        </tr>
        
         <tr>
           <td>Email:</td>
           <td><input type="text" name="email" required></td>
        </tr>
        
         <tr>
          <td>License no:</td>
           <td><input type="text" name="licenseno" required placeholder="6-12 alphanumeric characters"></td>
        </tr>
        
         <tr>
          <td>Phone no:</td>
           <td><input type="text" name="phoneno" required placeholder="10 digits"></td>
        </tr>
           
         <tr>
           <td>DOB:</td>
           <td><input type="date" name="dob" required></td>
        </tr>
        
         <tr>
            <td colspan="2"><input type="submit" value="Submit"></td>
        </tr>
        
      </table>
 </form>

</body>
</html>