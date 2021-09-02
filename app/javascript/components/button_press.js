const buttonPress = () => {
  const buttonSmall = document.querySelector(".button-small");
  const buttonLarge = document.querySelector(".button-large");
  const buttonSmallWide = document.querySelector(".button-small-wide");
  const matchCheckbox = document.querySelector(".match-checkbox");
  const matchConfirmation = document.querySelector(".match-confirmation");

  if (matchCheckbox) {
    matchCheckbox.addEventListener("click", (event) => {
      if (event.currentTarget.checked) {
        matchConfirmation.classList.remove("disabled-button");
        matchConfirmation.attr('disabled', false);
      } else {
        matchConfirmation.classList.add("disabled-button");
        matchConfirmation.attr('disabled', true);
      }
    });
  };

  if (buttonSmallWide) {
    buttonSmallWide.addEventListener("touchstart", (event) => {
      buttonSmallWide.classList.remove("box-shadow");
      buttonSmallWide.classList.add("box-shadow-inset");
    });

    buttonSmallWide.addEventListener("touchend", (event) => {
      buttonSmallWide.classList.remove("box-shadow-inset");
      buttonSmallWide.classList.add("box-shadow");
    });
  };

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
