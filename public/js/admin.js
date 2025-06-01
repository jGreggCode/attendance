$(function () {
  // Listen to register button

  $("#SUPhoto").on("change", function () {
    selectFile();
  });

  $("#togglePassword").on("click", function () {
    togglePasswordVisibility();
  });

  $("#SITogglePassword").on("click", function () {
    togglePasswordVisibility();
  });
});

function selectFile() {
  const fileInput = document.getElementById("SUPhoto");
  const fileName = document.getElementById("fileName");

  if (fileInput.files.length > 0) {
    console.log("Hello");
    fileName.textContent = fileInput.files[0].name;
  } else {
    fileName.textContent = "No file selected";
  }
}

function togglePasswordVisibility() {
  // Log when the function is called
  console.log("Toggle Password Visibility function called");
  const passwordInput = document.getElementById("SIPassword");
  const toggleIcon = document.getElementById("SITogglePassword");

  // Toggle the type attribute
  const type =
    passwordInput.getAttribute("type") === "password" ? "text" : "password";
  passwordInput.setAttribute("type", type);

  // Toggle the eye / eye-slash icon
  toggleIcon.classList.toggle("fa-eye-slash");
  toggleIcon.classList.toggle("fa-eye");
}

// Just a sample notification function
function notifyMe() {
  // Check if browser supports notifications
  if (!("Notification" in window)) {
    alert("This browser does not support desktop notification");
  } else if (Notification.permission === "granted") {
    new Notification("Hey there! 👋 This is your notification.");
  } else if (Notification.permission !== "denied") {
    Notification.requestPermission().then((permission) => {
      if (permission === "granted") {
        new Notification("You have allowed notifications!");
      }
    });
  }
}
