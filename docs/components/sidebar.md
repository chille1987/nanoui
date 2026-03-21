---
layout: default
title: Sidebar
---

# Sidebar

Collapsible sidebar navigation panel with grouped items.

## Basic Sidebar

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview">
    <aside class="nano-sidebar" data-controller="nanoui-sidebar">
      <div class="nano-sidebar__header">
        <span>Navigation</span>
        <button class="nano-sidebar__toggle" data-action="nanoui-sidebar#toggle" aria-label="Toggle sidebar">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="3" y1="12" x2="21" y2="12"/><line x1="3" y1="6" x2="21" y2="6"/><line x1="3" y1="18" x2="21" y2="18"/></svg>
        </button>
      </div>
      <nav class="nano-sidebar__nav">
        <div class="nano-sidebar__group">
          <span class="nano-sidebar__group-label">General</span>
          <a class="nano-sidebar__item nano-sidebar__item--active" href="#">Dashboard</a>
          <a class="nano-sidebar__item" href="#">Analytics</a>
          <a class="nano-sidebar__item" href="#">Reports</a>
        </div>
        <div class="nano-sidebar__group">
          <span class="nano-sidebar__group-label">Settings</span>
          <a class="nano-sidebar__item" href="#">Profile</a>
          <a class="nano-sidebar__item" href="#">Preferences</a>
        </div>
      </nav>
      <div class="nano-sidebar__footer">
        <a class="nano-sidebar__item" href="#">Logout</a>
      </div>
    </aside>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;aside class="nano-sidebar" data-controller="nanoui-sidebar"&gt;
  &lt;div class="nano-sidebar__header"&gt;
    &lt;span&gt;Navigation&lt;/span&gt;
    &lt;button class="nano-sidebar__toggle" data-action="nanoui-sidebar#toggle" aria-label="Toggle sidebar"&gt;
      &lt;!-- icon --&gt;
    &lt;/button&gt;
  &lt;/div&gt;
  &lt;nav class="nano-sidebar__nav"&gt;
    &lt;div class="nano-sidebar__group"&gt;
      &lt;span class="nano-sidebar__group-label"&gt;General&lt;/span&gt;
      &lt;a class="nano-sidebar__item nano-sidebar__item--active" href="#"&gt;Dashboard&lt;/a&gt;
      &lt;a class="nano-sidebar__item" href="#"&gt;Analytics&lt;/a&gt;
      &lt;a class="nano-sidebar__item" href="#"&gt;Reports&lt;/a&gt;
    &lt;/div&gt;
    &lt;div class="nano-sidebar__group"&gt;
      &lt;span class="nano-sidebar__group-label"&gt;Settings&lt;/span&gt;
      &lt;a class="nano-sidebar__item" href="#"&gt;Profile&lt;/a&gt;
      &lt;a class="nano-sidebar__item" href="#"&gt;Preferences&lt;/a&gt;
    &lt;/div&gt;
  &lt;/nav&gt;
  &lt;div class="nano-sidebar__footer"&gt;
    &lt;a class="nano-sidebar__item" href="#"&gt;Logout&lt;/a&gt;
  &lt;/div&gt;
&lt;/aside&gt;

&lt;!-- Collapsed state: add nano-sidebar--collapsed to collapse the sidebar --&gt;
&lt;!-- Requires Stimulus controller: nanoui-sidebar --&gt;</code></pre>

  </div>
</div>
