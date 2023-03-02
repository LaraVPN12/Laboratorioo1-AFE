function openModal(id) {
    const modalOpen = document.getElementById(id);
    modalOpen.style.display = "flex";
    modalOpen.style.opacity = 1;
}

function closeModal(id) {
    const modal = document.getElementById(id);
    modal.style.display = "none";
    modal.style.opacity = 0;
}