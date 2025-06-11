$(function () {
  // Listen to register button
  $("#buttonSignUp").on("click", function (e) {
    e.preventDefault();
    console.log("Register function called");

    register();
  });
});

function register() {
  // Get values using the correct IDs
  var profileImage = $("#profile_image")[0].files[0];
  var rfid_code = $("#rfid_code").val();
  var userId = $("#user_id").val();
  var firstName = $("#first_name").val();
  var middleName = $("#middle_name").val();
  var lastName = $("#last_name").val();
  var age = $("#age").val();
  var birthday = $("#birthday").val();
  var course = $("#course").val();
  var yearLevel = $("#year_level").val();
  var department = $("#department").val();
  var userType = $("#user_type").val();
  var username = $("#username").val();
  var email = $("#email").val();
  var password = $("#password").val();
  var phone_number = $("#phone_number").val();

  // Check if profile image is uploaded
  if (!profileImage) {
    $("#suErrorMessage").html("Please upload a profile image.").fadeIn();
    setTimeout(function () {
      $("#suErrorMessage").fadeOut();
    }, 3000);
    return;
  }

  // Validate file size (max 30MB)
  if (profileImage && profileImage.size > 30 * 1024 * 1024) {
    $("#suErrorMessage")
      .html("File size exceeds 30MB. Please upload a smaller file.")
      .fadeIn();
    setTimeout(function () {
      $("#suErrorMessage").fadeOut();
    }, 3000);
    return;
  }

  // Prepare data
  var formData = new FormData();
  formData.append("profile_image", profileImage);
  formData.append("rfid_code", rfid_code);
  formData.append("user_id", userId);
  formData.append("first_name", firstName);
  formData.append("middle_name", middleName);
  formData.append("last_name", lastName);
  formData.append("age", age);
  formData.append("birthday", birthday);
  formData.append("course", course);
  formData.append("year_level", yearLevel);
  formData.append("department", department);
  formData.append("user_type", userType);
  formData.append("username", username);
  formData.append("password", password);
  formData.append("email", email);
  formData.append("phone_number", phone_number);

  // Show loading
  $("#loadingMessage").fadeIn();

  $.ajax({
    url: "../includes/signup/signup.inc.php",
    method: "POST",
    data: formData,
    contentType: false,
    processData: false,
    success: function (data) {
      console.log("AJAX Response:", data);
      var parsedData = JSON.parse(data);
      var message = parsedData.message;

      if (parsedData.status === "error") {
        $("#suErrorMessage").html(message).fadeIn();
      } else {
        Toastify({
          text: message,
          duration: 5000,
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
        $("#editProfileModal").removeClass("show");
      }

      setTimeout(function () {
        $("#suErrorMessage").fadeOut();
        $("#registerMessage").fadeOut();
      }, 5000);
    },
    error: function (jqXHR, textStatus, errorThrown) {
      console.error("AJAX Error:", textStatus, errorThrown);
    },
    complete: function () {
      $("#loadingMessage").fadeOut();
      $("#password").val("");
    },
  });
}
