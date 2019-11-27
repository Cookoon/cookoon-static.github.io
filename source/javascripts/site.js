
$(document).ready(function() {
  const path = window.location.pathname.split("/").pop();

  document.querySelectorAll("menuTab").forEach((tab) => {
      tab.classList.remove("active");
    });

  if (path == "occasions-particulieres") {
    document.getElementById("particulier").classList.add("active");
  } else if (path == "receptions-professionnelles") {
    document.getElementById("professionnel").classList.add("active");
  }
});



