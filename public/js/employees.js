import { setupProfileDropdownToggle } from "./utils/dropdown-logout.js";
import { setupDynamicAge } from "./utils/dynamic-age.js";
import { addModal } from "./utils/add-modal.js";

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

  setupProfileDropdownToggle();
  addModal("addStdentBtn", "editProfileModal");
  let studentTable;
  initEmployeeTable();

  document
    .getElementById("deleteEmployees")
    .addEventListener("click", async () => {
      const confirmDelete = confirm(
        "This will export and delete employees inactive for 5+ years. Continue?"
      );
      if (!confirmDelete) return;

      try {
        // Step 1: Fetch the file as a blob
        const response = await fetch(
          "../includes/report/generate-purge-report.php"
        );
        const blob = await response.blob();

        if (blob.size <= 207) {
          return alert("There are no inactive users.");
        }
        console.log(blob);

        // Step 2: Trigger download via Blob (fully JS-controlled)
        const url = window.URL.createObjectURL(blob);
        const a = document.createElement("a");
        a.href = url;
        a.download = "purge-report.csv";
        document.body.appendChild(a);
        a.click();
        document.body.removeChild(a);
        window.URL.revokeObjectURL(url);

        // Step 3: Ask to proceed
        const confirmProceed = confirm(
          "The report has been downloaded. Proceed with deletion?"
        );
        if (!confirmProceed) return;

        // Step 4: Delete inactive employees
        const res = await fetch(
          "../includes/api/purge-inactive-employees.api.php",
          {
            method: "POST",
          }
        );
        const json = await res.json();
        alert(json.message);
        if (studentTable) studentTable.ajax.reload();
      } catch (err) {
        alert("Something went wrong.");
        console.error(err);
      }
    });

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
        fetch(`../includes/api/employees.api.php`)
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
        { data: "created_at" },
        {
          data: null,
          render: (data, type, row) => `
            <button class="action-btn btn btn-sm btn-edit" data-id="${row.rfid_code}">Edit</button>
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

  // Add this to line 120 if you want to make the particular employee deleted
  // <button class="action-btn btn btn-sm btn-delete" data-id="${row.rfid_code}">Delete</button>

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
