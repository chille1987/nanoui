---
layout: default
title: Copy to clipboard
---

# Copy to clipboard

A button (or button + value field) that copies text to the user's clipboard. Uses the native Clipboard API with a `document.execCommand` fallback for older browsers. Requires the `nanoui-copy` Stimulus controller.

## Value + button

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview">
    <div class="nano-copy" data-controller="nanoui-copy">
      <span class="nano-copy__value" data-nanoui-copy-target="source">https://app.example.com/webhooks/stripe</span>
      <button class="nano-copy__button"
              data-nanoui-copy-target="button"
              data-action="nanoui-copy#copy"
              type="button">
        <span data-nanoui-copy-target="idle">Copy</span>
        <span data-nanoui-copy-target="copied" hidden>Copied</span>
      </button>
    </div>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;div class="nano-copy" data-controller="nanoui-copy"&gt;
  &lt;span class="nano-copy__value" data-nanoui-copy-target="source"&gt;
    https://app.example.com/webhooks/stripe
  &lt;/span&gt;
  &lt;button class="nano-copy__button"
          data-nanoui-copy-target="button"
          data-action="nanoui-copy#copy"
          type="button"&gt;
    &lt;span data-nanoui-copy-target="idle"&gt;Copy&lt;/span&gt;
    &lt;span data-nanoui-copy-target="copied" hidden&gt;Copied&lt;/span&gt;
  &lt;/button&gt;
&lt;/div&gt;</code></pre>

  </div>
</div>

## Static text value

Pass the text via `data-nanoui-copy-text-value` when there's no source element to read from.

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview">
    <button class="nano-btn nano-btn--outline"
            data-controller="nanoui-copy"
            data-nanoui-copy-text-value="sk_test_1234567890"
            data-action="nanoui-copy#copy"
            type="button">
      Copy API key
    </button>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;button class="nano-btn nano-btn--outline"
        data-controller="nanoui-copy"
        data-nanoui-copy-text-value="sk_test_1234567890"
        data-action="nanoui-copy#copy"
        type="button"&gt;
  Copy API key
&lt;/button&gt;</code></pre>

  </div>
</div>

## Events

The controller dispatches `nanoui-copy:copied` on successful copy with `{ text }` in the event detail.

## Targets

- `source` — element whose `value` (input) or `textContent` will be copied
- `button` — button that receives the `data-nanoui-copy-copied` attribute during the success state
- `idle` / `copied` — optional label elements swapped during the success state

## Values

- `text` (String) — explicit text to copy (overrides `source` target)
- `resetMs` (Number, default `2000`) — how long to show the copied state before reverting
