import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["toggle"]
  static values = { collapsed: { type: Boolean, default: false } }

  connect() {
    if (this.collapsedValue) {
      this.element.classList.add("nano-sidebar--collapsed")
      this.#updateToggle(true)
    }
  }

  toggle() {
    const willCollapse = !this.element.classList.contains("nano-sidebar--collapsed")
    this.element.classList.toggle("nano-sidebar--collapsed")
    this.collapsedValue = willCollapse
    this.#updateToggle(willCollapse)
    this.dispatch(willCollapse ? "collapse" : "expand")
  }

  #updateToggle(collapsed) {
    if (this.hasToggleTarget) {
      this.toggleTarget.setAttribute("aria-expanded", String(!collapsed))
    }
  }
}
