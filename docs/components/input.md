---
layout: default
title: Input
---

# Input

Text inputs, email, password, and other text-like inputs are styled automatically. Use `.nano-input` for explicit styling or wrap in `.nano-field` for label + error layout.

## Default (native elements)

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview" style="display:flex;flex-direction:column;gap:0.5rem">
    <input type="text" placeholder="Text input">
    <input type="email" placeholder="Email input">
    <input type="password" placeholder="Password">
    <input type="number" placeholder="Number">
    <input type="date">
  </div>
  <div class="docs-example__code">

<pre><code>&lt;input type="text" placeholder="Text input"&gt;
&lt;input type="email" placeholder="Email input"&gt;
&lt;input type="password" placeholder="Password"&gt;
&lt;input type="number" placeholder="Number"&gt;
&lt;input type="date"&gt;</code></pre>

  </div>
</div>

## Textarea

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview">
    <textarea placeholder="Write your message..."></textarea>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;textarea placeholder="Write your message..."&gt;&lt;/textarea&gt;</code></pre>

  </div>
</div>

## Field with label and error

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview">
    <div class="nano-field">
      <label for="email-demo" class="nano-label nano-label--required">Email</label>
      <input id="email-demo" type="email" class="nano-input" aria-invalid="true" aria-describedby="email-error" placeholder="you@example.com">
      <p id="email-error" class="nano-field__error" role="alert">Email is required</p>
    </div>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;div class="nano-field"&gt;
  &lt;label for="email" class="nano-label nano-label--required"&gt;Email&lt;/label&gt;
  &lt;input id="email" type="email" class="nano-input"
         aria-invalid="true" aria-describedby="email-error"
         placeholder="you@example.com"&gt;
  &lt;p id="email-error" class="nano-field__error" role="alert"&gt;Email is required&lt;/p&gt;
&lt;/div&gt;</code></pre>

  </div>
</div>

## Input group

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview">
    <div class="nano-input-group">
      <input type="text" class="nano-input" placeholder="Search...">
      <button class="nano-btn nano-btn--primary">Search</button>
    </div>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;div class="nano-input-group"&gt;
  &lt;input type="text" class="nano-input" placeholder="Search..."&gt;
  &lt;button class="nano-btn nano-btn--primary"&gt;Search&lt;/button&gt;
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
    <input type="text" placeholder="Disabled input" disabled>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;input type="text" placeholder="Disabled input" disabled&gt;</code></pre>

  </div>
</div>
