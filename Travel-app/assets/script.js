// small client side behaviours for booking/contact
document.addEventListener("DOMContentLoaded", () => {
  // set year in footer
  const years = [ "year", "year2", "year3", "year4", "year5" ];
  years.forEach(id => {
    const el = document.getElementById(id);
    if (el) el.textContent = new Date().getFullYear();
  });

  // Booking form
  const bookingForm = document.getElementById("bookingForm");
  const bookingMessage = document.getElementById("bookingMessage");
  if (bookingForm) {
    bookingForm.addEventListener("submit", (e) => {
      e.preventDefault();
      bookingMessage.textContent = "Thanks — your booking request has been received!";
      bookingMessage.style.color = "green";
      bookingForm.reset();
    });
  }

  // Contact form
  const contactForm = document.getElementById("contactForm");
  const contactMessage = document.getElementById("contactMessage");
  if (contactForm) {
    contactForm.addEventListener("submit", (e) => {
      e.preventDefault();
      contactMessage.textContent = "Thanks! We'll get back to you soon.";
      contactMessage.style.color = "green";
      contactForm.reset();
    });
  }
});
