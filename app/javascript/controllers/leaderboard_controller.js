import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="leaderboard"
export default class extends Controller {
  static targets = ["todaybutton", "yesterdaybutton", "today", "yesterday"];
  connect() {
    this.todaybuttonTarget.classList.add("selected-day");
  }

  today() {
    this.yesterdaybuttonTarget.classList.remove("selected-day");
    this.todaybuttonTarget.classList.add("selected-day");
    this.todayTarget.classList.remove("d-none");
    this.yesterdayTarget.classList.add("d-none");
  }

  yesterday() {
    this.todaybuttonTarget.classList.remove("selected-day");
    this.yesterdaybuttonTarget.classList.add("selected-day");
    this.yesterdayTarget.classList.remove("d-none");
    this.todayTarget.classList.add("d-none");
  }
}
