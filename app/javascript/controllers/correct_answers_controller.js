import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="correct-answers"
export default class extends Controller {
  static targets = ["answers", "form"];
  connect() {}
  send(event) {
    event.preventDefault();

    fetch(this.formTarget.action, {
      method: "POST",
      headers: { Accept: "application/json" },
      body: new FormData(this.formTarget),
    })
      .then((response) => response.json())
      .then((data) => {
        console.log(data);
      });
  }
}
