---
layout: default
title: Alert
---

# Alert

Contextual feedback messages with icon, title, and description.

## Variants

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview" style="display:flex;flex-direction:column;gap:0.75rem">
    <div class="nano-alert" role="alert">
      <div class="nano-alert__icon">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><line x1="12" y1="16" x2="12" y2="12"/><line x1="12" y1="8" x2="12.01" y2="8"/></svg>
      </div>
      <div class="nano-alert__content">
        <p class="nano-alert__title">Heads up!</p>
        <p class="nano-alert__description">You can customize the color palette in base/03_colors.css.</p>
      </div>
    </div>
    <div class="nano-alert nano-alert--success" role="alert">
      <div class="nano-alert__icon">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/></svg>
      </div>
      <div class="nano-alert__content">
        <p class="nano-alert__title">Success!</p>
        <p class="nano-alert__description">Your changes have been saved.</p>
      </div>
    </div>
    <div class="nano-alert nano-alert--warning" role="alert">
      <div class="nano-alert__icon">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"/><line x1="12" y1="9" x2="12" y2="13"/><line x1="12" y1="17" x2="12.01" y2="17"/></svg>
      </div>
      <div class="nano-alert__content">
        <p class="nano-alert__title">Warning</p>
        <p class="nano-alert__description">Your session is about to expire.</p>
      </div>
    </div>
    <div class="nano-alert nano-alert--destructive" role="alert">
      <div class="nano-alert__icon">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><line x1="15" y1="9" x2="9" y2="15"/><line x1="9" y1="9" x2="15" y2="15"/></svg>
      </div>
      <div class="nano-alert__content">
        <p class="nano-alert__title">Error</p>
        <p class="nano-alert__description">Something went wrong. Please try again.</p>
      </div>
    </div>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;div class="nano-alert nano-alert--success" role="alert"&gt;
  &lt;div class="nano-alert__icon"&gt;
    &lt;svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
         viewBox="0 0 24 24" fill="none" stroke="currentColor"
         stroke-width="2" stroke-linecap="round" stroke-linejoin="round"&gt;
      &lt;path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/&gt;
      &lt;polyline points="22 4 12 14.01 9 11.01"/&gt;
    &lt;/svg&gt;
  &lt;/div&gt;
  &lt;div class="nano-alert__content"&gt;
    &lt;p class="nano-alert__title"&gt;Success!&lt;/p&gt;
    &lt;p class="nano-alert__description"&gt;Your changes have been saved.&lt;/p&gt;
  &lt;/div&gt;
&lt;/div&gt;

&lt;!-- Variants: nano-alert--success, nano-alert--warning, nano-alert--destructive --&gt;</code></pre>

  </div>
</div>
