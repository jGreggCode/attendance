$(function () {
  var optionsChart = {
    series: [
      {
        data: [21, 22, 10, 28, 16, 21, 13, 30, 50],
      },
    ],
    chart: {
      width: 550,
      height: 300,
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
    colors: ["#3fae60", "#216734"],
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
      categories: [
        "AB Comm",
        "AB Psych",
        "BSA",
        "BSBA",
        "BSCE",
        "BS Crim",
        ["BSHM", "BSHRM"],
        "BSIE",
        "BSIT",
        "BSMA",
        "BSMT",
        "BS Mid",
        "BSN",
        "BSPT",
        "BSTM",
        "BSEd",
        "Dentistry",
        "Others:",
        "TESDA",
      ],
      labels: {
        style: {
          colors: ["#3fae60", "#216734"],
          fontSize: "12px",
        },
      },
    },
  };

  var options = {
    colors: ["#3fae60", "#216734"],
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
      height: 300,
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

  var optionsPie = {
    colors: ["#3fae60", "#216734"],
    series: [204, 143],
    chart: {
      type: "donut",
      width: 450,
      fontFamily: "Poppins",
      foreColor: "#ababab",
    },
    plotOptions: {
      pie: {
        donut: {
          size: "40%",
        },
      },
      stroke: {
        colors: undefined,
      },
    },
    labels: ["Female", "Male"],
  };

  var optionsRadar = {
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

  var chart1 = new ApexCharts(document.querySelector("#chart1"), options);
  var chart2 = new ApexCharts(document.querySelector("#chart2"), optionsChart);
  var chart3 = new ApexCharts(document.querySelector("#pieChart"), optionsPie);
  var chart4 = new ApexCharts(
    document.querySelector("#radarChart"),
    optionsRadar
  );

  chart2.render();
  chart1.render();
  chart3.render();
  chart4.render();
});
