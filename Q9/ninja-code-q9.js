document.addEventListener("DOMContentLoaded", function () {
  const paragraph = document.querySelector("p");

  // 2秒後に 'blue' クラスを削除して赤色に変更する
  setTimeout(function () {
    paragraph.classList.remove("blue"); // 'blue' クラスを削除
  }, 2000);
});
