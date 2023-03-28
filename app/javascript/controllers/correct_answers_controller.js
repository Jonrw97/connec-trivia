import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="correct-answers"
export default class extends Controller {
  static targets = ["answers", "form", "answersdiv"];
  connect() {}
  send(event) {
    event.preventDefault();
    const form_data = new FormData(this.formTarget)
    console.log( form_data.getAll('user_choice[choice_id]') );

    fetch(this.formTarget.action, {
      method: "POST",
      headers: { Accept: "application/json" },
      body: new FormData(this.formTarget),
    })
      .then((response) => response.json())
      .then((data) => {
        if (data.inserted_item) {
          this.answersTarget.insertAdjacentHTML("beforeend", data.inserted_item);
        }
        this.answersdivTarget.classList.add("d-none");
      });
  }
}
