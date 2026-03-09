import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal"]

  open() {
    this.modalTarget.showModal()
    // Force reflow for transition
    this.modalTarget.offsetHeight
    this.modalTarget.classList.add("is-open")
    this.dispatch("open")
  }

  close() {
    this.modalTarget.classList.remove("is-open")
    this.modalTarget.addEventListener("transitionend", () => {
      this.modalTarget.close()
      this.dispatch("close")
    }, { once: true })
  }

  // Close on backdrop click (click on <dialog> itself, not its content)
  clickBackdrop(event) {
    if (event.target === this.modalTarget) {
      this.close()
    }
  }

  // Native <dialog> fires "cancel" on Escape — sync our class
  cancel(event) {
    event.preventDefault()
    this.close()
  }

  disconnect() {
    if (this.modalTarget.open) {
      this.modalTarget.close()
    }
  }
}
