import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="set-decade"
export default class extends Controller {

  connect() {
  }

  toggleButton(event) {
    this.currentTarget.classList.toggle("active")
  }
}
