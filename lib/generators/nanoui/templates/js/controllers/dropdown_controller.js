import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["trigger", "content"]

  connect() {
    this.handleOutsideClick = this.handleOutsideClick.bind(this)
    this.handleKeydown = this.handleKeydown.bind(this)
    this.syncTriggerState(false)
  }

  toggle() {
    if (this.contentTarget.classList.contains("is-open")) {
      this.close()
    } else {
      this.open()
    }
  }

  open() {
    if (this.contentTarget.classList.contains("is-open")) return

    this.contentTarget.classList.add("is-open")
    this.syncTriggerState(true)
    document.addEventListener("click", this.handleOutsideClick)
    document.addEventListener("keydown", this.handleKeydown)
    this.dispatch("open")
  }

  close() {
    if (!this.contentTarget.classList.contains("is-open")) return

    this.contentTarget.classList.remove("is-open")
    this.syncTriggerState(false)
    document.removeEventListener("click", this.handleOutsideClick)
    document.removeEventListener("keydown", this.handleKeydown)
    this.dispatch("close")
  }

  activateTrigger(event) {
    if (event.target !== this.triggerTarget) return
    if (event.key !== "Enter" && event.key !== " ") return

    event.preventDefault()
    this.toggle()
  }

  handleOutsideClick(event) {
    if (!this.element.contains(event.target)) {
      this.close()
    }
  }

  handleKeydown(event) {
    if (event.key === "Escape") {
      this.close()
      this.triggerElement.focus()
      return
    }

    if (event.key === "ArrowDown" || event.key === "ArrowUp") {
      event.preventDefault()
      const items = [...this.contentTarget.querySelectorAll(
        ".nano-dropdown__item:not([disabled]):not([aria-disabled='true'])"
      )]
      if (!items.length) return

      const current = items.indexOf(document.activeElement)
      let next
      if (event.key === "ArrowDown") {
        next = current < items.length - 1 ? current + 1 : 0
      } else {
        next = current > 0 ? current - 1 : items.length - 1
      }
      items[next].focus()
    }
  }

  disconnect() {
    document.removeEventListener("click", this.handleOutsideClick)
    document.removeEventListener("keydown", this.handleKeydown)
  }

  get triggerElement() {
    return this.triggerTarget.querySelector("[data-dropdown-trigger]") ||
      this.triggerTarget.querySelector("button, [href], input, select, textarea, [tabindex]:not([tabindex='-1'])") ||
      this.triggerTarget
  }

  syncTriggerState(expanded) {
    const trigger = this.triggerElement

    trigger.setAttribute("aria-expanded", String(expanded))
    trigger.setAttribute("aria-haspopup", "menu")

    if (trigger === this.triggerTarget) {
      this.triggerTarget.setAttribute("role", "button")
      this.triggerTarget.setAttribute("tabindex", "0")
    }
  }
}
