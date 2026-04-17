---
layout: default
title: Code block
---

# Code block

A monospace container for displaying code snippets, API keys, webhook URLs, or shell commands. Use `.nano-code--inline` for short inline fragments and the full component for multi-line blocks.

Optional syntax highlighting is left to userland (Highlight.js, Prism, Shiki). The component only provides layout, typography, and surface styling.

## Block

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview">
    <div class="nano-code">
      <div class="nano-code__header">
        <span class="nano-code__language">shell</span>
        <div class="nano-code__actions">
          <button class="nano-copy__button" type="button">Copy</button>
        </div>
      </div>
      <pre class="nano-code__body"><code>stripe listen --forward-to localhost:3000/webhooks/stripe</code></pre>
    </div>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;div class="nano-code"&gt;
  &lt;div class="nano-code__header"&gt;
    &lt;span class="nano-code__language"&gt;shell&lt;/span&gt;
    &lt;div class="nano-code__actions"&gt;
      &lt;button class="nano-copy__button" type="button"&gt;Copy&lt;/button&gt;
    &lt;/div&gt;
  &lt;/div&gt;
  &lt;pre class="nano-code__body"&gt;&lt;code&gt;stripe listen --forward-to localhost:3000/webhooks/stripe&lt;/code&gt;&lt;/pre&gt;
&lt;/div&gt;</code></pre>

  </div>
</div>

## Inline

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview">
    <p>Set <code class="nano-code nano-code--inline">STRIPE_WEBHOOK_SECRET</code> in your environment before deploying.</p>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;p&gt;Set &lt;code class="nano-code nano-code--inline"&gt;STRIPE_WEBHOOK_SECRET&lt;/code&gt; in your environment.&lt;/p&gt;</code></pre>

  </div>
</div>

## Terminal (dark)

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview">
    <div class="nano-code nano-code--terminal">
      <pre class="nano-code__body"><code>$ bin/rails generate nanoui:component --all
  ✓ stat (CSS)
  ✓ empty (CSS)
  ✓ copy (CSS, Stimulus)</code></pre>
    </div>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;div class="nano-code nano-code--terminal"&gt;
  &lt;pre class="nano-code__body"&gt;&lt;code&gt;$ bin/rails generate nanoui:component --all&lt;/code&gt;&lt;/pre&gt;
&lt;/div&gt;</code></pre>

  </div>
</div>

## Variants

- `.nano-code--inline` — for inline fragments inside running text
- `.nano-code--terminal` — dark palette for shell/terminal examples
- `.nano-code--wrap` — allow long lines to wrap instead of scrolling

## Elements

- `.nano-code__header` — optional toolbar (language label, copy button, etc.)
- `.nano-code__language` — label for the language/shell
- `.nano-code__actions` — slot for buttons (typically a copy button)
- `.nano-code__body` — the `<pre>` container holding the code itself
