const initLoading = function() {
  if (document.querySelector("show")) {
    if (document.readyState !== "complete") {
        document.querySelector(
          "show").style.visibility = "none";
        document.querySelector(
          "#while-loading").style.visibility = "visible";
    } else {
        document.querySelector(
          "#while-loading").style.display = "none";
        document.querySelector(
          "show").style.visibility = "visible";
    }
  };
};
// document.initLoading = function() {
//     if (document.readyState !== "complete") {
//         document.querySelector("#show").style.visibility = "hidden";
//         document.querySelector("#while-loading").style.visibility = "visible";
//     } else {
//         document.querySelector("#while-loading").style.display = "none";
//         document.querySelector("#show").style.visibility = "visible";
//     }
// };
export { initLoading };
