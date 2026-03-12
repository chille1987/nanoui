---
layout: default
title: Tabs
---

# Tabs

Tabbed content navigation using ARIA tab pattern. Requires the `nanoui-tabs` Stimulus controller.

## Example

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview">
    <div class="nano-tabs">
      <div role="tablist" class="nano-tabs__list">
        <button role="tab" class="nano-tabs__trigger" aria-selected="true" onclick="selectTab(this, 'panel-general')">General</button>
        <button role="tab" class="nano-tabs__trigger" aria-selected="false" tabindex="-1" onclick="selectTab(this, 'panel-security')">Security</button>
        <button role="tab" class="nano-tabs__trigger" aria-selected="false" tabindex="-1" onclick="selectTab(this, 'panel-notifications')">Notifications</button>
      </div>
      <div role="tabpanel" id="panel-general" class="nano-tabs__panel">
        <p>General settings content goes here.</p>
      </div>
      <div role="tabpanel" id="panel-security" class="nano-tabs__panel" hidden>
        <p>Security settings content goes here.</p>
      </div>
      <div role="tabpanel" id="panel-notifications" class="nano-tabs__panel" hidden>
        <p>Notification preferences and alerts.</p>
      </div>
    </div>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;div class="nano-tabs" data-controller="nanoui-tabs"&gt;
  &lt;div role="tablist" class="nano-tabs__list"&gt;
    &lt;button role="tab" id="tab-general"
            class="nano-tabs__trigger"
            aria-selected="true"
            aria-controls="panel-general"
            data-action="nanoui-tabs#select keydown-&gt;nanoui-tabs#navigate"
            data-nanoui-tabs-target="tab"&gt;
      General
    &lt;/button&gt;
    &lt;button role="tab" id="tab-security"
            class="nano-tabs__trigger"
            aria-selected="false"
            aria-controls="panel-security"
            tabindex="-1"
            data-action="nanoui-tabs#select keydown-&gt;nanoui-tabs#navigate"
            data-nanoui-tabs-target="tab"&gt;
      Security
    &lt;/button&gt;
  &lt;/div&gt;

  &lt;div role="tabpanel" id="panel-general"
       class="nano-tabs__panel"
       aria-labelledby="tab-general"
       data-nanoui-tabs-target="panel"&gt;
    &lt;p&gt;General settings content.&lt;/p&gt;
  &lt;/div&gt;

  &lt;div role="tabpanel" id="panel-security"
       class="nano-tabs__panel"
       aria-labelledby="tab-security"
       hidden
       data-nanoui-tabs-target="panel"&gt;
    &lt;p&gt;Security settings content.&lt;/p&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>

  </div>
</div>

<script>
  function selectTab(trigger, panelId) {
    var tabs = trigger.closest('.nano-tabs');
    tabs.querySelectorAll('.nano-tabs__trigger').forEach(function(t) {
      t.setAttribute('aria-selected', 'false');
      t.setAttribute('tabindex', '-1');
    });
    tabs.querySelectorAll('.nano-tabs__panel').forEach(function(p) {
      p.hidden = true;
    });
    trigger.setAttribute('aria-selected', 'true');
    trigger.removeAttribute('tabindex');
    document.getElementById(panelId).hidden = false;
  }
</script>

### Stimulus controller

- **Targets:** `tab` (buttons), `panel` (content divs)
- **Values:** `hash` (Boolean, default false — sync active tab with URL hash)
- **Actions:** `select(event)`, `navigate(event)`
- Arrow key navigation (Left/Right/Home/End)
- Full WAI-ARIA Tabs pattern
