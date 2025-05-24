<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Review List - Tour Panel</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen flex flex-col">

  <!-- Main Layout -->
  <main class="flex-1 p-6 space-y-10">
    <section>
      <div class="flex justify-between items-center mb-6">
        <h2 class="text-2xl font-bold text-gray-800">Tourist Reviews</h2>
      </div>

      <c:if test="${not empty review}">
        <div class="overflow-x-auto bg-white rounded-lg shadow-md">
          <table class="min-w-full table-auto">
            <thead class="bg-gray-200 text-gray-700">
              <tr>
                <th class="px-6 py-3 text-left font-medium">Review ID</th>
                <th class="px-6 py-3 text-left font-medium">Tourist ID</th>
                <th class="px-6 py-3 text-left font-medium">Guide ID</th>
                <th class="px-6 py-3 text-left font-medium">Rating</th>
                <th class="px-6 py-3 text-left font-medium">Comment</th>
                <th class="px-6 py-3 text-left font-medium">Action</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="r" items="${review}">
                <tr class="border-b hover:bg-gray-100">
                  <td class="px-6 py-4">${r.reviewID}</td>
                  <td class="px-6 py-4">${r.touristID}</td>
                  <td class="px-6 py-4">${r.guideID}</td>
                  <td class="px-6 py-4">${r.rating}</td>
                  <td class="px-6 py-4">${r.comment}</td>
                  <td class="px-6 py-4 space-x-2">
                    <a href="UpdateReviewServlet?id=${r.reviewID}"
                       class="inline-block bg-blue-500 hover:bg-blue-600 text-white text-sm font-medium py-1 px-3 rounded">
                      Edit
                    </a>
                    <a href="DeleteReviewServlet?id=${r.reviewID}"
                       class="inline-block bg-red-500 hover:bg-red-600 text-white text-sm font-medium py-1 px-3 rounded"
                       onclick="return confirm('Are you sure you want to delete this review?');">
                      Delete
                    </a>
                  </td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </c:if>

      <c:if test="${empty review}">
        <p class="text-gray-500">No reviews found.</p>
      </c:if>
    </section>
  </main>

  <!-- Footer 
  <footer class="bg-white shadow mt-auto py-4 text-center text-sm text-gray-500">
    &copy; 2025 TourReviews.lk - All rights reserved.
  </footer>-->

</body>
</html>
