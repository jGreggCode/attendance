// chart.js
const colors = [
  "#3fae60",
  "#216734",
  "#2ed787",
  "#6fbe45",
  "#f3c911",
  "#a48c20",
  "#57b760",
  "#1f4f2a",
  "#8cd97f",
  "#b6c94d",
  "#e0a821",
  "#cadb2a",
  "#8fa42e",
  "#78d466",
  "#5d7e1e",
  "#f1dd57",
  "#a6d64c",
  "#4a9f3d",
  "#2d8234",
];

export function buildRadarChart(seriesData, container = "#radarChart") {
  new ApexCharts(document.querySelector(container), {
    colors,
    series: [{ name: "This Week", data: seriesData }],
    chart: {
      height: "100%",
      width: 300,
      type: "radar",
      fontFamily: "Poppins",
      foreColor: "#ababab",
      toolbar: { show: false },
    },
    yaxis: { stepSize: 20 },
    xaxis: { categories: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat"] },
    legend: { show: false },
  }).render();
}

export function buildDonutChart(labels, series, container = "#donutChart") {
  new ApexCharts(document.querySelector(container), {
    colors,
    series,
    chart: {
      height: "100%",
      width: 380,
      fontFamily: "Poppins",
      foreColor: "#ababab",
      type: "pie",
    },
    labels,
    legend: { position: "bottom" },
  }).render();
}

export function buildLineChart(container = "#lineChart") {
  new ApexCharts(document.querySelector(container), {
    colors,
    series: [
      { name: "Students", data: [200, 156, 254, 298, 300, 299, 197, 120, 50] },
      { name: "Employee", data: [45, 40, 41, 45, 44, 25, 20, 10, 45] },
    ],
    chart: {
      height: "100%",
      width: 650,
      type: "line",
      fontFamily: "Poppins",
      foreColor: "#ababab",
      zoom: { enabled: false },
      toolbar: { show: false },
    },
    dataLabels: { enabled: false },
    stroke: { curve: "smooth", width: 3 },
    grid: {
      xaxis: { lines: { show: true } },
      yaxis: { lines: { show: true } },
      borderColor: "#e2e2e2",
    },
    legend: { position: "top" },
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
  }).render();
}

export function buildBarChart(categories, values, container = "#barChart") {
  new ApexCharts(document.querySelector(container), {
    colors,
    series: [{ name: "Students", data: values }],
    chart: {
      width: 550,
      height: "100%",
      type: "bar",
      fontFamily: "Poppins",
      foreColor: "#ababab",
      toolbar: { show: false },
    },
    plotOptions: {
      bar: {
        columnWidth: "50%",
        distributed: true,
      },
    },
    dataLabels: { enabled: false },
    legend: { show: false },
    xaxis: {
      categories,
      labels: {
        style: {
          colors,
          fontSize: "12px",
        },
      },
    },
  }).render();
}
