$(function () {
  // Listen to register button
  $("#buttonSignOut").on("click", function () {
    console.log("Sign Out function called");
    signOut();
  });
});

function signOut() {
  // Loading
  $("#loadingMessage").fadeIn();

  $.ajax({
    url: "../includes/signout/signout.inc.php",
    success: function (data) {
      console.log("AJAX Response:", data); // Log the response
      $("#loginMessage").html(data).fadeIn();

      // Parse the JSON string into a JavaScript object
      var parsedData = JSON.parse(data);

      console.log(parsedData.message);

      if (data.indexOf("Logged out successfully!") >= 0) {
        window.location = "admin.php";
      }
    },
    error: function (jqXHR, textStatus, errorThrown) {
      console.error("AJAX Error: ", textStatus, errorThrown); // Log any errors
    },
    complete: function () {
      $("#loadingMessage").fadeOut();
    },
  });
}
