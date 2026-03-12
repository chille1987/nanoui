---
layout: default
title: Button
---

# Button

Buttons are styled automatically on `<button>`, `<input type="submit">`, and elements with `.nano-btn`. The default style is primary.

## Default (native elements)

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview" style="display:flex; gap:0.5rem; flex-wrap:wrap; align-items:center">
    <button>Button</button>
    <input type="submit" value="Submit">
    <input type="button" value="Click me">
    <input type="reset" value="Reset">
  </div>
  <div class="docs-example__code">

<pre><code>&lt;button&gt;Button&lt;/button&gt;
&lt;input type="submit" value="Submit"&gt;
&lt;input type="button" value="Click me"&gt;
&lt;input type="reset" value="Reset"&gt;</code></pre>

  </div>
</div>

## Variants

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview" style="display:flex; gap:0.5rem; flex-wrap:wrap; align-items:center">
    <button class="nano-btn nano-btn--primary">Primary</button>
    <button class="nano-btn nano-btn--secondary">Secondary</button>
    <button class="nano-btn nano-btn--destructive">Destructive</button>
    <button class="nano-btn nano-btn--outline">Outline</button>
    <button class="nano-btn nano-btn--ghost">Ghost</button>
    <button class="nano-btn nano-btn--link">Link</button>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;button class="nano-btn nano-btn--primary"&gt;Primary&lt;/button&gt;
&lt;button class="nano-btn nano-btn--secondary"&gt;Secondary&lt;/button&gt;
&lt;button class="nano-btn nano-btn--destructive"&gt;Destructive&lt;/button&gt;
&lt;button class="nano-btn nano-btn--outline"&gt;Outline&lt;/button&gt;
&lt;button class="nano-btn nano-btn--ghost"&gt;Ghost&lt;/button&gt;
&lt;button class="nano-btn nano-btn--link"&gt;Link&lt;/button&gt;</code></pre>

  </div>
</div>

## Sizes

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview" style="display:flex; gap:0.5rem; flex-wrap:wrap; align-items:center">
    <button class="nano-btn nano-btn--primary nano-btn--sm">Small</button>
    <button class="nano-btn nano-btn--primary">Default</button>
    <button class="nano-btn nano-btn--primary nano-btn--lg">Large</button>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;button class="nano-btn nano-btn--primary nano-btn--sm"&gt;Small&lt;/button&gt;
&lt;button class="nano-btn nano-btn--primary"&gt;Default&lt;/button&gt;
&lt;button class="nano-btn nano-btn--primary nano-btn--lg"&gt;Large&lt;/button&gt;</code></pre>

  </div>
</div>

## Disabled

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview" style="display:flex; gap:0.5rem; flex-wrap:wrap; align-items:center">
    <button disabled>Disabled</button>
    <button class="nano-btn nano-btn--outline" disabled>Disabled outline</button>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;button disabled&gt;Disabled&lt;/button&gt;
&lt;button class="nano-btn nano-btn--outline" disabled&gt;Disabled outline&lt;/button&gt;</code></pre>

  </div>
</div>

## As link

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview">
    <a href="#" class="nano-btn nano-btn--primary">Link button</a>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;a href="/about" class="nano-btn nano-btn--primary"&gt;Link button&lt;/a&gt;</code></pre>

  </div>
</div>
