$(function () {
  // Listen to register button
  $("#buttonSignIn").on("click", function () {
    console.log("Sign In function called");
    signin();
  });
});

function signin() {
  // Log when the function is called
  var username = $("#SIUsername").val();
  var password = $("#SIPassword").val();

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
    return; // Stop if there are empty fields
  }

  // Loading
  $("#loadingMessage").fadeIn();

  $.ajax({
    url: "../includes/signin/signin.inc.php",
    method: "POST",
    data: {
      username: username,
      password: password,
    },
    success: function (data) {
      console.log("AJAX Response:", data); // Log the response
      // Parse the JSON string into a JavaScript object
      var parsedData = JSON.parse(data);

      console.log(parsedData.message);

      message = parsedData.message;

      //$("#errorMessage").html(message).fadeIn();

      Toastify({
        text: message,
        duration: 2000,
        destination: "https://github.com/apvarun/toastify-js",
        newWindow: true,
        close: false,
        gravity: "bottom", // `top` or `bottom`
        position: "right", // `left`, `center` or `right`
        stopOnFocus: true, // Prevents dismissing of toast on hover
        style: {
          background: "#3fae60",
          borderRadius: "20px",
        },
        onClick: function () {}, // Callback after click
      }).showToast();

      setTimeout(function () {
        $("#errorMessage").fadeOut();
      }, 3000);

      if (parsedData.status === "success") {
        window.location = "dashboard.php";
      }
    },
    error: function (jqXHR, textStatus, errorThrown) {
      console.error("AJAX Error: ", textStatus, errorThrown); // Log any errors
    },
    complete: function () {
      // Hide the loading message once the request is complete
      $("#loadingMessage").fadeOut();
    },
  });
}
