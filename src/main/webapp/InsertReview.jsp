<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Submit Review</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen">

    <div class="bg-white p-8 rounded-lg shadow-lg w-full max-w-lg">
        <h2 class="text-3xl font-semibold text-center mb-6 text-blue-700">Leave a Review</h2>

        <form action="InsertReviewServlet" method="post" class="space-y-5">

            <!-- Hidden Rating Input -->
            <input type="hidden" name="rating" id="ratingValue" value="0">
            
              
           <input type="hidden" name="guideid" value="<%= request.getParameter("guideID") %>">
            
            <!-- Star Rating -->
            <div class="flex justify-center space-x-1 mb-2" id="starContainer">
                <span class="star text-4xl cursor-pointer text-gray-300 hover:scale-110 transition" name="rating" data-value="1">★</span>
                <span class="star text-4xl cursor-pointer text-gray-300 hover:scale-110 transition" name="rating" data-value="2">★</span>
                <span class="star text-4xl cursor-pointer text-gray-300 hover:scale-110 transition" name="rating" data-value="3">★</span>
                <span class="star text-4xl cursor-pointer text-gray-300 hover:scale-110 transition" name="rating" data-value="4">★</span>
                <span class="star text-4xl cursor-pointer text-gray-300 hover:scale-110 transition" name="rating" data-value="5">★</span>
            </div>

            <!-- Comment -->
            <textarea name="comment" rows="4" placeholder="Write your review here..." class="w-full p-3 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-500" required></textarea>

            <!-- Submit Button -->
            <button type="submit" class="w-full bg-blue-600 hover:bg-blue-700 text-white font-medium py-2.5 px-4 rounded transition duration-300">Submit Review</button>
        </form>

        <!-- Link to view reviews -->
        <div class="text-center mt-6">
            <a href="viewReviews.jsp" class="text-blue-500 hover:underline">View All Reviews</a>
        </div>
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
