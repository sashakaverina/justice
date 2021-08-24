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

  connect() {
    setInterval(this.refresh, 5000);
  }

  // refresh = () => {
  //   fetch('/chatrooms/', { headers: { accept: "application/json" }})
  //     .then(response => response.json())
  //     .then((data) => {
  //       this.countTarget.innerText = data.messages.length;
  //     });
  // }
}
