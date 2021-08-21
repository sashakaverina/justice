const initLoading = function() {
  if (document.querySelector("#content")) {
    if (document.readyState !== "complete") {
        document.querySelector(
          "#content").style.visibility = "hidden";
        document.querySelector(
          "#loader").style.visibility = "visible";
    } else {
        document.querySelector(
          "#loader").style.display = "none";
        document.querySelector(
          "#content").style.visibility = "visible";
    }
  };
};
export { initLoading };
