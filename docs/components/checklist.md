---
layout: default
title: Checklist
---

# Checklist

A stateful list of steps for onboarding flows, setup guides, or any multi-step process. Each item can be in one of three states — pending, current, or done — and an optional summary row shows overall progress.

Progress is driven by the `--nano-checklist-progress` CSS variable (e.g. `style="--nano-checklist-progress: 40%"`) — set it server-side from Ruby, Hotwire, or any framework.

## Onboarding checklist

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview">
    <div class="nano-checklist">
      <div class="nano-checklist__summary">
        <span><span class="nano-checklist__count">2 of 4</span> complete</span>
        <span class="nano-checklist__bar" style="--nano-checklist-progress: 50%;">
          <span class="nano-checklist__bar-fill"></span>
        </span>
      </div>

      <div class="nano-checklist__item nano-checklist__item--done">
        <span class="nano-checklist__indicator">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"/></svg>
        </span>
        <div class="nano-checklist__body">
          <span class="nano-checklist__title">Connect Stripe</span>
          <span class="nano-checklist__description">Authorize access to your Stripe account.</span>
        </div>
      </div>

      <div class="nano-checklist__item nano-checklist__item--done">
        <span class="nano-checklist__indicator">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"/></svg>
        </span>
        <div class="nano-checklist__body">
          <span class="nano-checklist__title">Verify sending domain</span>
          <span class="nano-checklist__description">Add DNS records so emails send from your domain.</span>
        </div>
      </div>

      <div class="nano-checklist__item nano-checklist__item--current">
        <span class="nano-checklist__indicator">3</span>
        <div class="nano-checklist__body">
          <span class="nano-checklist__title">Pick an email template</span>
          <span class="nano-checklist__description">Choose a starter style and customize the copy.</span>
          <a class="nano-checklist__action" href="#">Choose template →</a>
        </div>
      </div>

      <div class="nano-checklist__item">
        <span class="nano-checklist__indicator">4</span>
        <div class="nano-checklist__body">
          <span class="nano-checklist__title">Go live</span>
          <span class="nano-checklist__description">Turn off test mode and start recovering failed payments.</span>
        </div>
      </div>
    </div>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;div class="nano-checklist"&gt;
  &lt;div class="nano-checklist__summary"&gt;
    &lt;span&gt;&lt;span class="nano-checklist__count"&gt;2 of 4&lt;/span&gt; complete&lt;/span&gt;
    &lt;span class="nano-checklist__bar" style="--nano-checklist-progress: 50%;"&gt;
      &lt;span class="nano-checklist__bar-fill"&gt;&lt;/span&gt;
    &lt;/span&gt;
  &lt;/div&gt;

  &lt;div class="nano-checklist__item nano-checklist__item--done"&gt;
    &lt;span class="nano-checklist__indicator"&gt;&lt;svg&gt;...&lt;/svg&gt;&lt;/span&gt;
    &lt;div class="nano-checklist__body"&gt;
      &lt;span class="nano-checklist__title"&gt;Connect Stripe&lt;/span&gt;
    &lt;/div&gt;
  &lt;/div&gt;

  &lt;div class="nano-checklist__item nano-checklist__item--current"&gt;
    &lt;span class="nano-checklist__indicator"&gt;3&lt;/span&gt;
    &lt;div class="nano-checklist__body"&gt;
      &lt;span class="nano-checklist__title"&gt;Pick an email template&lt;/span&gt;
      &lt;a class="nano-checklist__action" href="#"&gt;Choose template →&lt;/a&gt;
    &lt;/div&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>

  </div>
</div>

## States

- `.nano-checklist__item` — pending (default)
- `.nano-checklist__item--current` — highlighted with primary color
- `.nano-checklist__item--done` — muted, with success border and checkmark

## Elements

- `.nano-checklist__summary` — optional progress row (count + bar)
- `.nano-checklist__count` — "X of Y" or similar
- `.nano-checklist__bar` + `.nano-checklist__bar-fill` — progress visualization (set `--nano-checklist-progress` inline)
- `.nano-checklist__indicator` — numeric step or checkmark svg
- `.nano-checklist__title` / `.nano-checklist__description` — step content
- `.nano-checklist__action` — optional CTA link for the current step
