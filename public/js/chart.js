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

var barChartCategories = [];
var barChartData = [];

$(function () {
  $("#barChartLoading").fadeIn();
  $.ajax({
    url: "../includes/fetching/fetch_courses.php",
    type: "GET",
    dataType: "json",
    success: function (data) {
      if (data.length > 0) {
        data.forEach(function (course) {
          // Push course_ini into chartCategories
          barChartCategories.push(course.course_ini);
        });

        // Populate the options
        data.forEach(function (course) {
          $("#courses").append(`
            <option value="${course.course_name_shorten}">
              ${course.course_ini}
            </option>
          `);
        });
        console.log("chartCategories:", barChartCategories);
      }
    },
    complete: function () {
      $("#barChartLoading").fadeOut();
    },
    error: function (xhr, status, error) {
      console.error("AJAX Error:", error);
    },
  });

  var barOptions = {
    series: [
      {
        data: [
          21, 22, 10, 28, 16, 21, 13, 30, 50, 21, 22, 10, 28, 16, 21, 13, 30,
          50, 20,
        ],
      },
    ],
    chart: {
      width: 550,
      height: "100%",
      type: "bar",
      fontFamily: "Poppins",
      foreColor: "#ababab",
      events: {
        click: function (chart, w, e) {
          // console.log(chart, w, e)
        },
      },
      toolbar: {
        show: false,
      },
    },
    colors: colors,
    plotOptions: {
      bar: {
        columnWidth: "45%",
        distributed: true,
      },
    },
    dataLabels: {
      enabled: false,
    },
    legend: {
      show: false,
    },
    xaxis: {
      categories: barChartCategories,
      labels: {
        style: {
          colors: colors,
          fontSize: "12px",
        },
      },
    },
  };

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

  var attendanceReport = new ApexCharts(
    document.querySelector("#lineChart"),
    lineOptios
  );
  var studentByCourseReport = new ApexCharts(
    document.querySelector("#barChart"),
    barOptions
  );

  var genderReport = new ApexCharts(
    document.querySelector("#donutChart"),
    donutOptions
  );
  var absentReport = new ApexCharts(
    document.querySelector("#radarChart"),
    radarOptions
  );

  attendanceReport.render();
  studentByCourseReport.render();
  genderReport.render();
  absentReport.render();
});
