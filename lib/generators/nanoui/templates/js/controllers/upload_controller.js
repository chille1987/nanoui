import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [
    "input",
    "dropzone",
    "preview",
    "thumbnail",
    "name",
    "size",
    "error"
  ]

  static values = {
    accept: String,
    maxSize: { type: Number, default: 0 }
  }

  connect() {
    this.#setState(this.hasInputTarget && this.inputTarget.files.length > 0 ? "filled" : "empty")
  }

  openPicker(event) {
    if (event?.target?.closest("button")) return
    event?.preventDefault()
    this.inputTarget?.click()
  }

  onChange() {
    const file = this.inputTarget?.files?.[0]
    if (!file) {
      this.#setState("empty")
      return
    }
    this.#consumeFile(file)
  }

  onDragover(event) {
    event.preventDefault()
    this.#setState("dragover")
  }

  onDragleave(event) {
    event.preventDefault()
    this.#setState(this.inputTarget?.files?.length ? "filled" : "empty")
  }

  onDrop(event) {
    event.preventDefault()
    const file = event.dataTransfer?.files?.[0]
    if (!file) {
      this.#setState("empty")
      return
    }

    if (this.hasInputTarget) {
      const dt = new DataTransfer()
      dt.items.add(file)
      this.inputTarget.files = dt.files
    }
    this.#consumeFile(file)
  }

  remove(event) {
    event?.preventDefault()
    if (this.hasInputTarget) this.inputTarget.value = ""
    this.#clearError()
    this.#setState("empty")
    this.dispatch("removed")
  }

  #consumeFile(file) {
    const error = this.#validate(file)
    if (error) {
      this.#showError(error)
      this.remove()
      return
    }
    this.#clearError()

    if (this.hasNameTarget) this.nameTarget.textContent = file.name
    if (this.hasSizeTarget) this.sizeTarget.textContent = this.#formatSize(file.size)

    if (this.hasThumbnailTarget && file.type.startsWith("image/")) {
      const reader = new FileReader()
      reader.onload = (e) => { this.thumbnailTarget.src = e.target.result }
      reader.readAsDataURL(file)
    }

    this.#setState("filled")
    this.dispatch("selected", { detail: { file } })
  }

  #validate(file) {
    if (this.maxSizeValue && file.size > this.maxSizeValue) {
      return `File is too large. Max ${this.#formatSize(this.maxSizeValue)}.`
    }
    if (this.hasAcceptValue && this.acceptValue) {
      const accepted = this.acceptValue.split(",").map((s) => s.trim()).filter(Boolean)
      const ok = accepted.some((pattern) => {
        if (pattern.startsWith(".")) {
          return file.name.toLowerCase().endsWith(pattern.toLowerCase())
        }
        if (pattern.endsWith("/*")) {
          return file.type.startsWith(pattern.slice(0, -1))
        }
        return file.type === pattern
      })
      if (!ok) return "File type not allowed."
    }
    return null
  }

  #formatSize(bytes) {
    if (bytes < 1024) return `${bytes} B`
    if (bytes < 1024 * 1024) return `${(bytes / 1024).toFixed(1)} KB`
    return `${(bytes / (1024 * 1024)).toFixed(1)} MB`
  }

  #setState(state) {
    this.element.dataset.state = state
  }

  #showError(message) {
    if (this.hasErrorTarget) {
      this.errorTarget.textContent = message
      this.errorTarget.hidden = false
    }
  }

  #clearError() {
    if (this.hasErrorTarget) {
      this.errorTarget.textContent = ""
      this.errorTarget.hidden = true
    }
  }
}
