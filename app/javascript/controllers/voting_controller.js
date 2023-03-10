import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="voting"
export default class extends Controller {
  static targets = ["votes"]

  connect() {
  }

  vote(event) {
    event.preventDefault()
    this.votesTargets.forEach((button) => {
      button.classList.add("disabled")
    })
  }
}
