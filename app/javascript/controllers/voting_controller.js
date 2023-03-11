import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="voting"
export default class extends Controller {
  static targets = ["votes"]

  connect() {
  }

  downVote(event) {
    event.preventDefault()
    this.votesTargets.forEach((button) => {
      button.classList.add("disabled")
    })
  }

  upVote() {
    this.votesTargets.forEach((button) => {
      button.classList.add("disabled")
    })
  }
}
