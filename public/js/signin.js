import { showToast } from "./utils/toast.js";
import { togglePasswordVisibility } from "./utils/password-visibility.js";

document.addEventListener("DOMContentLoaded", () => {
  togglePasswordVisibility("SIPassword", "SITogglePassword");
  document.getElementById("buttonSignIn").addEventListener("click", () => {
    console.log("Sign In function called");
    signin();
  });
});

async function signin() {
  const signinUserId = document.getElementById("SIUsername").value;
  const signinPassword = document.getElementById("SIPassword").value;

  // Reset borders
  document.getElementById("StudentIDGroup").style.border = "";
  document.getElementById("StudentPasswordGroup").style.border = "";

  let hasError = false;

  if (signinUserId === "") {
    document.getElementById("StudentIDGroup").style.border = "1px solid red";
    hasError = true;
  }

  if (signinPassword === "") {
    document.getElementById("StudentPasswordGroup").style.border =
      "1px solid red";
    hasError = true;
  }

  if (hasError) return;

  // Show loading
  document.getElementById("loadingMessage").style.display = "flex";

  try {
    const res = await fetch("../includes/signin/signin.inc.php", {
      method: "POST",
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      body: new URLSearchParams({
        signinUserId,
        signinPassword,
      }),
    });

    const data = await res.json();
    console.log("Fetch Response:", data);

    const message = data.message;

    if (data.status === "success") {
      showToast(message, "success", 2000);
      setTimeout(() => {
        window.location.href = "dashboard.php";
      }, 2000);
    } else if (data.status === "warning") {
      showToast(message, "warning", 5000);
    } else if (data.status === "error") {
      showToast(message, "error", 4000);
    }

    setTimeout(() => {
      errorMessage.style.display = "none";
    }, 3000);
  } catch (err) {
    console.error("Fetch Error:", err);
  } finally {
    document.getElementById("loadingMessage").style.display = "none";
  }
}
