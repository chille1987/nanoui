import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["header", "body", "row"]
  static values = {
    server: { type: Boolean, default: false }
  }

  connect() {
    this.headerTargets.forEach((header) => {
      if (!header.hasAttribute("aria-sort")) {
        header.setAttribute("aria-sort", "none")
      }
    })
  }

  sort(event) {
    const header = event.currentTarget.closest("[data-nanoui-data-table-target='header']")
    if (!header) return

    const current = header.getAttribute("aria-sort") || "none"
    const next = current === "ascending" ? "descending" : "ascending"

    this.headerTargets.forEach((h) => {
      if (h !== header) h.setAttribute("aria-sort", "none")
    })
    header.setAttribute("aria-sort", next)

    this.dispatch("sort", {
      detail: {
        key: header.dataset.sortKey ?? header.textContent.trim(),
        direction: next
      }
    })

    if (this.serverValue) return

    this.#sortLocally(header, next)
  }

  #sortLocally(header, direction) {
    const index = this.headerTargets.indexOf(header)
    if (index < 0 || !this.hasBodyTarget) return

    const type = header.dataset.sortType || "string"
    const rows = Array.from(this.rowTargets)
    const factor = direction === "ascending" ? 1 : -1

    rows.sort((a, b) => {
      const av = this.#cellValue(a, index, type)
      const bv = this.#cellValue(b, index, type)
      if (av < bv) return -1 * factor
      if (av > bv) return 1 * factor
      return 0
    })

    rows.forEach((row) => this.bodyTarget.appendChild(row))
  }

  #cellValue(row, index, type) {
    const cell = row.children[index]
    if (!cell) return ""
    const raw = cell.dataset.sortValue ?? cell.textContent.trim()

    if (type === "number") {
      const n = parseFloat(raw.replace(/[^0-9.\-]/g, ""))
      return Number.isNaN(n) ? 0 : n
    }
    if (type === "date") {
      const d = Date.parse(raw)
      return Number.isNaN(d) ? 0 : d
    }
    return raw.toLowerCase()
  }
}
