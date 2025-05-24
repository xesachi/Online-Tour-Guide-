<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/DisplayC.css">

</head>
<body>
<h2>Tour Guide Details</h2>

<input type="text" id="searchInput" placeholder="Search...">

<table>
    <tr>
      <th>ID</th>
      <th>User Name</th>
      <th>Email</th>
      <th>License No</th>
      <th>Phone No</th>
      <th>DOB</th>
      <th>Action</th>
      
      
    </tr>
    <c:forEach var="tourguides" items="${allGuides}">
    <tr>
        <td>${tourguides.id}</td>
        <td>${tourguides.username}</td>
        <td>${tourguides.email}</td>
        <td>${tourguides.licenseno}</td>
        <td>${tourguides.phoneno}</td>
        <td>${tourguides.dob}</td>
        
        <td>
          <a href="UpdateC.jsp?id=${tourguides.id}&username=${tourguides.username}&email=${tourguides.email}&licenseno=${tourguides.licenseno}&phoneno=${tourguides.phoneno}&dob=${tourguides.dob}">
          <button>Update</button>
          </a>
          
          <form action="DeleteServletC" method="post">
              <input type="hidden" name="id" value="${tourguides.id}">
              <button type="submit">Delete</button>
           </form>
          
          
        </td>
    
    </tr>
     </c:forEach>
</table>

<script>
function filterTable() {
    var input, filter, table, tr, td, i, j, txtValue;
    input = document.getElementById("searchInput");
    filter = input.value.toUpperCase();
    table = document.querySelector("table");
    tr = table.getElementsByTagName("tr");

    for (i = 1; i < tr.length; i++) { 
        td = tr[i].getElementsByTagName("td");
        let rowMatches = false;

        for (j = 0; j < td.length; j++) {
            if (td[j]) {
                txtValue = td[j].textContent || td[j].innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    rowMatches = true;
                    break;
                }
            }
        }

        tr[i].style.display = rowMatches ? "" : "none";
    }
}

// add the event listener

document.getElementById("searchInput").addEventListener("input", filterTable);
</script>


</body>
</html>