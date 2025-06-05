// === Dropdown Toggle for Profile ===
document.addEventListener("DOMContentLoaded", () => {
  const profile = document.querySelector(".profile");
  const dropdown = document.querySelector(".profileDropdown");

  if (profile && dropdown) {
    profile.addEventListener("click", (e) => {
      e.stopPropagation();
      dropdown.style.display =
        dropdown.style.display === "flex" ? "none" : "flex";
    });

    document.addEventListener("click", () => {
      dropdown.style.display = "none";
    });
  }
});

document.addEventListener("DOMContentLoaded", () => {
  const openBtn = document.getElementById("btnEditProfile");
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

// === Main jQuery Functionality ===
$(function () {
  // ====== NAVIGATION ACTIVE LINK ======
  highlightCurrentNav();

  function highlightCurrentNav() {
    const currentPage = window.location.pathname.split("/").pop();

    $(".nav-link a").each(function () {
      const linkPage = $(this).attr("href");
      $(this).toggleClass("active", linkPage === currentPage);
    });

    $(".nav-link a").on("click", function () {
      $(".nav-link a").removeClass("active");
      $(this).addClass("active");
    });
  }

  // ====== GLOBAL VARIABLES ======
  const itemsPerPage = 5;
  let currentPage = 1;
  let attendanceData = [];
  let summary = [];

  // ====== AJAX FETCH ======
  fetchAttendanceData();

  function fetchAttendanceData() {
    $.ajax({
      url: "../includes/controller/fetch_attendance.contr.php",
      method: "GET",
      dataType: "json",
      success: function (data) {
        attendanceData = data.attendance;
        summary = data.attendanceSum;
        renderCalendar();
      },
      error: function (xhr, status, error) {
        console.error("Error fetching attendance data:", error);
      },
    });
  }

  // ====== CALENDAR RENDERING ======
  function renderCalendar() {
    const avg_time_in = $("#avgTimeIn");
    const avg_time_out = $("#avgTimeOut");
    const total_attendance = $("#totalAttendance");
    const total_hours = $("#totalHours");

    const start = (currentPage - 1) * itemsPerPage;
    const end = start + itemsPerPage;
    const currentItems = attendanceData.slice(start, end);

    const $calendarContainer = $(".middle");
    $calendarContainer.empty();

    if (currentItems.length === 0) {
      $calendarContainer.html("<p>No attendance records found.</p>");
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

      $calendarContainer.append(`
        <div class="calendar">
          <div class="calendar-title">
            <h2>${start + index + 1}.</h2>
            <h3>${displayDate} | ${dayName}</h3>
          </div>

          <div class="calendar-schedule">
            <div class="IN">
              <h3>IN</h3>
              <p>${item.time_in || "N/A"}</p>
            </div>
            <div class="OUT">
              <h3>OUT</h3>
              <p>${item.time_out || "N/A"}</p>
            </div>
          </div>

          <div class="calendar-total-hours">
            <h3>${calculateHours(item.time_in, item.time_out)}</h3>
          </div>
        </div>
      `);
    });

    // Display summary stats
    avg_time_in.text(summary.average_time_in);
    avg_time_out.text(summary.average_time_out);
    total_attendance.text(summary.total_attendance);
    total_hours.text(summary.total_hours);
  }

  // ====== PAGINATION BUTTONS ======
  $("#prevBtn").on("click", function () {
    if (currentPage > 1) {
      currentPage--;
      renderCalendar();
    }
  });

  $("#nextBtn").on("click", function () {
    if (currentPage * itemsPerPage < attendanceData.length) {
      currentPage++;
      renderCalendar();
    }
  });

  // ====== HELPER: CALCULATE HOURS ======
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
