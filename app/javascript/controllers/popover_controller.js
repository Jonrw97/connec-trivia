// app/javascript/controllers/popover_controller.js
import { Controller } from "@hotwired/stimulus";
import { Popover } from "bootstrap/dist/js/bootstrap.bundle.js";

export default class extends Controller {
  connect() {
    new Popover(this.element);
  }
}
