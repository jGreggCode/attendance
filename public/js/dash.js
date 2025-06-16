// Imports
import {
  buildRadarChart,
  buildDonutChart,
  buildLineChart,
  buildBarChart,
} from "./chart.js";
import { setupProfileDropdownToggle } from "./utils/dropdown-logout.js";

document.addEventListener("DOMContentLoaded", () => {
  // Logout
  setupProfileDropdownToggle();

  const yearMap = {
    1: "First Year",
    2: "Second Year",
    3: "Third Year",
    4: "Fourth Year",
    5: "Fifth Year",
    6: "Sixth Year",
  };

  const dayMap = {
    Monday: "Mon",
    Tuesday: "Tue",
    Wednesday: "Wed",
    Thursday: "Thu",
    Friday: "Fri",
    Saturday: "Sat",
  };

  const orderedDays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];

  const fetchData = async () => {
    try {
      const res = await fetch("../includes/controller/fetching_data.contr.php");
      const data = await res.json();

      const {
        students: { students_count },
        employees: { employee_count },
        present: { present_today },
        left: { left_today },
        course,
        topAttendingStudents,
        yearLevel,
        absentsEachDay,
      } = data;

      document.getElementById("numberOfStudents").textContent = students_count;
      document.getElementById("numberOfEmployees").textContent = employee_count;
      document.getElementById("numberOfPresentToday").textContent =
        present_today;
      document.getElementById("numberOfLeftCampus").textContent = left_today;

      const barChartCategories = course.map((c) => c.course_ini);
      const barChartValues = course.map((c) => c.student_count);

      const coursesSelect = document.getElementById("courses");
      course.forEach((c) => {
        const option = document.createElement("option");
        option.value = c.course_name_shorten;
        option.textContent = c.course_ini;
        coursesSelect.appendChild(option);
      });

      buildBarChart(barChartCategories, barChartValues);

      const topList = document.querySelector(
        ".chart-container.top-attendace-list"
      );
      topList.innerHTML = "";
      topAttendingStudents.forEach((student) => {
        const fullName = `${student.first_name} ${student.middle_name.charAt(
          0
        )}. ${student.last_name}`;
        const image = student.student_photo || "../assets/User-placeholder.png";
        const div = document.createElement("div");
        div.className = "top-attenance";
        div.innerHTML = `
          <div class="attendance">
            <div class="attendance-left">
              <img src="${image}" width="50" alt="">
              <p>${fullName}</p>
              <span>${student.total_attendance} days</span>
            </div>
            <div class="attendance-right">
              <p>${student.total_attendance} <span>days</span></p>
            </div>
          </div>
        `;
        topList.appendChild(div);
      });

      const yearLabels = Object.values(yearMap);
      const yearValues = Object.keys(yearMap).map((key) => {
        const found = yearLevel.find((y) => y.year_level === key);
        return found ? parseInt(found.total) : 0;
      });

      buildDonutChart(yearLabels, yearValues);

      const absentsMap = {};
      absentsEachDay.forEach((item) => {
        absentsMap[dayMap[item.day]] = item.absent;
      });

      const chartData = orderedDays.map((day) => absentsMap[day] || 0);
      buildRadarChart(chartData);
    } catch (err) {
      console.error("Fetch Error:", err);
    }
  };

  fetchData();
  buildLineChart();
});
