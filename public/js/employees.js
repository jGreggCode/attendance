import { setupProfileDropdownToggle } from "./utils/dropdown-logout.js";
import { addModal } from "./utils/add-modal.js";

document.addEventListener("DOMContentLoaded", () => {
  setupProfileDropdownToggle();
  addModal("addStdentBtn", "editProfileModal");
  let studentTable;
  initEmployeeTable();

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
      "department",
      "user_type",
      "username",
      "email",
    ].forEach((id) => {
      const el = document.getElementById(id);
      if (el) el.value = "";
    });
  });

  function initEmployeeTable() {
    if (
      window.DataTable &&
      DataTable.isDataTable(document.getElementById("studentTable"))
    ) {
      studentTable.destroy();
    }

    studentTable = new DataTable("#studentTable", {
      ajax: (data, callback) => {
        const course = document.getElementById("courses").value;

        fetch(
          `../includes/api/employees.api.php?course=${encodeURIComponent(
            course
          )}`
        )
          .then((res) => res.json())
          .then((json) => callback({ data: json.data }))
          .catch((error) => {
            console.error("Fetch error:", error);
            callback({ data: [] });
          });
      },
      columns: [
        {
          data: "student_photo",
          render: (data) => {
            const photoUrl = data?.trim()
              ? data
              : "../assets/User-placeholder.png";
            return `
              <div style="display: flex; justify-content: center; align-items: center;">
                <img src="${photoUrl}" alt="Photo" style="width: 40px; object-fit: cover;">
              </div>`;
          },
          orderable: false,
          searchable: false,
        },
        { data: "user_id" },
        { data: "rfid_code" },
        {
          data: null,
          render: (data, type, row) =>
            `${row.first_name} ${row.middle_name} ${row.last_name}`,
        },
        { data: "email" },
        { data: "department" },
        {
          data: null,
          render: (data, type, row) => `
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
  }

  document
    .getElementById("studentTable")
    .addEventListener("click", async (e) => {
      const target = e.target;
      const user_id = target.dataset.id;

      if (target.classList.contains("btn-edit")) {
        try {
          const res = await fetch(
            `../includes/api/fetchInfo.php?user_id=${encodeURIComponent(
              user_id
            )}`
          );
          const json = await res.json();
          const data = json.data;

          document.getElementById("buttonSignUp").textContent = "Update";
          document.getElementById("buttonSignUp").dataset.action = "update";

          document.getElementById("editProfileModal").classList.add("show");
          document.getElementById(
            "formTitle"
          ).textContent = `Edit (${data.user_id})`;

          document.getElementById("rfid_code").value = data.rfid_code;
          document.getElementById("user_id").value = data.user_id;
          document.getElementById("first_name").value = data.first_name;
          document.getElementById("middle_name").value = data.middle_name;
          document.getElementById("last_name").value = data.last_name;
          document.getElementById("age").value = data.age;
          document.getElementById("birthday").value = data.birthday;
          document.getElementById("department").value = data.department;
          document.getElementById("user_type").value = data.user_type;
          document.getElementById("username").value = data.username;
          document.getElementById("email").value = data.email;
        } catch (err) {
          console.error("Error fetching user info:", err);
        }
      }

      if (target.classList.contains("btn-delete")) {
        if (confirm(`Are you sure you want to delete student ID ${user_id}?`)) {
          // Add fetch delete logic here if needed
          console.log("Delete logic goes here for", user_id);
        }
      }
    });

  document.getElementById("courses").addEventListener("change", () => {
    if (studentTable) {
      studentTable.ajax.reload();
    }
  });
});
