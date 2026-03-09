import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["content"]
  static values = { delay: { type: Number, default: 200 } }

  connect() {
    this.timeout = null
    // Link trigger to tooltip for screen readers
    if (this.hasContentTarget && !this.contentTarget.id) {
      this.contentTarget.id = `tooltip-${Math.random().toString(36).slice(2, 9)}`
    }
    const trigger = this.element.querySelector("[data-tooltip-trigger]") || this.element.firstElementChild
    if (trigger && this.hasContentTarget) {
      trigger.setAttribute("aria-describedby", this.contentTarget.id)
    }
  }

  show() {
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      this.contentTarget.classList.add("is-open")
    }, this.delayValue)
  }

  hide() {
    clearTimeout(this.timeout)
    this.contentTarget.classList.remove("is-open")
  }

  disconnect() {
    clearTimeout(this.timeout)
  }
}
