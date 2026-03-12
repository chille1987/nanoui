---
layout: default
title: Dropdown
---

# Dropdown

A menu that appears below a trigger element. Requires the `nanoui-dropdown` Stimulus controller.

## Example

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview">
    <div class="nano-dropdown" onclick="event.stopPropagation();this.classList.toggle('is-open')">
      <div class="nano-dropdown__trigger">
        <button class="nano-btn nano-btn--outline" type="button">Options</button>
      </div>
      <div class="nano-dropdown__content">
        <p class="nano-dropdown__label">Actions</p>
        <button class="nano-dropdown__item" type="button">Edit</button>
        <button class="nano-dropdown__item" type="button">Duplicate</button>
        <div class="nano-dropdown__separator"></div>
        <button class="nano-dropdown__item" type="button" style="color:hsl(var(--color-destructive))">Delete</button>
      </div>
    </div>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;div class="nano-dropdown" data-controller="nanoui-dropdown"&gt;
  &lt;div class="nano-dropdown__trigger"
       data-action="click-&gt;nanoui-dropdown#toggle"
       data-nanoui-dropdown-target="trigger"&gt;
    &lt;button class="nano-btn nano-btn--outline"&gt;Options&lt;/button&gt;
  &lt;/div&gt;

  &lt;div class="nano-dropdown__content" data-nanoui-dropdown-target="content"&gt;
    &lt;p class="nano-dropdown__label"&gt;Actions&lt;/p&gt;
    &lt;button class="nano-dropdown__item"&gt;Edit&lt;/button&gt;
    &lt;button class="nano-dropdown__item"&gt;Duplicate&lt;/button&gt;
    &lt;div class="nano-dropdown__separator"&gt;&lt;/div&gt;
    &lt;button class="nano-dropdown__item"&gt;Delete&lt;/button&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>

  </div>
</div>

<script>
  document.addEventListener('click', function(e) {
    document.querySelectorAll('.nano-dropdown.is-open').forEach(function(dd) {
      if (!dd.contains(e.target)) dd.classList.remove('is-open');
    });
  });
</script>

### Stimulus controller

The `nanoui-dropdown` controller provides:

- **Targets:** `trigger`, `content`
- **Actions:** `toggle()`, `open()`, `close()`
- Arrow key navigation between items
- Escape to close
- Click outside to close
