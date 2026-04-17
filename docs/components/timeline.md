---
layout: default
title: Timeline
---

# Timeline

A vertical feed of events with color-coded markers and a connecting line. Use for retry history, activity logs, audit trails, or status changes.

## Retry history

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview">
    <ol class="nano-timeline">
      <li class="nano-timeline__item nano-timeline__item--destructive">
        <span class="nano-timeline__marker">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"><line x1="18" y1="6" x2="6" y2="18"/><line x1="6" y1="6" x2="18" y2="18"/></svg>
        </span>
        <span class="nano-timeline__line"></span>
        <div class="nano-timeline__body">
          <div class="nano-timeline__header">
            <span class="nano-timeline__title">Payment failed</span>
            <time class="nano-timeline__time">3 days ago</time>
          </div>
          <span class="nano-timeline__description">Card declined — insufficient funds.</span>
          <span class="nano-timeline__meta">
            <span>decline_code: insufficient_funds</span>
          </span>
        </div>
      </li>

      <li class="nano-timeline__item nano-timeline__item--warning">
        <span class="nano-timeline__marker">2</span>
        <span class="nano-timeline__line"></span>
        <div class="nano-timeline__body">
          <div class="nano-timeline__header">
            <span class="nano-timeline__title">Retry scheduled</span>
            <time class="nano-timeline__time">3 days ago</time>
          </div>
          <span class="nano-timeline__description">Next attempt in 48 hours.</span>
        </div>
      </li>

      <li class="nano-timeline__item nano-timeline__item--info">
        <span class="nano-timeline__marker">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"/><polyline points="22,6 12,13 2,6"/></svg>
        </span>
        <span class="nano-timeline__line"></span>
        <div class="nano-timeline__body">
          <div class="nano-timeline__header">
            <span class="nano-timeline__title">Recovery email sent</span>
            <time class="nano-timeline__time">2 days ago</time>
          </div>
          <span class="nano-timeline__description">Email delivered and opened.</span>
        </div>
      </li>

      <li class="nano-timeline__item nano-timeline__item--success">
        <span class="nano-timeline__marker">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"/></svg>
        </span>
        <div class="nano-timeline__body">
          <div class="nano-timeline__header">
            <span class="nano-timeline__title">Payment recovered</span>
            <time class="nano-timeline__time">1 hour ago</time>
          </div>
          <span class="nano-timeline__description">$49.00 charged successfully.</span>
        </div>
      </li>
    </ol>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;ol class="nano-timeline"&gt;
  &lt;li class="nano-timeline__item nano-timeline__item--destructive"&gt;
    &lt;span class="nano-timeline__marker"&gt;&lt;svg&gt;...&lt;/svg&gt;&lt;/span&gt;
    &lt;span class="nano-timeline__line"&gt;&lt;/span&gt;
    &lt;div class="nano-timeline__body"&gt;
      &lt;div class="nano-timeline__header"&gt;
        &lt;span class="nano-timeline__title"&gt;Payment failed&lt;/span&gt;
        &lt;time class="nano-timeline__time"&gt;3 days ago&lt;/time&gt;
      &lt;/div&gt;
      &lt;span class="nano-timeline__description"&gt;Card declined — insufficient funds.&lt;/span&gt;
    &lt;/div&gt;
  &lt;/li&gt;

  &lt;li class="nano-timeline__item nano-timeline__item--success"&gt;
    &lt;span class="nano-timeline__marker"&gt;&lt;svg&gt;...&lt;/svg&gt;&lt;/span&gt;
    &lt;div class="nano-timeline__body"&gt;...&lt;/div&gt;
  &lt;/li&gt;
&lt;/ol&gt;</code></pre>

  </div>
</div>

## Item states

- Default — neutral/muted marker (generic event)
- `.nano-timeline__item--info` — primary blue (informational)
- `.nano-timeline__item--success` — green (successful action)
- `.nano-timeline__item--warning` — amber (pending, scheduled)
- `.nano-timeline__item--destructive` — red (failure, error)

## Elements

- `.nano-timeline__marker` — circular icon/number that marks the event
- `.nano-timeline__line` — the connecting line between items (omit on the last item, or let it collapse automatically)
- `.nano-timeline__title` — event headline
- `.nano-timeline__time` — relative/absolute timestamp
- `.nano-timeline__description` — event description
- `.nano-timeline__meta` — monospace metadata (IDs, codes, etc.)

## Variants

- `.nano-timeline--compact` — smaller markers and tighter spacing for dense lists
