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
        {
          data: null,
          render: function (data, type, row) {
            return `
              <button class="edit-btn btn btn-sm btn-warning" data-id="${row.rfid_code}">Edit</button>
              <button class="delete-btn btn btn-sm btn-danger" data-id="${row.rfid_code}">Delete</button>
            `;
          },
          orderable: false,
          searchable: false,
        },
      ],
      pageLength: 10,
      language: {
        searchPlaceholder: "Search students...",
      },
    });

    // Click event examples (you can handle modals or AJAX here)
    $("#studentTable").on("click", ".edit-btn", function () {
      const studentId = $(this).data("id");
      alert("Edit student ID: " + studentId);
      // Open modal and load student data here
    });

    $("#studentTable").on("click", ".delete-btn", function () {
      const studentId = $(this).data("id");
      if (
        confirm("Are you sure you want to delete student ID " + studentId + "?")
      ) {
        // AJAX to delete student here
      }
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
