---
layout: default
title: Empty state
---

# Empty state

A centered layout for "no data yet" or "get started" screens. Supports an icon, title, description, and optional action buttons.

## Basic empty state

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview">
    <div class="nano-empty">
      <div class="nano-empty__icon">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M22 12h-4l-3 9L9 3l-3 9H2"/></svg>
      </div>
      <h3 class="nano-empty__title">No failed payments yet</h3>
      <p class="nano-empty__description">When Stripe reports a failed charge we'll queue retries and show them here.</p>
      <div class="nano-empty__actions">
        <button class="nano-btn nano-btn--primary">Connect Stripe</button>
        <button class="nano-btn nano-btn--outline">Learn more</button>
      </div>
    </div>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;div class="nano-empty"&gt;
  &lt;div class="nano-empty__icon"&gt;&lt;svg ...&gt;&lt;/svg&gt;&lt;/div&gt;
  &lt;h3 class="nano-empty__title"&gt;No failed payments yet&lt;/h3&gt;
  &lt;p class="nano-empty__description"&gt;When Stripe reports a failed charge we'll queue retries and show them here.&lt;/p&gt;
  &lt;div class="nano-empty__actions"&gt;
    &lt;button class="nano-btn nano-btn--primary"&gt;Connect Stripe&lt;/button&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>

  </div>
</div>

## Bordered (dashed outline)

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview">
    <div class="nano-empty nano-empty--bordered">
      <h3 class="nano-empty__title">Nothing here</h3>
      <p class="nano-empty__description">Add your first item to get started.</p>
    </div>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;div class="nano-empty nano-empty--bordered"&gt;
  &lt;h3 class="nano-empty__title"&gt;Nothing here&lt;/h3&gt;
  &lt;p class="nano-empty__description"&gt;Add your first item to get started.&lt;/p&gt;
&lt;/div&gt;</code></pre>

  </div>
</div>

## Variants

- `.nano-empty--bordered` — dashed outline for empty panels/tables
- `.nano-empty--compact` — tighter padding for smaller zones

## Elements

- `.nano-empty__icon` — optional icon, muted circular background
- `.nano-empty__title` — primary heading
- `.nano-empty__description` — supporting text (muted)
- `.nano-empty__actions` — optional button row
