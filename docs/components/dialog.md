---
layout: default
title: Dialog
---

# Dialog

Modal dialog using the native `<dialog>` element. Requires the `nanoui-dialog` Stimulus controller.

## Default

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview" style="display:flex;gap:0.5rem;flex-wrap:wrap">
    <button class="nano-btn nano-btn--primary" onclick="this.nextElementSibling.showModal()">Open Dialog</button>
    <dialog class="nano-dialog" onclick="if(event.target===this)this.close()">
      <div class="nano-dialog__content">
        <header class="nano-dialog__header">
          <h2 class="nano-dialog__title">Edit Profile</h2>
          <p class="nano-dialog__description">Make changes to your profile here.</p>
        </header>
        <div class="nano-dialog__body">
          <div class="nano-field">
            <label class="nano-label">Name</label>
            <input type="text" class="nano-input" value="Jane Doe">
          </div>
        </div>
        <footer class="nano-dialog__footer">
          <button class="nano-btn nano-btn--outline" onclick="this.closest('dialog').close()">Cancel</button>
          <button class="nano-btn nano-btn--primary" onclick="this.closest('dialog').close()">Save</button>
        </footer>
        <button class="nano-dialog__close" onclick="this.closest('dialog').close()" aria-label="Close dialog">&times;</button>
      </div>
    </dialog>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;div data-controller="nanoui-dialog"&gt;
  &lt;div class="nano-dialog__trigger" data-action="click-&gt;nanoui-dialog#open"&gt;
    &lt;button class="nano-btn nano-btn--primary"&gt;Open Dialog&lt;/button&gt;
  &lt;/div&gt;

  &lt;dialog class="nano-dialog"
          data-nanoui-dialog-target="modal"
          data-action="click-&gt;nanoui-dialog#clickBackdrop cancel-&gt;nanoui-dialog#cancel"
          aria-labelledby="dialog-title"&gt;
    &lt;div class="nano-dialog__content"&gt;
      &lt;header class="nano-dialog__header"&gt;
        &lt;h2 id="dialog-title" class="nano-dialog__title"&gt;Edit Profile&lt;/h2&gt;
        &lt;p class="nano-dialog__description"&gt;Make changes to your profile.&lt;/p&gt;
      &lt;/header&gt;

      &lt;div class="nano-dialog__body"&gt;
        &lt;!-- form content --&gt;
      &lt;/div&gt;

      &lt;footer class="nano-dialog__footer"&gt;
        &lt;button class="nano-btn nano-btn--outline"
                data-action="nanoui-dialog#close"&gt;Cancel&lt;/button&gt;
        &lt;button class="nano-btn nano-btn--primary"&gt;Save&lt;/button&gt;
      &lt;/footer&gt;

      &lt;button class="nano-dialog__close"
              data-action="nanoui-dialog#close"
              aria-label="Close dialog"&gt;&amp;times;&lt;/button&gt;
    &lt;/div&gt;
  &lt;/dialog&gt;
&lt;/div&gt;</code></pre>

  </div>
</div>

## Size variants

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview" style="display:flex;gap:0.5rem;flex-wrap:wrap">
    <button class="nano-btn nano-btn--outline nano-btn--sm" onclick="document.getElementById('dialog-sm').showModal()">Small</button>
    <dialog id="dialog-sm" class="nano-dialog nano-dialog--sm" onclick="if(event.target===this)this.close()">
      <div class="nano-dialog__content">
        <header class="nano-dialog__header">
          <h2 class="nano-dialog__title">Confirm</h2>
          <p class="nano-dialog__description">Are you sure you want to continue?</p>
        </header>
        <footer class="nano-dialog__footer">
          <button class="nano-btn nano-btn--outline" onclick="this.closest('dialog').close()">No</button>
          <button class="nano-btn nano-btn--primary" onclick="this.closest('dialog').close()">Yes</button>
        </footer>
        <button class="nano-dialog__close" onclick="this.closest('dialog').close()" aria-label="Close">&times;</button>
      </div>
    </dialog>

    <button class="nano-btn nano-btn--outline" onclick="document.getElementById('dialog-default').showModal()">Default</button>
    <dialog id="dialog-default" class="nano-dialog" onclick="if(event.target===this)this.close()">
      <div class="nano-dialog__content">
        <header class="nano-dialog__header">
          <h2 class="nano-dialog__title">Default dialog</h2>
          <p class="nano-dialog__description">This is the default 32rem width.</p>
        </header>
        <footer class="nano-dialog__footer">
          <button class="nano-btn nano-btn--outline" onclick="this.closest('dialog').close()">Close</button>
        </footer>
        <button class="nano-dialog__close" onclick="this.closest('dialog').close()" aria-label="Close">&times;</button>
      </div>
    </dialog>

    <button class="nano-btn nano-btn--outline nano-btn--lg" onclick="document.getElementById('dialog-lg').showModal()">Large</button>
    <dialog id="dialog-lg" class="nano-dialog nano-dialog--lg" onclick="if(event.target===this)this.close()">
      <div class="nano-dialog__content">
        <header class="nano-dialog__header">
          <h2 class="nano-dialog__title">Large dialog</h2>
          <p class="nano-dialog__description">This is the large 42rem width, great for forms.</p>
        </header>
        <div class="nano-dialog__body">
          <div class="nano-field">
            <label class="nano-label">Email</label>
            <input type="email" class="nano-input" placeholder="you@example.com">
          </div>
        </div>
        <footer class="nano-dialog__footer">
          <button class="nano-btn nano-btn--outline" onclick="this.closest('dialog').close()">Cancel</button>
          <button class="nano-btn nano-btn--primary" onclick="this.closest('dialog').close()">Submit</button>
        </footer>
        <button class="nano-dialog__close" onclick="this.closest('dialog').close()" aria-label="Close">&times;</button>
      </div>
    </dialog>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;dialog class="nano-dialog nano-dialog--sm"&gt;...&lt;/dialog&gt;
&lt;dialog class="nano-dialog"&gt;...&lt;/dialog&gt;
&lt;dialog class="nano-dialog nano-dialog--lg"&gt;...&lt;/dialog&gt;
&lt;dialog class="nano-dialog nano-dialog--full"&gt;...&lt;/dialog&gt;</code></pre>

  </div>
</div>

### Stimulus controller

The `nanoui-dialog` controller provides:

- **Targets:** `modal` (the `<dialog>` element)
- **Actions:** `open()`, `close()`, `clickBackdrop(event)`, `cancel(event)`
- Opens with `showModal()` for proper focus trapping and backdrop
- Escape key closes via native `cancel` event
