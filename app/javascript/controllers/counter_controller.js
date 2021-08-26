// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "count" ]

  // visible() {
  //   this.countTarget.innerText = 0;
  // }

  connect() {
    setInterval(this.refresh, 5000);
    console.log(this);
  }


  refresh = () => {
    fetch(`/notifications`, { headers: { accept: "application/json" }})
      .then(response => response.json())
      .then((data) => {
        if (data >= 1) {
          this.element.innerText = data;
          console.log(this);
        }
        else
          this.element.innerHTML = "";
      });
  }
}
