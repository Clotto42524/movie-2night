import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="voting"
export default class extends Controller {
  static targets = ["votes"]

  connect() {
  }

  vote(event) {
    event.preventDefault()
    this.voteTarget.classList.remove("btn btn-primary")
    this.voteTarget.classList.add("btn btn-primary disabled")
  }
}
