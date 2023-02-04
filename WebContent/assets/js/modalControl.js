window.onload = function () {
  var modal = document.querySelector("#errorModal");
  var modal_close = document.querySelector("#errorModal .bl_btn");
  var monitor = document.querySelector("body");

  monitor.style.backgroundColor = "rgba(0, 0, 0, 0.2)";

  modal_close.onclick = function () {
    modal.style.visibility = 'hidden';
    monitor.style.backgroundColor = "transparent";
  }
}