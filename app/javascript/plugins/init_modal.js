const initModals = () => {
  // Get the button that opens the modal
  const btn = document.querySelectorAll(".card-trigger");

  if (!btn) {
    return;
  }

  btn.forEach(element => {
    const modal = document.getElementById(element.dataset.modal);

    // Get the <span> element that closes the modal
    const span = modal.querySelector(".close");

    // When the user clicks on <span> (x), close the modal
    span.onclick = () => {
      modal.style.display = "none";
    }

    modal.addEventListener('click', event => {
      const modalContent = modal.querySelector('.modal-content');

      if (!modalContent.contains(event.target)) {
        modal.style.display = "none";
      }
    });

    element.onclick = () => { // When the user clicks on the button, open the modal
      // Get the modal
      modal.style.display = "block";
    };
  });
};

export { initModals };