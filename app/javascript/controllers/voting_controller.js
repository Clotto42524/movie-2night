import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="voting"
export default class extends Controller {
  static targets = ["votes"]

  connect() {
  }

  downVote() {
    this.votesTarget.classList.add("d-none")
  }

  upVote() {
    this.votesTarget.classList.add("d-none")
  }

  redirectToVoting(event) {
    const id = event.target.id;
    window.location.assign(`/events/${id}/selected_movies`);
  }
}
