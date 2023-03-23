import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["friend"];
  connect() {
    console.log(this.friendTarget);
  }
}
