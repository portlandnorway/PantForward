// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks on the button, open the modal
const modalOnBtnClick = btn.onclick = function() {
  modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
const closeModalOnX = span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
const closeModalOnClick = window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}

export { closeModalOnClick, closeModalOnX, modalOnBtnClick };
