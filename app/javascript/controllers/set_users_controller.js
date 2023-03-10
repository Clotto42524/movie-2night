import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="set-users"
export default class extends Controller {
  static targets = ["button"]

  connect() {
    console.log("Users controller connected")
  }

  toggleButton(event) {
    event.target.classList.toggle("active");
  }
}
