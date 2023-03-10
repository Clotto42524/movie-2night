import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="set-decade"
export default class extends Controller {
  connect() {
    // console.log("connected")
  }

  toggleButton(event) {
    event.currentTarget.classList.toggle("active")
  }
}
