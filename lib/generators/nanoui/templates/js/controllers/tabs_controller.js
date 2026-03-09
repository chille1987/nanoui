import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["tab", "panel"]
  static values = { hash: { type: Boolean, default: false } }

  connect() {
    // Restore from URL hash if enabled
    if (this.hashValue && window.location.hash) {
      const hash = window.location.hash.slice(1)
      const tab = this.tabTargets.find(t => t.getAttribute("aria-controls") === hash)
      if (tab) {
        this.selectTab(tab)
        return
      }
    }
    // Ensure initial state is correct
    const active = this.tabTargets.find(t => t.getAttribute("aria-selected") === "true")
    if (active) this.selectTab(active)
  }

  select(event) {
    this.selectTab(event.currentTarget)
  }

  navigate(event) {
    const tabs = this.tabTargets
    const current = tabs.indexOf(event.currentTarget)
    let next

    if (event.key === "ArrowRight") {
      next = current < tabs.length - 1 ? current + 1 : 0
    } else if (event.key === "ArrowLeft") {
      next = current > 0 ? current - 1 : tabs.length - 1
    } else if (event.key === "Home") {
      next = 0
    } else if (event.key === "End") {
      next = tabs.length - 1
    } else {
      return
    }

    event.preventDefault()
    this.selectTab(tabs[next])
    tabs[next].focus()
  }

  selectTab(tab) {
    // Deactivate all
    this.tabTargets.forEach(t => {
      t.setAttribute("aria-selected", "false")
      t.setAttribute("tabindex", "-1")
    })
    this.panelTargets.forEach(p => {
      p.hidden = true
    })

    // Activate selected
    tab.setAttribute("aria-selected", "true")
    tab.removeAttribute("tabindex")
    const panelId = tab.getAttribute("aria-controls")
    const panel = this.panelTargets.find(p => p.id === panelId)
    if (panel) panel.hidden = false

    // Update URL hash
    if (this.hashValue && panelId) {
      history.replaceState(null, "", `#${panelId}`)
    }

    this.dispatch("change", { detail: { tab, panel } })
  }
}
