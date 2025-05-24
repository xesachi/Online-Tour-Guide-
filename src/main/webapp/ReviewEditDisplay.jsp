<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Update Review</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen">

  <div class="bg-white p-8 rounded shadow-lg w-full max-w-lg">
    <h2 class="text-3xl font-semibold text-center mb-6 text-blue-700">Update Review</h2>

    <form action="UpdateReviewServlet" method="post" class="space-y-5">

      <!-- Hidden fields -->
      <input type="hidden" name="reviewID" value="${review.reviewID}">
      <input type="hidden" id="ratingValue" name="rating" value="${review.rating}">

      <!-- Star Rating UI -->
      <div class="flex justify-center space-x-1 mb-4" id="starContainer">
        <c:forEach begin="1" end="5" var="i">
          <span class="star text-4xl cursor-pointer ${i <= review.rating ? 'text-yellow-400' : 'text-gray-300'} transition" data-value="${i}">★</span>
        </c:forEach>
      </div>

      <!-- Comment -->
      <textarea name="comment" rows="4" class="w-full p-3 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-500" required>${review.comment}</textarea>

      <!-- Submit -->
      <button type="submit" class="w-full bg-green-600 hover:bg-green-700 text-white font-medium py-2.5 px-4 rounded transition">
        Save Changes
      </button>

      <!-- Back Link -->
      <div class="text-center mt-4">
        <a href="DisplayReviewServlet" class="text-blue-500 hover:underline">Back to Reviews</a>
      </div>
    </form>
  </div>

  <script>
    const stars = document.querySelectorAll('.star');
    const ratingValue = document.getElementById('ratingValue');

    stars.forEach(star => {
      star.addEventListener('click', () => {
        const rating = parseInt(star.dataset.value);
        ratingValue.value = rating;

        stars.forEach(s => {
          s.classList.remove('text-yellow-400');
          s.classList.add('text-gray-300');
        });

        for (let i = 0; i < rating; i++) {
          stars[i].classList.remove('text-gray-300');
          stars[i].classList.add('text-yellow-400');
        }
      });
    });
  </script>
</body>
</html>
