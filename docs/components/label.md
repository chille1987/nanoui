---
layout: default
title: Label
---

# Label

Labels are styled automatically on `<label>` elements. Use `.nano-label--required` to show a red asterisk.

## Default (native element)

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview">
    <label for="name-demo">Name</label>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;label for="name"&gt;Name&lt;/label&gt;</code></pre>

  </div>
</div>

## Required

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview">
    <label class="nano-label nano-label--required">Email</label>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;label class="nano-label nano-label--required"&gt;Email&lt;/label&gt;</code></pre>

  </div>
</div>

## With input

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview">
    <div class="nano-field">
      <label for="username-demo">Username</label>
      <input id="username-demo" type="text" placeholder="Enter username">
    </div>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;div class="nano-field"&gt;
  &lt;label for="username"&gt;Username&lt;/label&gt;
  &lt;input id="username" type="text" placeholder="Enter username"&gt;
&lt;/div&gt;</code></pre>

  </div>
</div>
