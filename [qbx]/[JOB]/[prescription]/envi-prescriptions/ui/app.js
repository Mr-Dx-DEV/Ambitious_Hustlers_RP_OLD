let timeout;

window.addEventListener("message", function (event) {
  const data = event.data;
  if (data.action === "openPrescription") {
    if (timeout) {
      clearTimeout(timeout);
    }
    const info = data.info;
    displayPrescription(info);
    const prescription = document.getElementById("prescription");
    prescription.classList.remove("hidden");
    prescription.classList.add("visible");
    timeout = setTimeout(function () {
      hidePrescription();
    }, 6000);
  }
});

function displayPrescription(info) {
  const today = new Date();
  const formattedDate = today.toLocaleDateString("en-US", {
    month: "short",
    day: "numeric",
    year: "numeric",
  });
  document.getElementById("patient-name").textContent = info.name || "Unknown";
  document.getElementById("current-date").textContent = formattedDate;
  document.getElementById("patient-dob").textContent = info.dob || "Unknown";
  document.getElementById("prescription-id").textContent =
    info.prescription || "00000";
  let medicationInfo = [];
  if (info.itemLabel) {
    medicationInfo.push(info.itemLabel);
  } else if (info.type) {
    medicationInfo.push(info.type);
  }
  if (info.dosage) {
    medicationInfo.push(info.dosage);
  }
  document.getElementById("medication-name").textContent =
    medicationInfo.join(" - ");
  let detailsInfo = [];
  if (info.effects) {
    detailsInfo.push(`Effects: ${info.effects}`);
  }
  if (info.sideEffects) {
    detailsInfo.push(`Side Effects: ${info.sideEffects}`);
  }
  document.getElementById("medication-details").textContent =
    detailsInfo.join("\n");
  if (info.warning) {
    document.getElementById("medication-warning").textContent =
      info.warning || "";
  }
  const totalDoses = parseInt(info.total) || parseInt(info.doses) || 0;
  document.getElementById(
    "medication-total"
  ).textContent = `Prescribed Quantity: ${totalDoses} Dose${
    totalDoses !== 1 ? "s" : ""
  }`;
  if (info.expiry) {
    document.getElementById("expiration-date").textContent = info.expiry;
  } else {
    const expiryDate = new Date();
    expiryDate.setDate(expiryDate.getDate() + 30);
    document.getElementById("expiration-date").textContent =
      formatDate(expiryDate);
  }
  let doctorName = info.signed || "Dr Dolittle";
  let signatureName = info.doctor || "Dr Dolittle";
  document.getElementById("doctor-signature").textContent = signatureName;
  document.getElementById("doctor-name").textContent = doctorName;
}

function formatDate(date) {
  const month = String(date.getMonth() + 1).padStart(2, "0");
  const day = String(date.getDate()).padStart(2, "0");
  const year = date.getFullYear();
  return `${month}/${day}/${year}`;
}

function hidePrescription() {
  const prescription = document.getElementById("prescription");
  prescription.classList.remove("visible");
  prescription.classList.add("hidden");
}
