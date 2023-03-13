import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="set-decade"
export default class extends Controller {
  connect() {
  }

  toggleButton(event) {
    event.currentTarget.classList.toggle("active")
  }
}
