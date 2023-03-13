import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"


// Connects to data-controller="event-subscription"
export default class extends Controller {
  static values = { eventId: Number }
  static targets = ["status"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "EventChannel", id: this.eventIdValue },
      { received: data => this.#findAndReplace(data) },
      // { received: data => this.statusTarget.insertAdjacentHTML("beforeend", data) }
    )
  }

  #findAndReplace(data) {
    let id = data["id"]
    let html_element = data["html_element"]
    let element = document.getElementById(`${id}`)
    // let request = document.getElementById(`request-${id}`)
    element.outerHTML = html_element
  }
}
