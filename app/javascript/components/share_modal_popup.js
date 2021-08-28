// $('#matchmodal').on('show.bs.modal', function () {
//   alert('表示前の注意!!');
// })
const shareModalPopup = () => {
  const matchModal = document.querySelector("#matchmodal");

if (matchModal) {
  $(document).ready(function(){
    $("#matchmodal").modal('show');
  });
};

};

export default shareModalPopup
