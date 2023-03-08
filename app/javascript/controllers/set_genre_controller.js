import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="set-genre"
export default class extends Controller {
  static targets = ["button"]
  connect() {
    console.log("connnected")
  }

  toggleButton(event) {
    event.currentTarget.classList.toggle("active")
  }
}
