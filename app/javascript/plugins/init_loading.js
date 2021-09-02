const initLoading = function() {
  if (document.querySelector(".before-loading")) {
    document.querySelector("#while-loading").style.display = "none";
    const updateButton = document.querySelector("#show-bottom")
    updateButton.addEventListener("click",() => {
      document.querySelector("#while-loading").style.display = "block";
      document.querySelector(".before-loading").style.filter= "blur(4px)";
    })
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
