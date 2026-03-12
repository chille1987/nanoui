---
layout: default
title: Switch
---

# Switch

Toggle switch using a button with `role="switch"`. Requires the `nanoui-switch` Stimulus controller.

## Default

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview" style="display:flex;gap:1.5rem;align-items:center;flex-wrap:wrap">
    <div style="display:flex;align-items:center;gap:0.5rem">
      <button type="button" class="nano-switch" role="switch" aria-checked="false" onclick="var c=this.getAttribute('aria-checked')==='true';this.setAttribute('aria-checked',String(!c))">
        <span class="nano-switch__thumb"></span>
      </button>
      <span>Off</span>
    </div>
    <div style="display:flex;align-items:center;gap:0.5rem">
      <button type="button" class="nano-switch" role="switch" aria-checked="true" onclick="var c=this.getAttribute('aria-checked')==='true';this.setAttribute('aria-checked',String(!c))">
        <span class="nano-switch__thumb"></span>
      </button>
      <span>On</span>
    </div>
    <div style="display:flex;align-items:center;gap:0.5rem">
      <button type="button" class="nano-switch" role="switch" aria-checked="false" disabled>
        <span class="nano-switch__thumb"></span>
      </button>
      <span style="opacity:0.5">Disabled</span>
    </div>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;button type="button"
        class="nano-switch"
        role="switch"
        aria-checked="false"
        data-controller="nanoui-switch"
        data-action="nanoui-switch#toggle"&gt;
  &lt;span class="nano-switch__thumb"&gt;&lt;/span&gt;
  &lt;span class="nano-sr-only"&gt;Enable notifications&lt;/span&gt;
&lt;/button&gt;</code></pre>

  </div>
</div>

### Stimulus controller

The `nanoui-switch` controller toggles `aria-checked` between `"true"` and `"false"` and dispatches a `toggle` event with `detail.checked`.
