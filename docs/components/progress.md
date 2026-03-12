---
layout: default
title: Progress
---

# Progress

Progress bars using the native `<progress>` element with color variants.

## Variants

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview" style="display:flex;flex-direction:column;gap:1rem">
    <div class="nano-progress">
      <progress class="nano-progress__bar" value="65" max="100">65%</progress>
      <span class="nano-progress__label">65%</span>
    </div>
    <div class="nano-progress nano-progress--success">
      <progress class="nano-progress__bar" value="100" max="100">100%</progress>
      <span class="nano-progress__label">100%</span>
    </div>
    <div class="nano-progress nano-progress--warning">
      <progress class="nano-progress__bar" value="45" max="100">45%</progress>
      <span class="nano-progress__label">45%</span>
    </div>
    <div class="nano-progress nano-progress--destructive">
      <progress class="nano-progress__bar" value="20" max="100">20%</progress>
      <span class="nano-progress__label">20%</span>
    </div>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;div class="nano-progress"&gt;
  &lt;progress class="nano-progress__bar" value="65" max="100"&gt;65%&lt;/progress&gt;
  &lt;span class="nano-progress__label"&gt;65%&lt;/span&gt;
&lt;/div&gt;

&lt;div class="nano-progress nano-progress--success"&gt;
  &lt;progress class="nano-progress__bar" value="100" max="100"&gt;100%&lt;/progress&gt;
  &lt;span class="nano-progress__label"&gt;100%&lt;/span&gt;
&lt;/div&gt;

&lt;div class="nano-progress nano-progress--warning"&gt;
  &lt;progress class="nano-progress__bar" value="45" max="100"&gt;45%&lt;/progress&gt;
  &lt;span class="nano-progress__label"&gt;45%&lt;/span&gt;
&lt;/div&gt;

&lt;div class="nano-progress nano-progress--destructive"&gt;
  &lt;progress class="nano-progress__bar" value="20" max="100"&gt;20%&lt;/progress&gt;
  &lt;span class="nano-progress__label"&gt;20%&lt;/span&gt;
&lt;/div&gt;</code></pre>

  </div>
</div>

### Variants

- `nano-progress--success` -- green progress bar
- `nano-progress--warning` -- amber progress bar
- `nano-progress--destructive` -- red progress bar
