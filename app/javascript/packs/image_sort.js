// app/javascript/packs/image_sort.js
document.addEventListener('DOMContentLoaded', () => {
  const dropzones = document.querySelectorAll('.dropzone');
  const images = document.querySelectorAll('.image');

  images.forEach(image => {
    image.addEventListener('dragstart', dragStart);
  });

  dropzones.forEach(dropzone => {
    dropzone.addEventListener('dragover', dragOver);
    dropzone.addEventListener('drop', drop);
  });

  function dragStart(e) {
    e.dataTransfer.setData('text/plain', null);
  }

  function dragOver(e) {
    e.preventDefault();
  }

  function drop(e) {
    e.preventDefault();
    const data = e.dataTransfer.getData('text/plain');
    e.target.appendChild(document.querySelector(`img[draggable="${data}"]`));
  }
});