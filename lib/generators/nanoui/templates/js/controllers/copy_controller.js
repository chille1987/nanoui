import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["source", "button", "idle", "copied"]
  static values = {
    text: String,
    resetMs: { type: Number, default: 2000 }
  }

  async copy(event) {
    event?.preventDefault()
    const text = this.#textToCopy()
    if (!text) return

    try {
      await navigator.clipboard.writeText(text)
    } catch (_err) {
      this.#fallbackCopy(text)
    }

    this.#markCopied()
    this.dispatch("copied", { detail: { text } })
  }

  #textToCopy() {
    if (this.hasTextValue && this.textValue) return this.textValue
    if (this.hasSourceTarget) {
      return this.sourceTarget.value ?? this.sourceTarget.textContent ?? ""
    }
    return this.element.textContent?.trim() ?? ""
  }

  #fallbackCopy(text) {
    const textarea = document.createElement("textarea")
    textarea.value = text
    textarea.setAttribute("readonly", "")
    textarea.style.position = "absolute"
    textarea.style.left = "-9999px"
    document.body.appendChild(textarea)
    textarea.select()
    try { document.execCommand("copy") } catch (_err) { /* noop */ }
    document.body.removeChild(textarea)
  }

  #markCopied() {
    const button = this.hasButtonTarget ? this.buttonTarget : this.element
    button.dataset.nanouiCopyCopied = "true"
    if (this.hasIdleTarget) this.idleTarget.hidden = true
    if (this.hasCopiedTarget) this.copiedTarget.hidden = false

    clearTimeout(this._resetTimer)
    this._resetTimer = setTimeout(() => this.#reset(button), this.resetMsValue)
  }

  #reset(button) {
    delete button.dataset.nanouiCopyCopied
    if (this.hasIdleTarget) this.idleTarget.hidden = false
    if (this.hasCopiedTarget) this.copiedTarget.hidden = true
  }

  disconnect() {
    clearTimeout(this._resetTimer)
  }
}
