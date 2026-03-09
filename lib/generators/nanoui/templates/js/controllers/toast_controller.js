import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["item"]
  static values = { duration: { type: Number, default: 5000 } }

  itemTargetConnected(element) {
    if (this.durationValue > 0) {
      const timer = setTimeout(() => {
        this.dismissElement(element)
      }, this.durationValue)
      element.dataset.nanouiToastTimer = timer
    }
  }

  dismiss(event) {
    const item = this.itemTargets.find((target) =>
      target.contains(event.target)
    )
    if (item) {
      clearTimeout(Number(item.dataset.nanouiToastTimer))
      this.dismissElement(item)
    }
  }

  dismissElement(element) {
    element.classList.add("is-dismissing")
    element.addEventListener("animationend", () => {
      this.dispatch("dismissed", { detail: { element } })
      element.remove()
    }, { once: true })
  }

  disconnect() {
    this.itemTargets.forEach((item) => {
      clearTimeout(Number(item.dataset.nanouiToastTimer))
    })
  }
}
