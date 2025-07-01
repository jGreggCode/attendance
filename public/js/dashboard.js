import { setupProfileDropdownToggle } from "./utils/dropdown-logout.js";
import { addModal } from "./utils/add-modal.js";

document.addEventListener("DOMContentLoaded", () => {
  const downloadAttendanceBtn = document.getElementById("downloadAttendance");
  const downloadModal = document.getElementById("downloadModal");
  const modalContent = document.querySelector(".modal-download .modal-content");
  const closeButton = document.querySelector(".close-button");
  const downloadPdfBtn = document.getElementById("downloadPdf");
  const downloadCsvBtn = document.getElementById("downloadCsv");

  // When the "Download Attendance" button is clicked, show the modal
  downloadAttendanceBtn.addEventListener("click", () => {
    downloadModal.style.display = "block";
    modalContent.style.opacity = "1";
  });

  // When the user clicks on <span> (x), close the modal
  closeButton.addEventListener("click", () => {
    downloadModal.style.display = "none";
  });

  // When the user clicks anywhere outside of the modal content, close it
  window.addEventListener("click", (event) => {
    if (event.target == downloadModal) {
      downloadModal.style.display = "none";
    }
  });

  // Event listener for the "Download PDF" button
  downloadPdfBtn.addEventListener("click", () => {
    window.open("../includes/report/dl-attendance-pdf.php", "_blank");
  });

  // Event listener for the "Download CSV" button
  downloadCsvBtn.addEventListener("click", () => {
    window.open("../includes/report/dl-attendance.csv.php", "_blank");
  });
});

document.addEventListener("DOMContentLoaded", () => {
  setupProfileDropdownToggle();
  addModal("btnEditProfile", "editProfileModal");
});

document.addEventListener("DOMContentLoaded", () => {
  // ====== NAVIGATION ACTIVE LINK ======
  highlightCurrentNav();

  function highlightCurrentNav() {
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
  }

  // ====== GLOBAL VARIABLES ======
  const itemsPerPage = 4;
  let currentPage = 1;
  let attendanceData = [];
  let summary = [];

  document.getElementById("filterAttendance").addEventListener("click", () => {
    const startDate = document.getElementById("startDate").value;
    const endDate = document.getElementById("endDate").value;

    if (!startDate || !endDate) {
      alert("Please select both start and end dates.");
      return;
    }

    fetchAttendanceData(startDate, endDate);
  });

  // ====== FETCH ATTENDANCE DATA ======
  // Initial load (default to current month)
  const today = new Date();
  const defaultStart = new Date(today.getFullYear(), 0, 1)
    .toISOString()
    .split("T")[0];
  const defaultEnd = today.toISOString().split("T")[0];

  document.getElementById("startDate").value = defaultStart;
  document.getElementById("endDate").value = defaultEnd;
  fetchAttendanceData(defaultStart, defaultEnd);

  async function fetchAttendanceData(startDate, endDate) {
    try {
      const response = await fetch(
        `../includes/controller/fetch_attendance.contr.php?start_date=${startDate}&end_date=${endDate}`
      );
      const data = await response.json();

      attendanceData = data.attendance;
      summary = data.attendanceSum;
      renderCalendar();
    } catch (error) {
      console.error("Error fetching attendance data:", error);
    }
  }

  // ====== RENDER CALENDAR ======
  function renderCalendar() {
    const avgTimeIn = document.getElementById("avgTimeIn");
    const avgTimeOut = document.getElementById("avgTimeOut");
    const totalAttendance = document.getElementById("totalAttendance");
    const totalHours = document.getElementById("totalHours");

    const start = (currentPage - 1) * itemsPerPage;
    const end = start + itemsPerPage;
    const currentItems = attendanceData.slice(start, end);

    const calendarContainer = document.querySelector(".middle");
    calendarContainer.innerHTML = "";

    if (currentItems.length === 0) {
      calendarContainer.innerHTML = "<p>No attendance records found.</p>";
      return;
    }

    currentItems.forEach((item, index) => {
      const dateObj = new Date(item.date);
      const dayName = dateObj.toLocaleDateString("en-US", { weekday: "long" });
      const displayDate = dateObj.toLocaleDateString("en-US", {
        year: "numeric",
        month: "long",
        day: "2-digit",
      });

      const calendarItem = `
        <div class="calendar">
          <div class="calendar-title">
            <h3>${displayDate}</h3>
            <h4>${dayName}</h4>
          </div>
          <div class="calendar-schedule">
            <div>
              <div class="IN">
                <h3>IN</h3>
                <p>${convertTo12Hour(item.time_in) || "N/A"}</p>
              </div>
              <div class="OUT">
                <h3>OUT</h3>
                <p>${convertTo12Hour(item.time_out) || "N/A"}</p>
              </div>
            </div>
          </div>
          <div class="calendar-total-hours">
            <h3>${calculateHours(item.time_in, item.time_out)}</h3>
          </div>
        </div>
      `;

      calendarContainer.insertAdjacentHTML("beforeend", calendarItem);
    });

    // Display summary stats
    avgTimeIn.textContent = summary.average_time_in;
    avgTimeOut.textContent = summary.average_time_out;
    totalAttendance.textContent = summary.total_attendance;
    totalHours.textContent = summary.total_hours;
  }

  function convertTo12Hour(time) {
    if (time === null) {
      return null;
    }
    const [hours, minutes] = time.split(":");
    const h = parseInt(hours);
    const suffix = h >= 12 ? "PM" : "AM";
    const hour12 = ((h + 11) % 12) + 1;
    return `${hour12}:${minutes} ${suffix}`;
  }

  // ====== PAGINATION ======
  document.getElementById("prevBtn").addEventListener("click", () => {
    if (currentPage > 1) {
      currentPage--;
      renderCalendar();
    }
  });

  document.getElementById("nextBtn").addEventListener("click", () => {
    if (currentPage * itemsPerPage < attendanceData.length) {
      currentPage++;
      renderCalendar();
    }
  });

  // ====== CALCULATE HOURS ======
  function calculateHours(timeIn, timeOut) {
    if (
      !timeIn ||
      !timeOut ||
      timeIn === "00:00:00" ||
      timeOut === "00:00:00"
    ) {
      return "N/A";
    }

    try {
      const [inHours, inMinutes] = timeIn.split(":").map(Number);
      const [outHours, outMinutes] = timeOut.split(":").map(Number);

      const inDate = new Date(1970, 0, 1, inHours, inMinutes);
      const outDate = new Date(1970, 0, 1, outHours, outMinutes);

      const diffMs = outDate - inDate;
      if (diffMs < 0) return "N/A";

      const diffHours = diffMs / (1000 * 60 * 60);
      return diffHours < 1
        ? "Less than an hour"
        : `${diffHours.toFixed(1)} Hours`;
    } catch {
      return "N/A";
    }
  }
});
