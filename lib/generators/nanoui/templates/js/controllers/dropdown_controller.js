import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["trigger", "content"]

  connect() {
    this.handleOutsideClick = this.handleOutsideClick.bind(this)
    this.handleKeydown = this.handleKeydown.bind(this)
  }

  toggle() {
    if (this.contentTarget.classList.contains("is-open")) {
      this.close()
    } else {
      this.open()
    }
  }

  open() {
    this.contentTarget.classList.add("is-open")
    this.triggerTarget.setAttribute("aria-expanded", "true")
    document.addEventListener("click", this.handleOutsideClick)
    document.addEventListener("keydown", this.handleKeydown)
    this.dispatch("open")
  }

  close() {
    this.contentTarget.classList.remove("is-open")
    this.triggerTarget.setAttribute("aria-expanded", "false")
    document.removeEventListener("click", this.handleOutsideClick)
    document.removeEventListener("keydown", this.handleKeydown)
    this.dispatch("close")
  }

  handleOutsideClick(event) {
    if (!this.element.contains(event.target)) {
      this.close()
    }
  }

  handleKeydown(event) {
    if (event.key === "Escape") {
      this.close()
      this.triggerTarget.focus()
      return
    }

    if (event.key === "ArrowDown" || event.key === "ArrowUp") {
      event.preventDefault()
      const items = [...this.contentTarget.querySelectorAll(
        ".dropdown__item:not([disabled]):not([aria-disabled='true'])"
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
}
