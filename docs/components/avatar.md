---
layout: default
title: Avatar
---

# Avatar

Circular avatar with image or initials fallback, optional status indicator.

## Sizes

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview" style="display:flex;align-items:center;gap:0.75rem">
    <div class="nano-avatar nano-avatar--sm">
      <span class="nano-avatar__fallback">SM</span>
    </div>
    <div class="nano-avatar">
      <span class="nano-avatar__fallback">MD</span>
    </div>
    <div class="nano-avatar nano-avatar--lg">
      <span class="nano-avatar__fallback">LG</span>
    </div>
    <div class="nano-avatar nano-avatar--xl">
      <span class="nano-avatar__fallback">XL</span>
    </div>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;!-- Small: 32px --&gt;
&lt;div class="nano-avatar nano-avatar--sm"&gt;
  &lt;span class="nano-avatar__fallback"&gt;SM&lt;/span&gt;
&lt;/div&gt;

&lt;!-- Default: 40px --&gt;
&lt;div class="nano-avatar"&gt;
  &lt;span class="nano-avatar__fallback"&gt;MD&lt;/span&gt;
&lt;/div&gt;

&lt;!-- Large: 48px --&gt;
&lt;div class="nano-avatar nano-avatar--lg"&gt;
  &lt;span class="nano-avatar__fallback"&gt;LG&lt;/span&gt;
&lt;/div&gt;

&lt;!-- Extra large: 64px --&gt;
&lt;div class="nano-avatar nano-avatar--xl"&gt;
  &lt;span class="nano-avatar__fallback"&gt;XL&lt;/span&gt;
&lt;/div&gt;</code></pre>

  </div>
</div>

## With Image

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview" style="display:flex;align-items:center;gap:0.75rem">
    <div class="nano-avatar">
      <img class="nano-avatar__image" src="https://i.pravatar.cc/40" alt="User avatar" />
    </div>
    <div class="nano-avatar nano-avatar--lg">
      <img class="nano-avatar__image" src="https://i.pravatar.cc/48" alt="User avatar" />
    </div>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;div class="nano-avatar"&gt;
  &lt;img class="nano-avatar__image" src="avatar.jpg" alt="User avatar" /&gt;
&lt;/div&gt;</code></pre>

  </div>
</div>

## Status Indicator

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview" style="display:flex;align-items:center;gap:0.75rem">
    <div class="nano-avatar">
      <span class="nano-avatar__fallback">JD</span>
      <span class="nano-avatar__status nano-avatar__status--online"></span>
    </div>
    <div class="nano-avatar">
      <span class="nano-avatar__fallback">AB</span>
      <span class="nano-avatar__status nano-avatar__status--offline"></span>
    </div>
    <div class="nano-avatar">
      <span class="nano-avatar__fallback">XY</span>
      <span class="nano-avatar__status nano-avatar__status--busy"></span>
    </div>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;div class="nano-avatar"&gt;
  &lt;span class="nano-avatar__fallback"&gt;JD&lt;/span&gt;
  &lt;span class="nano-avatar__status nano-avatar__status--online"&gt;&lt;/span&gt;
&lt;/div&gt;

&lt;div class="nano-avatar"&gt;
  &lt;span class="nano-avatar__fallback"&gt;AB&lt;/span&gt;
  &lt;span class="nano-avatar__status nano-avatar__status--offline"&gt;&lt;/span&gt;
&lt;/div&gt;

&lt;div class="nano-avatar"&gt;
  &lt;span class="nano-avatar__fallback"&gt;XY&lt;/span&gt;
  &lt;span class="nano-avatar__status nano-avatar__status--busy"&gt;&lt;/span&gt;
&lt;/div&gt;

&lt;!-- CSS-only component, no Stimulus controller required --&gt;</code></pre>

  </div>
</div>
