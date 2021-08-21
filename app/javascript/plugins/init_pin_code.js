const verifyPassword = async(password) => {
  const result = await fetch(`/api/v1/auth?password=${password}`)
  const responce = await result.json()
  return responce;
}

const initPinCode = function() {
  // var pin = (+!![] + []) + (!+[] + !![] + []) + (!+[] + !![] + !![] + []) + (!+[] + !![] + !![] + !![] + []) + (!+[] + !![] + !![] + !![] + !![] + []) + (!+[] + !![] + !![] + !![] + !![] + !![] + []);
  var enterCode = "";
  enterCode.toString();

  $("#numbers button").click(function() {

    var clickedNumber = $(this).text().toString();
    enterCode = enterCode + clickedNumber;
    var lengthCode = parseInt(enterCode.length);
    lengthCode--;
    $("#fields .numberfield:eq(" + lengthCode + ")").addClass("active");

    if (lengthCode == 5) {
      const obj = {}
      verifyPassword(enterCode).then(data => {
        console.log(data)
        if (data.status) {
          // Right PIN!
          $("#fields .numberfield").addClass("right");
          $("#numbers").addClass("hide");
          $("#anleitung p").html("Amazing!<br>You entered the correct Code!");
          window.location.pathname = '/index';

        } else {
          // Wrong PIN!
          $("#fields").addClass("miss");
          enterCode = "";
          setTimeout(function() {
            $("#fields .numberfield").removeClass("active");
          }, 200);
          setTimeout(function() {
            $("#fields").removeClass("miss");
          }, 500);

        }
      })
      // Check the PIN

    } else {}

  });

  $("#restartbtn").click(function(){
    enterCode = "";
    $("#fields .numberfield").removeClass("active");
    $("#fields .numberfield").removeClass("right");
    $("#numbers").removeClass("hide");
    $("#anleitung p").html("<strong>Please enter the correct PIN-Code.</strong><br> It is: 1234 / Also try a wrong code");
  });
};
export { initPinCode };
