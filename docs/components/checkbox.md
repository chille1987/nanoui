---
layout: default
title: Checkbox
---

# Checkbox

Custom-styled checkbox using BEM markup. Requires specific HTML structure with hidden input + label.

## Default

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview">
    <div class="nano-checkbox">
      <input type="checkbox" id="terms-demo" class="nano-checkbox__input" name="terms">
      <label for="terms-demo" class="nano-checkbox__label">I accept the terms of service</label>
    </div>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;div class="nano-checkbox"&gt;
  &lt;input type="checkbox" id="terms" class="nano-checkbox__input" name="terms"&gt;
  &lt;label for="terms" class="nano-checkbox__label"&gt;I accept the terms of service&lt;/label&gt;
&lt;/div&gt;</code></pre>

  </div>
</div>

## Checked

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview">
    <div class="nano-checkbox">
      <input type="checkbox" id="newsletter-demo" class="nano-checkbox__input" name="newsletter" checked>
      <label for="newsletter-demo" class="nano-checkbox__label">Subscribe to newsletter</label>
    </div>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;div class="nano-checkbox"&gt;
  &lt;input type="checkbox" id="newsletter" class="nano-checkbox__input" name="newsletter" checked&gt;
  &lt;label for="newsletter" class="nano-checkbox__label"&gt;Subscribe to newsletter&lt;/label&gt;
&lt;/div&gt;</code></pre>

  </div>
</div>

## Disabled

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview">
    <div class="nano-checkbox">
      <input type="checkbox" id="disabled-demo" class="nano-checkbox__input" disabled>
      <label for="disabled-demo" class="nano-checkbox__label">Disabled checkbox</label>
    </div>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;div class="nano-checkbox"&gt;
  &lt;input type="checkbox" id="disabled" class="nano-checkbox__input" disabled&gt;
  &lt;label for="disabled" class="nano-checkbox__label"&gt;Disabled checkbox&lt;/label&gt;
&lt;/div&gt;</code></pre>

  </div>
</div>
