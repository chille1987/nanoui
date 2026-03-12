---
layout: default
title: Tooltip
---

# Tooltip

A small popup that appears on hover/focus. Requires the `nanoui-tooltip` Stimulus controller.

## Positions

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview" style="display:flex;gap:2rem;padding:3rem 1rem;justify-content:center;flex-wrap:wrap">
    <div class="nano-tooltip nano-tooltip--top" onmouseenter="this.classList.add('is-open')" onmouseleave="this.classList.remove('is-open')">
      <button class="nano-btn nano-btn--outline nano-btn--sm" type="button">Top</button>
      <div class="nano-tooltip__content" role="tooltip">Tooltip on top</div>
    </div>
    <div class="nano-tooltip nano-tooltip--bottom" onmouseenter="this.classList.add('is-open')" onmouseleave="this.classList.remove('is-open')">
      <button class="nano-btn nano-btn--outline nano-btn--sm" type="button">Bottom</button>
      <div class="nano-tooltip__content" role="tooltip">Tooltip on bottom</div>
    </div>
    <div class="nano-tooltip nano-tooltip--left" onmouseenter="this.classList.add('is-open')" onmouseleave="this.classList.remove('is-open')">
      <button class="nano-btn nano-btn--outline nano-btn--sm" type="button">Left</button>
      <div class="nano-tooltip__content" role="tooltip">Tooltip on left</div>
    </div>
    <div class="nano-tooltip nano-tooltip--right" onmouseenter="this.classList.add('is-open')" onmouseleave="this.classList.remove('is-open')">
      <button class="nano-btn nano-btn--outline nano-btn--sm" type="button">Right</button>
      <div class="nano-tooltip__content" role="tooltip">Tooltip on right</div>
    </div>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;div class="nano-tooltip nano-tooltip--top"
     data-controller="nanoui-tooltip"
     data-nanoui-tooltip-delay-value="200"
     data-action="mouseenter-&gt;nanoui-tooltip#show mouseleave-&gt;nanoui-tooltip#hide
                  focusin-&gt;nanoui-tooltip#show focusout-&gt;nanoui-tooltip#hide"&gt;

  &lt;button class="nano-btn nano-btn--outline nano-btn--sm"&gt;Hover me&lt;/button&gt;

  &lt;div class="nano-tooltip__content" role="tooltip"&gt;
    Save your progress
  &lt;/div&gt;
&lt;/div&gt;</code></pre>

  </div>
</div>

### Positions

Add `nano-tooltip--top` (default), `nano-tooltip--bottom`, `nano-tooltip--left`, or `nano-tooltip--right`.

### Stimulus controller

- **Values:** `delay` (Number, default 200ms)
- **Actions:** `show()`, `hide()`
- Shows on hover and focus, hides on mouseleave and blur
