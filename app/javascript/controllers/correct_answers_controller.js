import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="correct-answers"
export default class extends Controller {
  static targets = ["answers", "form"];
  connect() {
    console.log(this.element);
    console.log(this.answersTarget);
    console.log(this.formTarget);
  }
  send(event) {
    event.preventDefault();

    console.log("TODO: send request in AJAX");
  }
}
