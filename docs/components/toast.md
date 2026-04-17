---
layout: default
title: Toast
---

# Toast

Notification messages that appear temporarily. Requires the `nanoui-toast` Stimulus controller.

## Variants

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview">
    <div class="nano-toast-container" style="position:static;pointer-events:auto;max-width:100%">
      <output class="nano-toast" role="status">
        <div class="nano-toast__content">
          <p class="nano-toast__title">Notification</p>
          <p class="nano-toast__description">Something happened.</p>
        </div>
        <button class="nano-toast__close" aria-label="Dismiss">&times;</button>
      </output>
      <output class="nano-toast nano-toast--success" role="status">
        <div class="nano-toast__content">
          <p class="nano-toast__title">Success!</p>
          <p class="nano-toast__description">Changes saved successfully.</p>
        </div>
        <button class="nano-toast__close" aria-label="Dismiss">&times;</button>
      </output>
      <output class="nano-toast nano-toast--destructive" role="status">
        <div class="nano-toast__content">
          <p class="nano-toast__title">Error</p>
          <p class="nano-toast__description">Something went wrong.</p>
        </div>
        <button class="nano-toast__close" aria-label="Dismiss">&times;</button>
      </output>
      <output class="nano-toast nano-toast--warning" role="status">
        <div class="nano-toast__content">
          <p class="nano-toast__title">Warning</p>
          <p class="nano-toast__description">Your session is about to expire.</p>
        </div>
        <button class="nano-toast__close" aria-label="Dismiss">&times;</button>
      </output>
    </div>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;!-- Add once to your layout --&gt;
&lt;div class="nano-toast-container"
     data-controller="nanoui-toast"
     data-nanoui-toast-duration-value="5000"
     aria-live="polite"&gt;

  &lt;output class="nano-toast nano-toast--success"
          role="status"
          data-nanoui-toast-target="item"&gt;
    &lt;div class="nano-toast__content"&gt;
      &lt;p class="nano-toast__title"&gt;Success!&lt;/p&gt;
      &lt;p class="nano-toast__description"&gt;Changes saved.&lt;/p&gt;
    &lt;/div&gt;
    &lt;button class="nano-toast__close"
            data-action="nanoui-toast#dismiss"
            aria-label="Dismiss"&gt;&amp;times;&lt;/button&gt;
  &lt;/output&gt;

&lt;/div&gt;</code></pre>

  </div>
</div>

## Interactive demo

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview" style="display:flex;gap:0.5rem;flex-wrap:wrap">
    <button class="nano-btn nano-btn--primary" onclick="showDemoToast('default')">Default</button>
    <button class="nano-btn nano-btn--outline" style="border-color:hsl(142 76% 36%);color:hsl(142 76% 36%)" onclick="showDemoToast('success')">Success</button>
    <button class="nano-btn nano-btn--outline" style="border-color:hsl(0 84.2% 60.2%);color:hsl(0 84.2% 60.2%)" onclick="showDemoToast('destructive')">Error</button>
    <button class="nano-btn nano-btn--outline" style="border-color:hsl(38 92% 50%);color:hsl(38 92% 50%)" onclick="showDemoToast('warning')">Warning</button>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;!-- Variants: nano-toast--success, nano-toast--destructive, nano-toast--warning --&gt;
&lt;output class="nano-toast nano-toast--success" ...&gt;
  &lt;div class="nano-toast__content"&gt;
    &lt;p class="nano-toast__title"&gt;Saved&lt;/p&gt;
    &lt;p class="nano-toast__description"&gt;Your changes have been saved.&lt;/p&gt;
  &lt;/div&gt;
  &lt;button class="nano-toast__close" data-action="nanoui-toast#dismiss"&gt;&amp;times;&lt;/button&gt;
&lt;/output&gt;</code></pre>

  </div>
</div>

<div class="nano-toast-container" id="demo-toast-container"></div>

<script>
  function showDemoToast(variant) {
    var container = document.getElementById('demo-toast-container');
    var titles = { default: 'Notification', success: 'Success!', destructive: 'Error', warning: 'Warning' };
    var descs = { default: 'Something happened.', success: 'Changes saved successfully.', destructive: 'Something went wrong.', warning: 'Your session is about to expire.' };
    var cls = variant === 'default' ? 'nano-toast' : 'nano-toast nano-toast--' + variant;
    var toast = document.createElement('output');
    toast.className = cls;
    toast.setAttribute('role', 'status');
    toast.innerHTML = '<div class="nano-toast__content"><p class="nano-toast__title">' + titles[variant] + '</p><p class="nano-toast__description">' + descs[variant] + '</p></div><button class="nano-toast__close" aria-label="Dismiss" onclick="dismissDemoToast(this.parentElement)">&times;</button>';
    container.appendChild(toast);
    setTimeout(function() { dismissDemoToast(toast); }, 5000);
  }
  function dismissDemoToast(toast) {
    if (!toast || !toast.parentElement) return;
    toast.classList.add('is-dismissing');
    toast.addEventListener('animationend', function() { toast.remove(); });
  }
</script>

## Action button

Add `.nano-toast__action` alongside (or instead of) the close button when the toast needs a secondary CTA — "Undo", "View", "Retry", etc. The action's border and text inherit the toast variant colors automatically.

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview">
    <div class="nano-toast-container" style="position:static;pointer-events:auto;max-width:100%">
      <output class="nano-toast nano-toast--success" role="status">
        <div class="nano-toast__content">
          <p class="nano-toast__title">Invoice recovered</p>
          <p class="nano-toast__description">$49.00 was charged successfully.</p>
        </div>
        <a href="#" class="nano-toast__action">View invoice</a>
        <button class="nano-toast__close" aria-label="Dismiss">&times;</button>
      </output>
      <output class="nano-toast nano-toast--destructive" role="status">
        <div class="nano-toast__content">
          <p class="nano-toast__title">Retry failed</p>
          <p class="nano-toast__description">Card declined — insufficient funds.</p>
        </div>
        <button type="button" class="nano-toast__action">Retry now</button>
        <button class="nano-toast__close" aria-label="Dismiss">&times;</button>
      </output>
    </div>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;output class="nano-toast nano-toast--success" role="status"&gt;
  &lt;div class="nano-toast__content"&gt;
    &lt;p class="nano-toast__title"&gt;Invoice recovered&lt;/p&gt;
    &lt;p class="nano-toast__description"&gt;$49.00 was charged successfully.&lt;/p&gt;
  &lt;/div&gt;
  &lt;a href="/invoices/123" class="nano-toast__action"&gt;View invoice&lt;/a&gt;
  &lt;button class="nano-toast__close" aria-label="Dismiss"&gt;&amp;times;&lt;/button&gt;
&lt;/output&gt;</code></pre>

  </div>
</div>

### Stimulus controller

- **Targets:** `item` (individual toast elements)
- **Values:** `duration` (Number, default 5000ms, 0 = no auto-dismiss)
- **Actions:** `dismiss(event)` -- manually dismiss a toast
- Toasts auto-dismiss after duration and are removed from DOM
