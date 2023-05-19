import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="result"
export default class extends Controller {
  static targets = ["button", "list"];
  connect() {}

  toggle() {
    this.buttonTarget.classList.toggle("d-none");
    this.listTarget.classList.toggle("d-none");
  }
}
