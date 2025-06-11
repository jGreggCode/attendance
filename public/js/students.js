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
  $("#addStdentBtn").on("click", function () {
    $("#formTitle").text("Register Account");
    $("#rfid_code").val("");
    $("#user_id").val("");
    $("#first_name").val("");
    $("#middle_name").val("");
    $("#last_name").val("");
    $("#age").val("");
    $("#birthday").val("");
    $("#course").val("");
    $("#year_level").val("");
    $("#department").val("");
    $("#user_type").val("");
    $("#username").val("");
    $("#email").val("");
  });

  var rfid_code = $("#rfid_code").val();
  var user_id = $("#user_id").val();
  var first_name = $("#first_name").val();
  var middle_name = $("#middle_name").val();
  var last_name = $("#last_name").val();
  var age = $("#age").val();
  var birthday = $("#birthday").val();
  var course = $("#course").val();
  var year_level = $("#year_level").val();
  var department = $("#department").val();
  var user_type = $("#user_type").val();
  var username = $("#username").val();
  var email = $("#email").val();

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
      pageLength: 5,
      language: {
        searchPlaceholder: "Search students...",
      },
    });

    // Click event examples (you can handle modals or AJAX here)
    $("#studentTable").on("click", ".edit-btn", function () {
      const user_id = $(this).data("id");
      $("#buttonSignUp").text("Update");
      // ✅ Set action to "update"
      $("#buttonSignUp").data("action", "update");
      console.log("Action set to:", $("#buttonSignUp").data("action")); // Check it's set

      $.ajax({
        url: "../includes/api/fetchInfo.php",
        method: "GET",
        data: {
          user_id: user_id,
        },
        dataType: "json",
        success: function (data) {
          console.log("AJAX Response:", data); // Log the response
          data = data.data;

          $("#editProfileModal").addClass("show");
          $("#formTitle").text("Edit (" + data.user_id + ")");

          $("#rfid_code").val(data.rfid_code);
          $("#user_id").val(data.user_id);
          $("#first_name").val(data.first_name);
          $("#middle_name").val(data.middle_name);
          $("#last_name").val(data.last_name);
          $("#age").val(data.age);
          $("#birthday").val(data.birthday);
          $("#course").val(data.course);
          $("#year_level").val(data.year_level);
          $("#department").val(data.department);
          $("#user_type").val(data.user_type);
          $("#username").val(data.username);
          $("#email").val(data.email);
        },
        error: function (jqXHR, textStatus, errorThrown) {
          console.error("AJAX Error: ", textStatus, errorThrown); // Log any errors
        },
        complete: function () {},
      });
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
