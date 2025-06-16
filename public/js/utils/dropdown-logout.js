export function setupProfileDropdownToggle() {
  const profile = document.querySelector(".profile");
  const dropdown = document.querySelector(".profileDropdown");

  if (profile && dropdown) {
    profile.addEventListener("click", (e) => {
      e.stopPropagation();
      dropdown.style.display =
        dropdown.style.display === "flex" ? "none" : "flex";
    });

    document.addEventListener("click", () => {
      dropdown.style.display = "none";
    });
  }
}
