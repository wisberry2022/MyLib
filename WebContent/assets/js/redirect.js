window.onload = function () {
  var home = document.querySelector(".bl_btn");
  var back = document.querySelector(".wt_btn");

  home.onclick = function () {
    location.replace("index.jsp");
  }

  back.onclick = function () {
    history.back();
  }


}