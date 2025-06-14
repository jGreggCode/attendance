$(function () {
  // Listen to register button
  $("#changePassword").on("click", function (e) {
    e.preventDefault();
    console.log("Change Pas function called");
    changePass();
  });
});

function changePass() {
  // Log when the function is called
  var user_id = $("#user_id").text();
  var currentPassword = $("#current_password").val();
  var newPassword = $("#new_password").val();
  var newRePassword = $("#confirm_password").val();

  console.log(user_id);

  // Loading
  $("#loadingMessage").fadeIn();

  $.ajax({
    url: "../includes/api/update.password.api.php",
    method: "POST",
    data: {
      user_id: user_id,
      currentPassword: currentPassword,
      newPassword: newPassword,
      newRePassword: newRePassword,
    },
    dataType: "json",
    success: function (data) {
      console.log("AJAX Response:", data); // Log the response

      message = data.message;

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
