import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["links", "toggle"]

  connect() {
    this.handleOutsideClick = this.handleOutsideClick.bind(this)
    this.handleKeydown = this.handleKeydown.bind(this)
    this.handleResize = this.handleResize.bind(this)
    window.addEventListener("resize", this.handleResize)
  }

  toggle() {
    if (this.linksTarget.classList.contains("is-open")) {
      this.close()
    } else {
      this.open()
    }
  }

  open() {
    if (this.linksTarget.classList.contains("is-open")) return

    this.linksTarget.classList.add("is-open")
    this.syncToggleState(true)
    document.addEventListener("click", this.handleOutsideClick)
    document.addEventListener("keydown", this.handleKeydown)
    this.dispatch("open")
  }

  close() {
    if (!this.linksTarget.classList.contains("is-open")) return

    this.linksTarget.classList.remove("is-open")
    this.syncToggleState(false)
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
      if (this.hasToggleTarget) this.toggleTarget.focus()
    }
  }

  handleResize() {
    if (window.innerWidth > 768) {
      this.close()
    }
  }

  disconnect() {
    document.removeEventListener("click", this.handleOutsideClick)
    document.removeEventListener("keydown", this.handleKeydown)
    window.removeEventListener("resize", this.handleResize)
  }

  syncToggleState(expanded) {
    if (!this.hasToggleTarget) return
    this.toggleTarget.setAttribute("aria-expanded", String(expanded))
  }
}
