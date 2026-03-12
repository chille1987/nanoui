---
layout: default
title: Accordion
---

# Accordion

Collapsible content sections using native `<details>`/`<summary>`. Requires the `nanoui-accordion` Stimulus controller for single-open mode.

## Example

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview">
    <div class="nano-accordion">
      <details class="nano-accordion__item" open>
        <summary class="nano-accordion__trigger">
          <span>Is it free?</span>
          <svg class="nano-accordion__icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="m6 9 6 6 6-6"/></svg>
        </summary>
        <div class="nano-accordion__content">
          <p>Yes, NanoUI is MIT licensed and free to use.</p>
        </div>
      </details>
      <details class="nano-accordion__item">
        <summary class="nano-accordion__trigger">
          <span>Does it require a build step?</span>
          <svg class="nano-accordion__icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="m6 9 6 6 6-6"/></svg>
        </summary>
        <div class="nano-accordion__content">
          <p>No, it's vanilla CSS with optional Stimulus controllers.</p>
        </div>
      </details>
      <details class="nano-accordion__item">
        <summary class="nano-accordion__trigger">
          <span>Can I customize the colors?</span>
          <svg class="nano-accordion__icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="m6 9 6 6 6-6"/></svg>
        </summary>
        <div class="nano-accordion__content">
          <p>Yes, edit base/03_colors.css to change the entire palette.</p>
        </div>
      </details>
    </div>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;div class="nano-accordion"
     data-controller="nanoui-accordion"
     data-nanoui-accordion-single-value="true"&gt;

  &lt;details class="nano-accordion__item"
           data-nanoui-accordion-target="item"
           data-action="toggle-&gt;nanoui-accordion#toggle"
           open&gt;
    &lt;summary class="nano-accordion__trigger"&gt;
      &lt;span&gt;Is it free?&lt;/span&gt;
      &lt;svg class="nano-accordion__icon" ...&gt;&lt;path d="m6 9 6 6 6-6"/&gt;&lt;/svg&gt;
    &lt;/summary&gt;
    &lt;div class="nano-accordion__content"&gt;
      &lt;p&gt;Yes, NanoUI is MIT licensed and free to use.&lt;/p&gt;
    &lt;/div&gt;
  &lt;/details&gt;

  &lt;details class="nano-accordion__item" ...&gt;
    &lt;!-- more items --&gt;
  &lt;/details&gt;
&lt;/div&gt;</code></pre>

  </div>
</div>

### Stimulus controller

- **Targets:** `item` (`<details>` elements)
- **Values:** `single` (Boolean, default false — only one open at a time)
- **Actions:** `toggle(event)` — closes other items when single mode is enabled
- Uses native `<details>`/`<summary>` for built-in toggle behavior
