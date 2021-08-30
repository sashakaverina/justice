import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "tickbox", "share", "card", "sharebutton", "ids" ]

  connect() {
    console.log(this.tickboxTargets, this.shareTarget, this.cardTargets, this.sharebuttonTarget)
    this.incidentIds = []
    // this.outputTarget.textContent = 'Hello, Stimulus!'
  };

  share(event) {
    event.preventDefault();
    console.log(event);
    this.tickboxTargets.forEach((tickbox) => {
      // tickbox.parentElement.style.pointerEvents = "none";
      tickbox.style.display = "block";
    });

    // this.cardTargets.forEach((card) => {
    //   card.classList.remove("fa-images");
    // });

    console.log(this.shareTarget)
    this.sharebuttonTarget.classList.add('fa-times');
    this.sharebuttonTarget.classList.toggle('fa-share-alt');
  };

  select(event) {
    event.preventDefault();
    console.log(event.currentTarget.dataset.incidentId);
    event.currentTarget.classList.toggle("tick-box-select")
    this.sharebuttonTarget.classList.remove('fa-times');
    this.sharebuttonTarget.classList.add('fa-check');
    this.sharebuttonTarget.dataset.toggle = "modal";
    this.sharebuttonTarget.dataset.target = "#exampleModal";
    const clickedId = event.currentTarget.dataset.incidentId
    if (this.incidentIds.includes(clickedId)) {
      function removeItemOnce(arr, value) {
        var index = arr.indexOf(value);
        if (index > -1) {
          arr.splice(index, 1);
        }
        return arr;
      }
      removeItemOnce(this.incidentIds, clickedId)
    } else {
      this.incidentIds.push(clickedId);
    }
    this.idsTarget.value = JSON.stringify(this.incidentIds)
  };

 // ✅ 1. Tick box that are position:absolute (card relative), start display:none
 // ✅ 2. When you click on share, in share method want to display:block the tick box && tick button turn into check
 // ✅ 3. Add a new action when you click on tick box, called 'select'
 // 4. When 'select' action triggered, get the link of the incident card being targeted, save it into array
 // 5. Send all array info to the trusted contact through share modal
}
