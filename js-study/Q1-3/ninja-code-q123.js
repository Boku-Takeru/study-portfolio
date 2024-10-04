// q1
// ページが読み込まれたときにウィンドウ幅をアラートで表示
window.onload = function () {
  const win_width = window.innerWidth;
  alert(`ウィンドウ幅は ${win_width} ピクセルです`);
};

// Q2
const num1 = 5;
const num2 = 8;
alert(num1 + num2);

// Q3
let text1 = "リンゴ・バナナ";
let text2 = "レモン";
let newtext1 = text1.replace("バナナ", "");
alert(newtext1 + text2);
