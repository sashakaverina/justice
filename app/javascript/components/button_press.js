const buttonPress = () => {
  const buttonSmall = document.querySelector(".button-small");
  const buttonLarge = document.querySelector(".button-large");

  if (buttonSmall) {
    buttonSmall.addEventListener("touchstart", (event) => {
      buttonSmall.classList.remove("box-shadow");
      buttonSmall.classList.add("box-shadow-inset");
    });

    buttonSmall.addEventListener("touchend", (event) => {
      buttonSmall.classList.remove("box-shadow-inset");
      buttonSmall.classList.add("box-shadow");
    });
  };

  if (buttonLarge) {
    buttonLarge.addEventListener("touchstart", (event) => {
      buttonLarge.classList.remove("box-shadow");
      buttonLarge.classList.add("box-shadow-inset");
    });

    buttonLarge.addEventListener("touchend", (event) => {
      buttonLarge.classList.remove("box-shadow-inset");
      buttonLarge.classList.add("box-shadow");
    });
  };
}


export { buttonPress };
