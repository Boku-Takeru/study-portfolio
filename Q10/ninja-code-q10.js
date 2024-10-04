// Q10
// htmlのscriptタグにdefer入れて反映させる
document
  .getElementById("removeClassBtn")
  .addEventListener("click", function () {
    let element = document.querySelector("p.blue.write-active");
    element.classList.remove("blue");
  });

// DOM盛り込めば反映させる
// document.addEventListener("DOMContentLoaded", function () {
//   const removeClassBtn = document.getElementById("removeClassBtn");
//   removeClassBtn.addEventListener("click", function () {
//     document.querySelector("p").classList.remove("blue");
//   });
// });
