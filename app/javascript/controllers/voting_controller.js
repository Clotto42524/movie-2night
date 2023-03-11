import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="voting"
export default class extends Controller {
  static targets = ["votes"]

  connect() {
  }

  downVote(event) {
    event.preventDefault()
    this.votesTarget.classList.add("d-none")
  }

  upVote() {
    this.votesTarget.classList.add("d-none")
  }
}
