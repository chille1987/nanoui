import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  toggle() {
    const checked = this.element.getAttribute("aria-checked") === "true"
    const newState = !checked
    this.element.setAttribute("aria-checked", String(newState))
    this.dispatch("toggle", { detail: { checked: newState } })
  }
}
