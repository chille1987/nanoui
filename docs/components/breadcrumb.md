---
layout: default
title: Breadcrumb
---

# Breadcrumb

Navigation trail with separators indicating the current page location.

## Basic Breadcrumb

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview">
    <nav class="nano-breadcrumb" aria-label="Breadcrumb">
      <ol class="nano-breadcrumb__list">
        <li class="nano-breadcrumb__item">
          <a class="nano-breadcrumb__link" href="#">Home</a>
          <span class="nano-breadcrumb__separator">/</span>
        </li>
        <li class="nano-breadcrumb__item">
          <a class="nano-breadcrumb__link" href="#">Components</a>
          <span class="nano-breadcrumb__separator">/</span>
        </li>
        <li class="nano-breadcrumb__item">
          <a class="nano-breadcrumb__link nano-breadcrumb__link--current" href="#" aria-current="page">Breadcrumb</a>
        </li>
      </ol>
    </nav>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;nav class="nano-breadcrumb" aria-label="Breadcrumb"&gt;
  &lt;ol class="nano-breadcrumb__list"&gt;
    &lt;li class="nano-breadcrumb__item"&gt;
      &lt;a class="nano-breadcrumb__link" href="#"&gt;Home&lt;/a&gt;
      &lt;span class="nano-breadcrumb__separator"&gt;/&lt;/span&gt;
    &lt;/li&gt;
    &lt;li class="nano-breadcrumb__item"&gt;
      &lt;a class="nano-breadcrumb__link" href="#"&gt;Components&lt;/a&gt;
      &lt;span class="nano-breadcrumb__separator"&gt;/&lt;/span&gt;
    &lt;/li&gt;
    &lt;li class="nano-breadcrumb__item"&gt;
      &lt;a class="nano-breadcrumb__link nano-breadcrumb__link--current" href="#" aria-current="page"&gt;Breadcrumb&lt;/a&gt;
    &lt;/li&gt;
  &lt;/ol&gt;
&lt;/nav&gt;

&lt;!-- CSS-only component, no Stimulus controller required --&gt;
&lt;!-- The current page can be marked with --current modifier or aria-current="page" --&gt;</code></pre>

  </div>
</div>
