export function togglePasswordVisibility(password, visibilityButton) {
  document.getElementById(visibilityButton).addEventListener("click", () => {
    console.log("Toggle Password Visibility function called");
    const passwordInput = document.getElementById(password);

    // Toggle the type attribute
    const type =
      passwordInput.getAttribute("type") === "password" ? "text" : "password";
    passwordInput.setAttribute("type", type);

    // Toggle the eye / eye-slash icon
    this.classList.toggle("fa-eye-slash");
    this.classList.toggle("fa-eye");
  });
}
