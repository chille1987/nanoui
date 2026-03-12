---
layout: default
title: Select
---

# Select

Select dropdowns are styled automatically on `<select>` elements, with a custom chevron icon.

## Default (native element)

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview">
    <select>
      <option value="">Choose a country...</option>
      <option value="us">United States</option>
      <option value="ca">Canada</option>
      <option value="uk">United Kingdom</option>
    </select>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;select&gt;
  &lt;option value=""&gt;Choose a country...&lt;/option&gt;
  &lt;option value="us"&gt;United States&lt;/option&gt;
  &lt;option value="ca"&gt;Canada&lt;/option&gt;
  &lt;option value="uk"&gt;United Kingdom&lt;/option&gt;
&lt;/select&gt;</code></pre>

  </div>
</div>

## With field wrapper

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview">
    <div class="nano-field">
      <label for="country-demo" class="nano-label nano-label--required">Country</label>
      <select id="country-demo" class="nano-select" required>
        <option value="" disabled selected>Select a country</option>
        <option value="us">United States</option>
        <option value="ca">Canada</option>
      </select>
    </div>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;div class="nano-field"&gt;
  &lt;label for="country" class="nano-label nano-label--required"&gt;Country&lt;/label&gt;
  &lt;select id="country" class="nano-select" required&gt;
    &lt;option value="" disabled selected&gt;Select a country&lt;/option&gt;
    &lt;option value="us"&gt;United States&lt;/option&gt;
    &lt;option value="ca"&gt;Canada&lt;/option&gt;
  &lt;/select&gt;
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
    <select disabled>
      <option>Disabled</option>
    </select>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;select disabled&gt;
  &lt;option&gt;Disabled&lt;/option&gt;
&lt;/select&gt;</code></pre>

  </div>
</div>
