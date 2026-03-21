---
layout: default
title: Skeleton
---

# Skeleton

Loading placeholder with shimmer animation for content that is still loading.

## Variants

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview" style="display:flex;flex-direction:column;gap:0.75rem">
    <div class="nano-skeleton nano-skeleton--text" style="width:80%"></div>
    <div class="nano-skeleton nano-skeleton--text" style="width:60%"></div>
    <div class="nano-skeleton nano-skeleton--circle"></div>
    <div class="nano-skeleton nano-skeleton--card"></div>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;!-- Text line --&gt;
&lt;div class="nano-skeleton nano-skeleton--text" style="width:80%"&gt;&lt;/div&gt;

&lt;!-- Circle (e.g. avatar placeholder) --&gt;
&lt;div class="nano-skeleton nano-skeleton--circle"&gt;&lt;/div&gt;

&lt;!-- Card block --&gt;
&lt;div class="nano-skeleton nano-skeleton--card"&gt;&lt;/div&gt;</code></pre>

  </div>
</div>

## Composite Loading State

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview">
    <div style="display:flex;gap:0.75rem;align-items:flex-start">
      <div class="nano-skeleton nano-skeleton--circle"></div>
      <div style="flex:1;display:flex;flex-direction:column;gap:0.5rem">
        <div class="nano-skeleton nano-skeleton--text" style="width:40%"></div>
        <div class="nano-skeleton nano-skeleton--text" style="width:100%"></div>
        <div class="nano-skeleton nano-skeleton--text" style="width:70%"></div>
      </div>
    </div>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;!-- Composite: avatar + text block loading state --&gt;
&lt;div style="display:flex;gap:0.75rem;align-items:flex-start"&gt;
  &lt;div class="nano-skeleton nano-skeleton--circle"&gt;&lt;/div&gt;
  &lt;div style="flex:1;display:flex;flex-direction:column;gap:0.5rem"&gt;
    &lt;div class="nano-skeleton nano-skeleton--text" style="width:40%"&gt;&lt;/div&gt;
    &lt;div class="nano-skeleton nano-skeleton--text" style="width:100%"&gt;&lt;/div&gt;
    &lt;div class="nano-skeleton nano-skeleton--text" style="width:70%"&gt;&lt;/div&gt;
  &lt;/div&gt;
&lt;/div&gt;

&lt;!-- CSS-only component, no Stimulus controller required --&gt;</code></pre>

  </div>
</div>
