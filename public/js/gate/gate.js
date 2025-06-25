let hideTimeout;
let hideAnimateTimeout;

// ADS
document.addEventListener("DOMContentLoaded", () => {
  const videoElement = document.getElementById("adsVideo");

  const videos = ["ads/ad1.mp4", "ads/ad2.mp4", "ads/ad3.mp4"];

  const shuffle = (arr) => {
    for (let i = arr.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [arr[i], arr[j]] = [arr[j], arr[i]];
    }
    return arr;
  };

  const shuffledVideos = shuffle([...videos]);
  let currentIndex = 0;

  const playNext = () => {
    videoElement.classList.add("fade-out");

    setTimeout(() => {
      videoElement.src = shuffledVideos[currentIndex];
      videoElement.load();

      videoElement.play().catch((err) => console.error("Playback error:", err));

      currentIndex = (currentIndex + 1) % shuffledVideos.length;

      videoElement.classList.remove("fade-out");
    }, 700); // same as transition duration
  };

  videoElement.addEventListener("ended", playNext);
  playNext();
});

// RFID AND LIVE TIME
document.addEventListener("DOMContentLoaded", () => {
  const liveTimeElement = document.getElementById("liveTime");
  const rfidInput = document.getElementById("rfid_input");

  if (!liveTimeElement || !rfidInput) {
    console.error("Essential elements not found.");
    return;
  }

  rfidInput.focus();
  setInterval(() => {
    rfidInput.focus();
    // Uncomment this on production
    // rfidInput.value = "";
  }, 1000);

  // Block Enter key
  rfidInput.addEventListener("keydown", (e) => {
    if (e.key === "Enter") {
      e.preventDefault(); // Stop it from submitting or triggering anything
      return false;
    }
  });

  rfidInput.addEventListener("input", () => {
    if (rfidInput.value.length === 10) {
      handleRFIDScan(rfidInput.value.trim());
    }
  });

  updateLiveTime(liveTimeElement);
  setInterval(() => updateLiveTime(liveTimeElement), 1000);
});

// ⏰ Update Clock
function updateLiveTime(element) {
  const now = new Date();

  const date = now.toLocaleDateString("en-US", {
    weekday: "long",
    year: "numeric",
    month: "long",
    day: "numeric",
  });

  const time = now.toLocaleTimeString("en-US", {
    hour: "numeric",
    minute: "2-digit",
    second: "2-digit",
    hour12: true,
  });

  element.textContent = `${date} - ${time}`;
}

// 📥 Handle RFID Scanning
async function handleRFIDScan(rfidCode) {
  const sectionUserInformation = document.getElementById(
    "sectionUserInformation"
  );
  const userImage = document.getElementById("userImage");
  const userFullName = document.getElementById("userFullName");
  const userType = document.getElementById("userType");
  const userCourseAndYear = document.getElementById("userCourseAndYear");
  const tapMessage = document.getElementById("tap-message");
  const attendanceMessage = document.getElementById("attendanceMessage");
  const dateToday = document.getElementById("dateToday");
  const timeNow = document.getElementById("timeNow");
  const errorMessage = document.getElementById("errorMessage");
  const rfidInput = document.getElementById("rfid_input");

  clearTimeout(hideTimeout);
  clearTimeout(hideAnimateTimeout);

  try {
    const response = await fetch("../includes/api/attendance.api.php", {
      method: "POST",
      headers: { "Content-Type": "application/x-www-form-urlencoded" },
      body: new URLSearchParams({ rfid_code: rfidCode }),
    });

    const result = await response.json();

    rfidInput.value = "";
    rfidInput.focus();

    const today = new Date();
    dateToday.textContent = today.toLocaleDateString("en-US", {
      weekday: "long",
      year: "numeric",
      month: "long",
      day: "numeric",
    });

    if (result.status === "error") {
      showError(errorMessage, result.message);
      hideUserSection(sectionUserInformation);
      return;
    }

    const nowTime = today.toLocaleTimeString("en-US", {
      hour: "2-digit",
      minute: "2-digit",
      second: "2-digit",
    });

    if (["warning", "timein", "timeout"].includes(result.status)) {
      tapMessage.textContent = result.message;
      timeNow.textContent = nowTime;
    }

    if (result.status !== "warning") {
      attendanceMessage.textContent = `Hello there! ${
        result.data?.full_name ?? "User"
      }`;
    }

    updateUserDetails(result.data, {
      userImage,
      userFullName,
      userType,
      userCourseAndYear,
    });

    animateUserSection(sectionUserInformation);

    // Auto-hide info after timeout
    hideTimeout = setTimeout(() => {
      sectionUserInformation.classList.remove("animate");
      sectionUserInformation.classList.add("animate-out");
      attendanceMessage.textContent = "Please tap your ID card...";
      timeNow.textContent = "";
    }, 10000);

    hideAnimateTimeout = setTimeout(() => {
      hideUserSection(sectionUserInformation);
      userImage.src = "";
    }, 11000);
  } catch (err) {
    showError(errorMessage, "Something went wrong.");
  }
}

// 👤 Fill in user details
function updateUserDetails(data, elements) {
  if (!data) return;

  elements.userImage.src = data.image_url;
  elements.userFullName.textContent = data.full_name;
  elements.userType.textContent = `${data.user_type} (${data.user_id})`;
  elements.userCourseAndYear.textContent = data.course_and_year;
}

// 🎯 Animation In
function animateUserSection(section) {
  section.classList.remove("hidden", "animate-out", "animate");
  void section.offsetWidth; // Reflow for animation reset
  section.classList.add("visible", "animate");
}

// 🛑 Animation Out
function hideUserSection(section) {
  section.classList.remove("visible", "animate-out");
  section.classList.add("hidden");
}

// ❗ Show Error
function showError(element, message) {
  if (!element) return;
  element.textContent = message;
  element.style.display = "block";

  setTimeout(() => {
    element.style.display = "none";
  }, 3000);
}
