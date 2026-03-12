---
layout: default
title: Card
---

# Card

A container with header, content, and footer sections. Uses BEM classes.

## Basic card

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview">
    <article class="nano-card">
      <div class="nano-card__header">
        <h3 class="nano-card__title">Card title</h3>
        <p class="nano-card__description">A short description of this card.</p>
      </div>
      <div class="nano-card__content">
        <p>Card content goes here. You can put forms, text, images, or any other content inside.</p>
      </div>
      <div class="nano-card__footer">
        <button class="nano-btn nano-btn--primary">Save</button>
        <button class="nano-btn nano-btn--outline">Cancel</button>
      </div>
    </article>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;article class="nano-card"&gt;
  &lt;div class="nano-card__header"&gt;
    &lt;h3 class="nano-card__title"&gt;Card title&lt;/h3&gt;
    &lt;p class="nano-card__description"&gt;A short description of this card.&lt;/p&gt;
  &lt;/div&gt;
  &lt;div class="nano-card__content"&gt;
    &lt;p&gt;Card content goes here.&lt;/p&gt;
  &lt;/div&gt;
  &lt;div class="nano-card__footer"&gt;
    &lt;button class="nano-btn nano-btn--primary"&gt;Save&lt;/button&gt;
    &lt;button class="nano-btn nano-btn--outline"&gt;Cancel&lt;/button&gt;
  &lt;/div&gt;
&lt;/article&gt;</code></pre>

  </div>
</div>

## Elevated

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview">
    <article class="nano-card nano-card--elevated">
      <div class="nano-card__content">
        <p>Elevated card with shadow, no border.</p>
      </div>
    </article>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;article class="nano-card nano-card--elevated"&gt;
  &lt;div class="nano-card__content"&gt;
    &lt;p&gt;Elevated card with shadow, no border.&lt;/p&gt;
  &lt;/div&gt;
&lt;/article&gt;</code></pre>

  </div>
</div>

## Bordered

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview">
    <article class="nano-card nano-card--bordered">
      <div class="nano-card__content">
        <p>Bordered card with thicker border, no shadow.</p>
      </div>
    </article>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;article class="nano-card nano-card--bordered"&gt;
  &lt;div class="nano-card__content"&gt;
    &lt;p&gt;Bordered card with thicker border, no shadow.&lt;/p&gt;
  &lt;/div&gt;
&lt;/article&gt;</code></pre>

  </div>
</div>
