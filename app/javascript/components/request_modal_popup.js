
const requestModalPopup = () => {
  const requestModal = document.querySelector("#requestmodal");
  console.log(requestModal)
if (requestModal) {
  $(document).ready(function(){
    $("#requestmodal").modal('show');
  });
};

};

export default requestModalPopup
