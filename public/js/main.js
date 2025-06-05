// Fix the animation for multiple requests
let hideTimeout;
let hideAnimateTimeout;

$(function () {
  const liveTimeElement = document.getElementById("liveTime");

  // Just in case the element doesn't exist
  if (!liveTimeElement) {
    console.error("Element with ID 'liveTime' not found.");
    return;
  }

  focusInput();

  // Listen to register button
  $("#rfid_input").on("input", function () {
    rfidScan();
  });

  // Initial call and repeat every second
  // Live clock
  updateLiveTime(liveTimeElement);
  setInterval(() => updateLiveTime(liveTimeElement), 1000);
});

function updateLiveTime(liveTimeElement) {
  const now = new Date();

  const options = {
    weekday: "long",
    year: "numeric",
    month: "long",
    day: "numeric",
  };

  const date = now.toLocaleDateString("en-US", options);
  const time = now.toLocaleTimeString("en-US", {
    hour: "numeric",
    minute: "2-digit",
    second: "2-digit",
    hour12: true,
  });

  liveTimeElement.textContent = `${date} - ${time}`;
}

function focusInput() {
  const input = document.getElementById("rfid_input");
  input.focus();
  // Make sure it keeps focus
  setInterval(() => input.focus(), 1000);
  // Uncomment when plugging the RFID reader
  //setInterval(() => (input.value = ""), 3000);
}

function rfidScan() {
  const input = document.getElementById("rfid_input");
  if (input.value.length === 10) {
    // Adjust based on RFID UID length
    //input.form.submit();
    tapUser();
  }
}

function tapUser() {
  var rfid = $("#rfid_input").val().trim();

  // Section for user information
  var sectionUserInformation = $("#sectionUserInformation");

  // INFO
  var userFullName = $("#userFullName");
  var userType = $("#userType");
  var userCourseAndYear = $("#userCourseAndYear");
  var tapMessage = $("#tap-message");
  var attendanceMessage = $("#attendanceMessage");
  var dateToday = $("#dateToday");
  var timeNow = $("#timeNow");

  // Clear previous timeouts
  clearTimeout(hideTimeout);
  clearTimeout(hideAnimateTimeout);

  $.ajax({
    url: "../includes/controller/attendance.contr.php",
    method: "POST",
    data: { rfid_code: rfid },
    success: function (response) {
      var result = JSON.parse(response);

      $("#rfid_input").val("").focus();
      dateToday.html(
        new Date().toLocaleDateString("en-US", {
          weekday: "long",
          year: "numeric",
          month: "long",
          day: "numeric",
        })
      );

      if (result.status === "error") {
        $("#errorMessage").html(result.message).fadeIn();
        setTimeout(function () {
          $("#errorMessage").fadeOut();
        }, 3000);
        sectionUserInformation
          .removeClass("visible animate animate-out")
          .addClass("hidden");
        return;
      }

      if (result.status === "warning") {
        tapMessage.html(result.message);
        timeNow.html(
          new Date().toLocaleTimeString("en-US", {
            hour: "2-digit",
            minute: "2-digit",
            second: "2-digit",
          })
        );
      } else {
        attendanceMessage
          .html("Hello there! " + result.data.full_name)
          .fadeIn();
      }

      if (result.status === "timein") {
        tapMessage.html(result.message);
      }

      if (result.status === "timeout") {
        tapMessage.html(result.message);
      }

      $("#userImage").attr("src", result.data.image_url);
      userFullName.html(result.data.full_name);
      userType.html(result.data.user_type + " (" + result.data.user_id + ")");
      userCourseAndYear.html(result.data.course_and_year);

      // Reset animation class
      sectionUserInformation.removeClass("hidden animate-out animate");
      // Force reflow to restart animation
      void sectionUserInformation[0].offsetWidth;
      sectionUserInformation.addClass("visible animate");

      // Timeout to reset info
      hideTimeout = setTimeout(function () {
        sectionUserInformation.removeClass("animate").addClass("animate-out");

        attendanceMessage.html("Please tap your ID card... ").fadeIn();
        timeNow.html("");
      }, 5000);

      // Hide after animation out
      hideAnimateTimeout = setTimeout(function () {
        sectionUserInformation
          .removeClass("visible animate-out")
          .addClass("hidden");
        $("#userImage").attr("src", "");
      }, 6000);
    },
    error: function () {
      $("#errorMessage").html("Something went wrong.").fadeIn();
    },
  });
}
