import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="countdown"
export default class extends Controller {
  static targets = ["countdown"];

  connect() {
    const today = new Date();
    const tomorrow = new Date(today);
    tomorrow.setDate(tomorrow.getDate() + 1);
    tomorrow.setHours(0, 0, 0, 0);
    this.secondsUntilEnd = tomorrow.getTime() / 1000 - today.getTime() / 1000;

    const now = new Date().getTime();
    this.endTime = new Date(now + this.secondsUntilEnd * 1000);

    this.countdown = setInterval(this.countdown.bind(this), 250);
  }

  countdown() {
    const now = new Date();
    const secondsRemaining = (this.endTime - now) / 1000;

    if (secondsRemaining <= 0) {
      clearInterval(this.countdown);
      this.countdownTarget.innerHTML = "Questions are Loading..";
      return;
    }

    const secondsPerDay = 86400;
    const secondsPerHour = 3600;
    const secondsPerMinute = 60;
    const hours = Math.floor((secondsRemaining % secondsPerDay) / secondsPerHour);
    const minutes = Math.floor((secondsRemaining % secondsPerHour) / secondsPerMinute);
    const seconds = Math.floor(secondsRemaining % secondsPerMinute);

    this.countdownTarget.innerHTML = `New Questions in ${hours}H ${minutes}M ${seconds}S`;
  }
}
