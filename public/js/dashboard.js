$(function () {
  $.ajax({
    url: "../includes/fetching/fetch_courses.php", // the PHP script that fetches data
    type: "GET",
    dataType: "json",
    success: function (data) {
      if (data.length > 0) {
        data.forEach(function (course) {
          $("#courses").append(`
            <option value="${course.course_name_shorten}">
              ${course.course_ini}
            </option>
          `);
        });
      }
    },
    error: function (xhr, status, error) {
      console.error("AJAX Error:", error);
    },
  });
});
