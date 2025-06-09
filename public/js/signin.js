$(function () {
  // Listen to register button
  $("#buttonSignIn").on("click", function () {
    console.log("Sign In function called");
    signin();
  });
});

function signin() {
  // Log when the function is called
  console.log("Starting signin process");
  var username = $("#SIUsername").val();
  var password = $("#SIPassword").val();

  console.log("Username:", username); // Log username (without password for security)

  // Reset borders first
  $("#StudentIDGroup, #StudentPasswordGroup").css("border", "");

  let hasError = false;

  if (username === "") {
    $("#StudentIDGroup").css("border", "1px solid red");
    hasError = true;
  }

  if (password === "") {
    $("#StudentPasswordGroup").css("border", "1px solid red");
    hasError = true;
  }

  if (hasError) {
    console.log("Form validation failed");
    return; // Stop if there are empty fields
  }

  // Loading
  $("#loadingMessage").fadeIn();

  // Log the request URL
  const requestUrl = "../includes/signin/signin.inc.php";
  console.log("Making request to:", requestUrl);

  $.ajax({
    url: requestUrl,
    method: "POST",
    data: {
      username: username,
      password: password,
    },
    success: function (data) {
      console.log("AJAX Response:", data); // Log the response
      try {
        // Parse the JSON string into a JavaScript object
        var parsedData = JSON.parse(data);
        console.log("Parsed response:", parsedData);

        message = parsedData.message;

        Toastify({
          text: message,
          duration: 2000,
          destination: "https://github.com/apvarun/toastify-js",
          newWindow: true,
          close: false,
          gravity: "bottom",
          position: "right",
          stopOnFocus: true,
          style: {
            background: parsedData.status === "success" ? "#3fae60" : "#ff4444",
            borderRadius: "20px",
          },
          onClick: function () {},
        }).showToast();

        if (parsedData.status === "success") {
          window.location = "dashboard.php";
        }
      } catch (e) {
        console.error("Error parsing response:", e);
        console.log("Raw response:", data);
      }
    },
    error: function (jqXHR, textStatus, errorThrown) {
      console.error("AJAX Error Details:");
      console.error("Status:", textStatus);
      console.error("Error:", errorThrown);
      console.error("Response:", jqXHR.responseText);
      
      Toastify({
        text: "Error connecting to server. Please try again.",
        duration: 2000,
        gravity: "bottom",
        position: "right",
        style: {
          background: "#ff4444",
          borderRadius: "20px",
        },
      }).showToast();
    },
    complete: function () {
      // Hide the loading message once the request is complete
      $("#loadingMessage").fadeOut();
    },
  });
}
