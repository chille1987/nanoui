---
layout: default
title: File upload
---

# File upload

A drag-and-drop file input with preview, validation, and graceful fallback to the native file picker. Wraps a hidden `<input type="file">` so standard form submission (including Rails `form_with`) works unchanged.

## Basic upload

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview">
    <div class="nano-upload"
         data-controller="nanoui-upload"
         data-nanoui-upload-accept-value="image/*"
         data-nanoui-upload-max-size-value="2097152"
         data-action="dragover->nanoui-upload#onDragover dragleave->nanoui-upload#onDragleave drop->nanoui-upload#onDrop">

      <input type="file"
             name="logo"
             class="nano-upload__input"
             accept="image/*"
             data-nanoui-upload-target="input"
             data-action="change->nanoui-upload#onChange">

      <label class="nano-upload__dropzone"
             data-nanoui-upload-target="dropzone"
             data-action="click->nanoui-upload#openPicker keydown.enter->nanoui-upload#openPicker keydown.space->nanoui-upload#openPicker"
             tabindex="0">
        <span class="nano-upload__icon">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="17 8 12 3 7 8"/><line x1="12" y1="3" x2="12" y2="15"/></svg>
        </span>
        <span class="nano-upload__prompt">
          <strong>Click to upload</strong> or drag and drop
        </span>
        <span class="nano-upload__hint">PNG or JPG up to 2&nbsp;MB</span>
      </label>

      <div class="nano-upload__preview" data-nanoui-upload-target="preview">
        <img class="nano-upload__thumbnail" alt="" data-nanoui-upload-target="thumbnail">
        <div class="nano-upload__meta">
          <span class="nano-upload__name" data-nanoui-upload-target="name"></span>
          <span class="nano-upload__size" data-nanoui-upload-target="size"></span>
        </div>
        <button type="button"
                class="nano-upload__remove"
                aria-label="Remove file"
                data-action="click->nanoui-upload#remove">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="18" y1="6" x2="6" y2="18"/><line x1="6" y1="6" x2="18" y2="18"/></svg>
        </button>
      </div>

      <p class="nano-upload__error" data-nanoui-upload-target="error" hidden></p>
    </div>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;div class="nano-upload"
     data-controller="nanoui-upload"
     data-nanoui-upload-accept-value="image/*"
     data-nanoui-upload-max-size-value="2097152"
     data-action="dragover-&gt;nanoui-upload#onDragover dragleave-&gt;nanoui-upload#onDragleave drop-&gt;nanoui-upload#onDrop"&gt;

  &lt;input type="file" name="logo" class="nano-upload__input"
         data-nanoui-upload-target="input"
         data-action="change-&gt;nanoui-upload#onChange"&gt;

  &lt;label class="nano-upload__dropzone"
         data-nanoui-upload-target="dropzone"
         data-action="click-&gt;nanoui-upload#openPicker"
         tabindex="0"&gt;
    &lt;span class="nano-upload__icon"&gt;&lt;svg&gt;...&lt;/svg&gt;&lt;/span&gt;
    &lt;span class="nano-upload__prompt"&gt;&lt;strong&gt;Click to upload&lt;/strong&gt; or drag and drop&lt;/span&gt;
    &lt;span class="nano-upload__hint"&gt;PNG or JPG up to 2 MB&lt;/span&gt;
  &lt;/label&gt;

  &lt;div class="nano-upload__preview" data-nanoui-upload-target="preview"&gt;
    &lt;img class="nano-upload__thumbnail" alt="" data-nanoui-upload-target="thumbnail"&gt;
    &lt;div class="nano-upload__meta"&gt;
      &lt;span class="nano-upload__name" data-nanoui-upload-target="name"&gt;&lt;/span&gt;
      &lt;span class="nano-upload__size" data-nanoui-upload-target="size"&gt;&lt;/span&gt;
    &lt;/div&gt;
    &lt;button type="button" class="nano-upload__remove"
            data-action="click-&gt;nanoui-upload#remove"&gt;
      &lt;svg&gt;...&lt;/svg&gt;
    &lt;/button&gt;
  &lt;/div&gt;

  &lt;p class="nano-upload__error" data-nanoui-upload-target="error" hidden&gt;&lt;/p&gt;
&lt;/div&gt;</code></pre>

  </div>
</div>

## Values

- `accept` (String) — MIME types / extensions (e.g. `image/*`, `.pdf,.docx`)
- `maxSize` (Number, bytes) — reject files larger than this

## Targets

- `input` — the hidden `<input type="file">` that carries the file into the form
- `dropzone` — label/area shown when no file is selected
- `preview` — container shown after a valid file is chosen
- `thumbnail` — `<img>` populated from `FileReader` for image files
- `name` / `size` — metadata text nodes
- `error` — validation message container

## Events

- `nanoui-upload:selected` — fired with `{ file }` in detail when a valid file is chosen
- `nanoui-upload:removed` — fired when the user clears the selection

## Notes

- The wrapper gets `data-state="empty" | "dragover" | "filled"` which CSS uses to show/hide the dropzone vs. preview. You can target this state yourself for custom animations.
- Rails tip: pair with Active Storage by naming the input for your attribute (e.g. `name="merchant[logo]"`); no controller changes required.
