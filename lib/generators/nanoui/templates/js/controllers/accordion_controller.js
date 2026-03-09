import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["item"]
  static values = { single: { type: Boolean, default: false } }

  toggle(event) {
    if (!this.singleValue) return

    const current = event.currentTarget.closest("[data-accordion-target='item']")
    // If the item is being opened (it wasn't open before the click), close others
    // Native <details> toggles open before this event fires, so check if it's now open
    if (current && current.open) {
      this.itemTargets.forEach(item => {
        if (item !== current && item.open) {
          item.open = false
        }
      })
    }
  }
}
