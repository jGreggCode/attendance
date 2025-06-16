document.addEventListener("DOMContentLoaded", () => {
  const buttonSignOut = document.getElementById("buttonSignOut");
  if (buttonSignOut) {
    buttonSignOut.addEventListener("click", () => {
      console.log("Sign Out function called");
      signOut();
    });
  }
});

async function signOut() {
  const loadingMessage = document.getElementById("loadingMessage");
  const loginMessage = document.getElementById("loginMessage");

  try {
    // Show loading
    if (loadingMessage) loadingMessage.style.display = "block";

    const response = await fetch("../includes/signout/signout.inc.php");
    const text = await response.text();

    console.log("Fetch Response:", text);

    if (loginMessage) {
      loginMessage.innerHTML = text;
      loginMessage.style.display = "block";
    }

    // Try parsing JSON if it's expected
    try {
      const data = JSON.parse(text);
      console.log(data.message);

      if (data.message.includes("Logged out successfully!")) {
        window.location.href = "index.php";
      }
    } catch (err) {
      console.warn("Not JSON or parse failed:", err);
    }
  } catch (error) {
    console.error("Fetch Error:", error);
  } finally {
    // Hide loading
    if (loadingMessage) loadingMessage.style.display = "none";
  }
}
