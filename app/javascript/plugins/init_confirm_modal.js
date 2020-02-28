const initConfirmModals = () => {
  // Get the button that opens the modal
  const btn = document.getElementById("confirm");

  if (!btn) {
    return;
  }

  btn.addEventListener('click', () => { // When the user clicks on the button, open the modal
    // Get the modal
    console.log("SHOW ME THE FIN MODAL!")
    modal.style.display = "block";
  });


    const modal = document.querySelector('.confirm-modal');


    // Get the <span> element that closes the modal
    const span = modal.querySelector(".close");

    // When the user clicks on <span> (x), close the modal
    span.onclick = () => {
      modal.style.display = "none";


    modal.addEventListener('click', event => {
      if (!modal.contains(event.target)) {
        modal.style.display = "none";
      }
    });
  };
};

export { initConfirmModals };
