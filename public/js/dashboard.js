const profile = document.querySelector(".profile");
const dropdown = document.querySelector(".profileDropdown");

profile.addEventListener("click", function (e) {
  e.stopPropagation(); // Prevent click from bubbling
  dropdown.style.display = dropdown.style.display === "flex" ? "none" : "flex";
});

// Hide when clicking outside
document.addEventListener("click", function () {
  dropdown.style.display = "none";
});
