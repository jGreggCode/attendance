export function setupDynamicAge(birthdayInputId, ageInputId) {
  const birthdayInput = document.getElementById(birthdayInputId);
  const ageInput = document.getElementById(ageInputId);

  if (!birthdayInput || !ageInput) {
    console.error("Invalid element IDs passed to setupDynamicAge.");
    return;
  }

  birthdayInput.addEventListener("input", () => {
    const birthDate = new Date(birthdayInput.value);
    const today = new Date();

    if (!isNaN(birthDate)) {
      let age = today.getFullYear() - birthDate.getFullYear();

      const hasBirthdayPassed =
        today.getMonth() > birthDate.getMonth() ||
        (today.getMonth() === birthDate.getMonth() &&
          today.getDate() >= birthDate.getDate());

      if (!hasBirthdayPassed) age--;

      ageInput.value = age >= 0 ? age : "";
    } else {
      ageInput.value = "";
    }
  });
}
