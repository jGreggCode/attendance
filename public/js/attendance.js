document.addEventListener("DOMContentLoaded", () => {
  let studentTable;

  async function fetchStudents(course) {
    try {
      const response = await fetch("atten.php", {
        method: "POST",
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        body: new URLSearchParams({ course }),
      });

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

    const course = document.querySelector("#courses")?.value || "";
    const data = await fetchStudents(course);

    studentTable = $("#studentTable").DataTable({
      data: data,
      columns: [
        {
          data: "student_photo",
          render: (data) => {
            const photoUrl =
              data && data.trim() !== "" ? data : "default_photo.png";
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
            <button class="action-btn btn btn-sm btn-delete" data-id="${row.rfid_code}">Delete</button>`,
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

  // Initialize on load
  initStudentTable();

  // Reload on dropdown change
  document.querySelector("#courses")?.addEventListener("change", () => {
    initStudentTable();
  });

  // Event bindings
  document.querySelector("#studentTable").addEventListener("click", (e) => {
    const editBtn = e.target.closest(".btn-edit");
    const deleteBtn = e.target.closest(".btn-delete");

    if (editBtn) {
      const id = editBtn.dataset.id;
      console.log("Edit clicked", id);
      // your modal logic here
    }

    if (deleteBtn) {
      const id = deleteBtn.dataset.id;
      console.log("Delete clicked", id);
      // your modal logic here
    }
  });
});
