document.addEventListener("DOMContentLoaded", () => {
  const openBtn = document.getElementById("addStdentBtn");
  const modal = document.getElementById("editProfileModal");
  const closeBtn = modal.querySelector(".close-btn");

  // Open modal
  openBtn.addEventListener("click", () => {
    modal.classList.add("show");
  });

  // Close modal via X
  closeBtn.addEventListener("click", () => {
    modal.classList.remove("show");
  });

  // Close when clicking outside modal-content
  window.addEventListener("click", (e) => {
    if (e.target === modal) {
      modal.classList.remove("show");
    }
  });

  // Optional: close with ESC key
  document.addEventListener("keydown", (e) => {
    if (e.key === "Escape") {
      modal.classList.remove("show");
    }
  });
});

$(function () {
  $(document).ready(function () {
    $("#studentTable").DataTable({
      ajax: {
        url: "student.php",
        dataSrc: "data",
      },
      columns: [
        { data: "id" },
        { data: "first_name" },
        { data: "rfid_code" },
        { data: "email" },
      ],
      pageLength: 5,
      language: {
        searchPlaceholder: "Search students...",
      },
    });
  });

  $.ajax({
    url: "../includes/controller/fetching_data.contr.php",
    type: "GET",
    dataType: "json",
    success: function (data) {
      console.log("AJAX Response:", data); // Log the response

      var courseData = data.course;

      if (courseData.length > 0) {
        // Populate the options
        courseData.forEach(function (course) {
          $("#courses").append(`
            <option value="${course.course_name_shorten}">
              ${course.course_ini}
            </option>
          `);
        });
      }
    },
    complete: function () {},
    error: function (xhr, status, error) {
      console.error("AJAX Error:", error);
    },
  });
});
