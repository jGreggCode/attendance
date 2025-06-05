$(function () {
  // Listen to register button
  $("#buttonSignUp").on("click", function () {
    console.log("Register function called");
    register();
  });
});

function register() {
  // Log when the function is called

  var SUPhoto = $("#SUPhoto")[0].files[0];
  var rfid_code = $("#SURfidCode").val();
  var userId = $("#SUUserId").val();
  var first_name = $("#SUFirstName").val();
  var middle_name = $("#SUMiddleName").val();
  var last_name = $("#SULastName").val();
  var age = $("#SUAge").val();
  var birthday = $("#SUBirthday").val();
  var course = $("#SUCourse").val();
  var year_level = $("#SUYearLevel").val();
  var department = $("#SUDepartment").val();
  var user_type = $("#SUUserType").val();
  var username = $("#SUUsername").val();
  var password = $("#SUPassword").val();
  var repassword = $("#SURePassword").val();
  var email = $("#SUEmail").val();
  var phoneNumber = $("#SUPhoneNumber").val();

  if (!SUPhoto) {
    $("#suErrorMessage").html("Please upload a profile photo.").fadeIn();

    setTimeout(function () {
      $("#suErrorMessage").fadeOut();
    }, 3000);
    return;
  }

  // Check file size (max 30MB)
  if (SUPhoto && SUPhoto.size > 30 * 1024 * 1024) {
    setTimeout(function () {
      $("#errorMessage")
        .html("File size exceeds 30MB. Please upload a smaller file.")
        .fadeIn();
    }, 3000);
    return;
  }

  var formData = new FormData();
  formData.append("student_photo", SUPhoto);
  formData.append("rfid_code", rfid_code);
  formData.append("user_id", userId);
  formData.append("first_name", first_name);
  formData.append("middle_name", middle_name);
  formData.append("last_name", last_name);
  formData.append("age", age);
  formData.append("birthday", birthday);
  formData.append("course", course);
  formData.append("year_level", year_level);
  formData.append("department", department);
  formData.append("user_type", user_type);
  formData.append("username", username);
  formData.append("password", password);
  formData.append("repassword", repassword);
  formData.append("email", email);
  formData.append("phone_number", phoneNumber);

  // Loading
  $("#loadingMessage").fadeIn();

  $.ajax({
    url: "../includes/signup/signup.inc.php",
    method: "POST",
    data: formData,
    contentType: false, // Important for file uploads
    processData: false, // Important for file uploads
    success: function (data) {
      console.log("AJAX Response:", data);
      // Parse the JSON string into a JavaScript object
      var parsedData = JSON.parse(data);
      var message = parsedData.message;

      if (parsedData.status === "error") {
        $("#suErrorMessage").html(message).fadeIn();
      } else {
        $("#registerMessage").html(message).fadeIn();
      }

      setTimeout(function () {
        $("#suErrorMessage").fadeOut();
        $("#registerMessage").fadeOut();
      }, 5000);
    },
    error: function (jqXHR, textStatus, errorThrown) {
      console.error("AJAX Error: ", textStatus, errorThrown); // Log any errors
    },
    complete: function () {
      // Hide the loading message once the request is complete
      $("#loadingMessage").fadeOut();

      // Remove the value of the password input fields
      $("#SUStudentPassword").val("");
      $("#SUStudentRePassword").val("");
    },
  });
}
