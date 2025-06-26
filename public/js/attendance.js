import { setupProfileDropdownToggle } from "./utils/dropdown-logout.js";
import { showToast } from "./utils/toast.js";

document.getElementById("addStdentBtn").addEventListener("click", async () => {
  window.open("../includes/report/dl-all-attendance-csv.php", "_blank");
});

document.addEventListener("DOMContentLoaded", () => {
  setupProfileDropdownToggle();
  let studentTable;
  // Update Attendance
  document
    .getElementById("btnUpdateAttendance")
    .addEventListener("click", async () => {
      const form = document.getElementById("editAttendance");
      const formData = new FormData(form);

      try {
        const response = await fetch("../includes/api/updateAttendance.php", {
          method: "POST",
          body: formData,
        });

        const result = await response.json();

        if (result.success) {
          showToast("Attendance updated successfully.", "success");
          document
            .getElementById("editAttendanceModal")
            .classList.remove("show");
          initStudentTable(); // refresh the datatable
        } else {
          alert("Update failed: " + (result.message || "Unknown error"));
        }
      } catch (error) {
        console.error("Update Error:", error);
        alert("An error occurred while updating.");
      }
    });

  const modal = document.getElementById("editAttendanceModal");
  const closeBtn = modal.querySelector(".close-btn");

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

  async function fetchAttendance() {
    try {
      const response = await fetch("atten.php");
      if (!response.ok) throw new Error("Failed to fetch data.");
      const result = await response.json();
      return result.data || [];
    } catch (error) {
      console.error("Fetch error:", error);
      return [];
    }
  }

  async function initStudentTable() {
    if ($.fn.DataTable.isDataTable("#studentTable")) {
      $("#studentTable").DataTable().destroy();
    }

    const data = await fetchAttendance();

    studentTable = $("#studentTable").DataTable({
      data: data,
      columns: [
        { data: "id" },
        { data: "rfid_code" },
        { data: "user_type" },
        { data: "date" },
        { data: "time_in" },
        { data: "time_out" },
        { data: "status" },
        { data: "reason" },
        {
          data: null,
          render: (row) => `
            <button class="action-btn btn btn-sm btn-edit editAttendanceBtn" data-id="${row.id}">Edit</button>
          `,
          orderable: false,
          searchable: false,
        },
      ],
      pageLength: 50,
      language: {
        searchPlaceholder: "Search attendance...",
      },
    });
  }

  // Initialize table on page load
  initStudentTable();

  // Event bindings for edit buttons
  document.querySelector("#studentTable").addEventListener("click", (e) => {
    const editBtn = e.target.closest(".btn-edit");
    if (!editBtn) return;

    const attendanceId = editBtn.dataset.id;

    fetch(
      `../includes/api/fetchAttendance.php?id=${encodeURIComponent(
        attendanceId
      )}`
    )
      .then((res) => res.json())
      .then((response) => {
        if (!response.success || !response.data) {
          console.error("No data found");
          return;
        }

        const data = response.data;

        // Show the modal
        const modal = document.getElementById("editAttendanceModal");
        modal.classList.add("show");

        // Set title
        document.getElementById("formTitle").textContent = `Edit (${
          data.id || "N/A"
        })`;

        // Populate fields
        const fieldMap = ["id", "time_in", "time_out", "reason"];
        fieldMap.forEach((field) => {
          const input = document.getElementById(field);
          if (input) input.value = data[field] || "";
        });
      })
      .catch((err) => console.error("Edit Fetch Error:", err));
  });
});
