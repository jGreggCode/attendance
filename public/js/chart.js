const colors = [
  "#3fae60", // mid green
  "#216734", // dark forest green
  "#2ed787", // mint green
  "#6fbe45", // lime green
  "#f3c911", // bright yellow
  "#a48c20", // mustard
  "#57b760", // leafy green
  "#1f4f2a", // deep pine
  "#8cd97f", // light pastel green
  "#b6c94d", // yellow-green
  "#e0a821", // gold
  "#cadb2a", // citrus green
  "#8fa42e", // olive green
  "#78d466", // soft lime
  "#5d7e1e", // army green
  "#f1dd57", // soft yellow
  "#a6d64c", // pea green
  "#4a9f3d", // jungle green
  "#2d8234", // moss green
];

$(function () {
  var barChartCategories = [];
  let barChartCategoriesValue = [];

  $.ajax({
    url: "../includes/controller/fetching_data.contr.php",
    type: "GET",
    dataType: "json",
    success: function (data) {
      console.log("AJAX Response:", data); // Log the response

      var studentCount = data.students.students_count;
      var employeeCount = data.employees.employee_count;
      var presentCount = data.present.present_today;
      var leftCount = data.left.left_today;
      var courseData = data.course;
      var topAttendingStudent = data.topAttendingStudents;

      console.log(topAttendingStudent);

      // Set Stats Values
      $("#numberOfStudents").text(studentCount);
      $("#numberOfEmployees").text(employeeCount);
      $("#numberOfPresentToday").text(presentCount);
      $("#numberOfLeftCampus").text(leftCount);

      if (courseData.length > 0) {
        courseData.forEach(function (course) {
          barChartCategories.push(course.course_ini);
          barChartCategoriesValue.push(course.student_count); // Add this line
        });

        // Populate the options
        courseData.forEach(function (course) {
          $("#courses").append(`
            <option value="${course.course_name_shorten}">
              ${course.course_ini}
            </option>
          `);
        });

        // Build chart after data is ready
        buildBarChart(barChartCategories, barChartCategoriesValue);
      }

      const topList = $(".chart-container.top-attendace-list");
      topList.empty(); // clear previous entries

      topAttendingStudent.forEach((student) => {
        const fullName = `${student.first_name} ${student.middle_name.charAt(
          0
        )}. ${student.last_name}`;
        const days = student.total_attendance;
        const image = student.profile_image || "../assets/Users/default.png"; // fallback

        const html = `
          <div class="top-attenance">
            <div class="attendance">
              <div class="attendance-left">
                <img src="${image}" width="50" alt="">
                <p>${fullName}</p>
                <span>${days} days</span>
              </div>
              <div class="attendance-right">
                <p>${days} <span>days</span></p>
              </div>
            </div>
          </div>
        `;
        topList.append(html);
      });
    },
    complete: function () {},
    error: function (xhr, status, error) {
      console.error("AJAX Error:", error);
    },
  });

  buildRadarChart();
  buildDonutChart();
  buildLineChart();
});

function buildRadarChart() {
  var radarOptions = {
    colors: colors,
    series: [
      {
        name: "This Week",
        data: [80, 50, 30, 40, 100, 20],
      },
    ],
    chart: {
      height: 330,
      width: 300,
      type: "radar",
      fontFamily: "Poppins",
      foreColor: "#ababab",
      toolbar: {
        show: false,
      },
    },
    yaxis: {
      stepSize: 20,
    },
    xaxis: {
      categories: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
    },
    legend: {
      show: false,
    },
  };
  var chart = new ApexCharts(
    document.querySelector("#radarChart"),
    radarOptions
  );
  chart.render();
}

function buildDonutChart() {
  var donutOptions = {
    colors: colors,
    series: [356, 421, 245, 200, 123, 50],
    chart: {
      height: "100%",
      width: 380,
      fontFamily: "Poppins",
      foreColor: "#ababab",
      type: "pie",
    },
    labels: [
      "First Year",
      "Second Year",
      "Third Year",
      "Fourth Year",
      "Fifth Year",
      "Sixth Year",
    ],
    legend: {
      position: "bottom",
    },
  };

  var chart = new ApexCharts(
    document.querySelector("#donutChart"),
    donutOptions
  );
  chart.render();
}

function buildLineChart() {
  var lineOptios = {
    colors: colors,
    series: [
      {
        name: "Students",
        data: [200, 156, 254, 298, 300, 299, 197, 120, 50],
      },
      {
        name: "Employee",
        data: [45, 40, 41, 45, 44, 25, 20, 10, 45],
      },
    ],
    chart: {
      height: "100%",
      width: 650,
      type: "line",
      fontFamily: "Poppins",
      foreColor: "#ababab",
      zoom: {
        enabled: false,
      },
      toolbar: {
        show: false,
      },
    },
    dataLabels: {
      enabled: false,
    },
    stroke: {
      curve: "smooth",
      width: 3,
    },
    grid: {
      xaxis: {
        lines: {
          show: true,
        },
      },
      yaxis: {
        lines: {
          show: true,
        },
      },
      borderColor: "#e2e2e2",
    },
    legend: {
      position: "top",
    },
    xaxis: {
      categories: [
        "Jan",
        "Feb",
        "Mar",
        "Apr",
        "May",
        "Jun",
        "Jul",
        "Aug",
        "Sep",
      ],
    },
  };

  var chart = new ApexCharts(document.querySelector("#lineChart"), lineOptios);
  chart.render();
}

function buildBarChart(categories, values) {
  var barOptions = {
    series: [
      {
        name: "Students",
        data: values,
      },
    ],
    chart: {
      width: 550,
      height: "100%",
      type: "bar",
      fontFamily: "Poppins",
      foreColor: "#ababab",
      toolbar: { show: false },
    },
    colors: colors,
    plotOptions: {
      bar: {
        columnWidth: "50%",
        distributed: true,
      },
    },
    dataLabels: { enabled: false },
    legend: { show: false },
    xaxis: {
      categories: categories,
      labels: {
        style: {
          colors: colors,
          fontSize: "12px",
        },
      },
    },
  };

  var chart = new ApexCharts(document.querySelector("#barChart"), barOptions);
  chart.render();
}
