import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="menubar-select"
export default class extends Controller {
  static targets = ["item", "loading"];
  connect() {}

  select(event) {
    this.itemTargets.forEach((item) => {
      item.classList.remove("selected-menubar-item");
    });
    event.target.classList.add("selected-menubar-item");
    setTimeout(() => {
      this.loadingTarget.classList.remove("d-none");
    }, 500);
  }
}
