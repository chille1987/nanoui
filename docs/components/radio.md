---
layout: default
title: Radio
---

# Radio

Custom-styled radio buttons using BEM markup within a fieldset.

## Radio group

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview">
    <fieldset class="nano-radio-group">
      <legend class="nano-radio-group__legend">Plan</legend>
      <div class="nano-radio">
        <input type="radio" id="plan-free" name="plan" value="free" class="nano-radio__input" checked>
        <label for="plan-free" class="nano-radio__label">Free</label>
      </div>
      <div class="nano-radio">
        <input type="radio" id="plan-pro" name="plan" value="pro" class="nano-radio__input">
        <label for="plan-pro" class="nano-radio__label">Pro — $9/mo</label>
      </div>
      <div class="nano-radio">
        <input type="radio" id="plan-enterprise" name="plan" value="enterprise" class="nano-radio__input">
        <label for="plan-enterprise" class="nano-radio__label">Enterprise — Contact us</label>
      </div>
    </fieldset>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;fieldset class="nano-radio-group"&gt;
  &lt;legend class="nano-radio-group__legend"&gt;Plan&lt;/legend&gt;

  &lt;div class="nano-radio"&gt;
    &lt;input type="radio" id="plan-free" name="plan" value="free" class="nano-radio__input" checked&gt;
    &lt;label for="plan-free" class="nano-radio__label"&gt;Free&lt;/label&gt;
  &lt;/div&gt;

  &lt;div class="nano-radio"&gt;
    &lt;input type="radio" id="plan-pro" name="plan" value="pro" class="nano-radio__input"&gt;
    &lt;label for="plan-pro" class="nano-radio__label"&gt;Pro — $9/mo&lt;/label&gt;
  &lt;/div&gt;

  &lt;div class="nano-radio"&gt;
    &lt;input type="radio" id="plan-enterprise" name="plan" value="enterprise" class="nano-radio__input"&gt;
    &lt;label for="plan-enterprise" class="nano-radio__label"&gt;Enterprise — Contact us&lt;/label&gt;
  &lt;/div&gt;
&lt;/fieldset&gt;</code></pre>

  </div>
</div>
