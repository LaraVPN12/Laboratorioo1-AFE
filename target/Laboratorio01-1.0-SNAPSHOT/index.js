const modal = document.getElementById("modal");
const close = document.getElementById("close-modal");
const open = document.getElementById("open-modal");

modal.style.display = "none";
modal.style.opacity = 0;

function openModal() {
    modal.style.display = "flex";
    modal.style.opacity = 1;
}

function closeModal() {
    modal.style.display = "none";
    modal.style.opacity = 0;
}
close.addEventListener("click", closeModal);
open.addEventListener("click", openModal);