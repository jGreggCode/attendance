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
  let studentTable; // ✅ Declare here so it can be used globally in this block
  initEmployeeTable();

  $("#addStdentBtn").on("click", function () {
    $("#formTitle").text("Register Account");
    $("#rfid_code").val("");
    $("#user_id").val("");
    $("#first_name").val("");
    $("#middle_name").val("");
    $("#last_name").val("");
    $("#age").val("");
    $("#birthday").val("");
    $("#department").val("");
    $("#user_type").val("");
    $("#username").val("");
    $("#email").val("");
  });

  function initEmployeeTable() {
    // 🔄 If already initialized, destroy it
    if ($.fn.DataTable.isDataTable("#studentTable")) {
      $("#studentTable").DataTable().destroy();
    }

    studentTable = $("#studentTable").DataTable({
      ajax: {
        url: "../includes/api/employees.api.php",
        data: function (d) {
          d.course = $("#courses").val();
        },
        dataSrc: "data",
      },
      columns: [
        {
          data: "student_photo",
          render: function (data, type, row) {
            const photoUrl =
              data && data.trim() !== ""
                ? data
                : "../assets/User-placeholder.png";
            return `
                <div style="display: flex; justify-content: center; align-items: center;">
                  <img src="${photoUrl}" alt="Photo" 
                      style="width: 40px; object-fit: cover;">
                </div>
              `;
          },
          orderable: false,
          searchable: false,
        },
        { data: "user_id" },
        { data: "rfid_code" },
        {
          data: null,
          render: function (data, type, row) {
            return `${row.first_name} ${row.middle_name} ${row.last_name}`;
          },
        },
        { data: "email" },
        { data: "department" },
        {
          data: null,
          render: function (data, type, row) {
            return `
                <button class="action-btn btn btn-sm btn-edit" data-id="${row.rfid_code}">Edit</button>
                <button class="action-btn btn btn-sm btn-delete" data-id="${row.rfid_code}">Delete</button>
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
  }

  // Click event examples (you can handle modals or AJAX here)
  $("#studentTable").on("click", ".btn-edit", function () {
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

  $("#studentTable").on("click", ".btn-delete", function () {
    const studentId = $(this).data("id");
    if (
      confirm("Are you sure you want to delete student ID " + studentId + "?")
    ) {
      // AJAX to delete student here
    }
  });

  // 🔄 Filter table when course is selected
  $("#courses").on("change", function () {
    studentTable.ajax.reload();
  });
});
