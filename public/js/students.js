import { setupProfileDropdownToggle } from "./utils/dropdown-logout.js";
import { setupDynamicAge } from "./utils/dynamic-age.js";
import { addModal } from "./utils/add-modal.js";

// Clear when search exceed 10
document.addEventListener("DOMContentLoaded", () => {
  const interval = setInterval(() => {
    const searchInput = document.querySelector("div.dataTables_filter input");
    if (searchInput) {
      clearInterval(interval);

      searchInput.addEventListener("input", (e) => {
        const val = e.target.value;

        if (val.length > 10) {
          // Get the last character typed (11th key)
          const newChar = val.slice(-1);

          // Replace the entire input with only the latest key
          e.target.value = newChar;

          // Retrigger DataTable filtering
          const event = new Event("input", { bubbles: true });
          e.target.dispatchEvent(event);
        }
      });
    }
  }, 100);
});

document.addEventListener("DOMContentLoaded", () => {
  setupDynamicAge("birthday", "age");
  const currentPage = window.location.pathname.split("/").pop();
  const navLinks = document.querySelectorAll(".nav-link a");

  navLinks.forEach((link) => {
    const linkPage = link.getAttribute("href");
    link.classList.toggle("active", linkPage === currentPage);

    link.addEventListener("click", () => {
      navLinks.forEach((l) => l.classList.remove("active"));
      link.classList.add("active");
    });
  });

  setupProfileDropdownToggle();
  addModal("addStdentBtn", "editProfileModal");

  let studentTable;
  const coursesSelect = document.getElementById("courses");
  const editCourses = document.getElementById("course");

  // Fetch and populate courses
  fetch("../includes/controller/fetching_data.contr.php")
    .then((res) => res.json())
    .then((data) => {
      console.log("Fetch Response:", data);

      const courseData = data.course;
      if (courseData && courseData.length > 0) {
        courseData.forEach((course) => {
          // Create an option for the first select box
          const option1 = document.createElement("option");
          option1.value = course.course_name_shorten;
          option1.textContent = course.course_ini;
          coursesSelect.appendChild(option1);

          // Create another option for the second select box
          const option2 = document.createElement("option");
          option2.value = course.course_name_shorten;
          option2.textContent = course.course_name_shorten;
          editCourses.appendChild(option2);
        });
      }

      initStudentTable();
    })
    .catch((err) => console.error("Fetch Error:", err));

  // Clear form on Add button click
  document.getElementById("addStdentBtn").addEventListener("click", () => {
    document.getElementById("formTitle").textContent = "Register Account";
    [
      "rfid_code",
      "user_id",
      "first_name",
      "middle_name",
      "last_name",
      "age",
      "birthday",
      "course",
      "year_level",
      "department",
      "user_type",
      "username",
      "email",
    ].forEach((id) => (document.getElementById(id).value = ""));
  });

  function initStudentTable() {
    if (
      window.DataTable &&
      DataTable.instances &&
      DataTable.instances.length > 0
    ) {
      DataTable.instances.forEach((dt) => dt.destroy());
    }

    studentTable = new DataTable("#studentTable", {
      ajax: (d, callback) => {
        const course = coursesSelect.value;
        fetch(`student.php?course=${encodeURIComponent(course)}`)
          .then((res) => res.json())
          .then((json) => callback({ data: json.data }))
          .catch((err) => console.error("Student Table Fetch Error:", err));
      },
      columns: [
        {
          data: "student_photo",
          render: (data) => {
            const photoUrl =
              data && data.trim() !== "" ? data : "default_photo.png";
            return `
              <div style="display: flex; justify-content: center; align-items: center;">
                <img src="${photoUrl}" alt="Photo" style="width: 40px; object-fit: cover;">
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
          render: (row) =>
            `${row.first_name} ${row.middle_name} ${row.last_name}`,
        },
        { data: "email" },
        { data: "course" },
        { data: "academic_year" },
        { data: "semester" },
        { data: "year_level" },
        {
          data: null,
          render: (row) => `
            <button class="action-btn btn btn-sm btn-edit" data-id="${row.rfid_code}">Edit</button>
            <button class="action-btn btn btn-sm btn-delete" data-id="${row.rfid_code}">Delete</button>
          `,
          orderable: false,
          searchable: false,
        },
      ],
      pageLength: 10,
      language: {
        searchPlaceholder: "Search students...",
      },
    });

    // Reload on course change
    coursesSelect.addEventListener("change", () => {
      studentTable.ajax.reload();
    });
  }

  // Edit button handler
  document.getElementById("studentTable").addEventListener("click", (e) => {
    if (e.target.classList.contains("btn-edit")) {
      const userId = e.target.dataset.id;
      const buttonSignUp = document.getElementById("buttonSignUp");
      buttonSignUp.textContent = "Update";
      buttonSignUp.dataset.action = "update";
      console.log("Action set to:", buttonSignUp.dataset.action);

      fetch(
        `../includes/api/fetchInfo.php?user_id=${encodeURIComponent(userId)}`
      )
        .then((res) => res.json())
        .then((response) => {
          const data = response.data;
          document.getElementById("editProfileModal").classList.add("show");
          document.getElementById(
            "formTitle"
          ).textContent = `Edit (${data.user_id})`;

          const fields = [
            "rfid_code",
            "user_id",
            "first_name",
            "middle_name",
            "last_name",
            "age",
            "birthday",
            "course",
            "year_level",
            "department",
            "user_type",
            "username",
            "email",
          ];
          fields.forEach((id) => {
            const input = document.getElementById(id);
            if (input) input.value = data[id] || "";
          });
        })
        .catch((err) => console.error("Edit Fetch Error:", err));
    }

    if (e.target.classList.contains("btn-delete")) {
      const studentId = e.target.dataset.id;
      if (confirm(`Are you sure you want to delete student ID ${studentId}?`)) {
        // Add fetch delete logic here
        console.log("Delete triggered for:", studentId);
      }
    }
  });
});
