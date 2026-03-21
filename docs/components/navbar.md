---
layout: default
title: Navbar
---

# Navbar

Responsive top navigation bar with mobile hamburger toggle.

## Basic Navbar

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview">
    <nav class="nano-navbar" data-controller="nanoui-navbar">
      <a class="nano-navbar__brand" href="#">MyApp</a>
      <button class="nano-navbar__toggle" data-action="nanoui-navbar#toggle" aria-label="Toggle navigation">
        <span></span>
        <span></span>
        <span></span>
      </button>
      <div class="nano-navbar__links" data-nanoui-navbar-target="menu">
        <a class="nano-navbar__link nano-navbar__link--active" href="#">Home</a>
        <a class="nano-navbar__link" href="#">Features</a>
        <a class="nano-navbar__link" href="#">Pricing</a>
      </div>
      <div class="nano-navbar__actions">
        <button class="nano-btn nano-btn--sm">Sign In</button>
      </div>
    </nav>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;nav class="nano-navbar" data-controller="nanoui-navbar"&gt;
  &lt;a class="nano-navbar__brand" href="#"&gt;MyApp&lt;/a&gt;
  &lt;button class="nano-navbar__toggle" data-action="nanoui-navbar#toggle" aria-label="Toggle navigation"&gt;
    &lt;span&gt;&lt;/span&gt;
    &lt;span&gt;&lt;/span&gt;
    &lt;span&gt;&lt;/span&gt;
  &lt;/button&gt;
  &lt;div class="nano-navbar__links" data-nanoui-navbar-target="menu"&gt;
    &lt;a class="nano-navbar__link nano-navbar__link--active" href="#"&gt;Home&lt;/a&gt;
    &lt;a class="nano-navbar__link" href="#"&gt;Features&lt;/a&gt;
    &lt;a class="nano-navbar__link" href="#"&gt;Pricing&lt;/a&gt;
  &lt;/div&gt;
  &lt;div class="nano-navbar__actions"&gt;
    &lt;button class="nano-btn nano-btn--sm"&gt;Sign In&lt;/button&gt;
  &lt;/div&gt;
&lt;/nav&gt;</code></pre>

  </div>
</div>

## Sticky Navbar

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview">
    <nav class="nano-navbar nano-navbar--sticky" data-controller="nanoui-navbar">
      <a class="nano-navbar__brand" href="#">MyApp</a>
      <button class="nano-navbar__toggle" data-action="nanoui-navbar#toggle" aria-label="Toggle navigation">
        <span></span>
        <span></span>
        <span></span>
      </button>
      <div class="nano-navbar__links" data-nanoui-navbar-target="menu">
        <a class="nano-navbar__link nano-navbar__link--active" href="#">Home</a>
        <a class="nano-navbar__link" href="#">About</a>
        <a class="nano-navbar__link" href="#">Contact</a>
      </div>
      <div class="nano-navbar__actions">
        <button class="nano-btn nano-btn--sm">Sign In</button>
      </div>
    </nav>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;nav class="nano-navbar nano-navbar--sticky" data-controller="nanoui-navbar"&gt;
  &lt;a class="nano-navbar__brand" href="#"&gt;MyApp&lt;/a&gt;
  &lt;!-- ... same content ... --&gt;
&lt;/nav&gt;

&lt;!-- Modifier: nano-navbar--sticky keeps the navbar fixed to the top --&gt;
&lt;!-- Requires Stimulus controller: nanoui-navbar --&gt;</code></pre>

  </div>
</div>
