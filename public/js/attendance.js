document.addEventListener("DOMContentLoaded", () => {
  let studentTable;

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

  // Event bindings for edit/delete buttons
  document.querySelector("#studentTable").addEventListener("click", (e) => {
    const editBtn = e.target.closest(".btn-edit");
    const deleteBtn = e.target.closest(".btn-delete");

    if (editBtn) {
      const id = editBtn.dataset.id;
      console.log("Edit clicked:", id);
      // show modal logic here
    }
  });
});
