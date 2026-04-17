---
layout: default
title: Stat
---

# Stat

A compact card for displaying a single metric with optional label, delta, and helper text. Ideal for dashboard KPIs. Group multiple stats with `.nano-stat-grid` for responsive layouts.

## Basic stat

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview">
    <div class="nano-stat">
      <span class="nano-stat__label">Recovered revenue</span>
      <span class="nano-stat__value">$4,238</span>
      <span class="nano-stat__help">Last 30 days</span>
    </div>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;div class="nano-stat"&gt;
  &lt;span class="nano-stat__label"&gt;Recovered revenue&lt;/span&gt;
  &lt;span class="nano-stat__value"&gt;$4,238&lt;/span&gt;
  &lt;span class="nano-stat__help"&gt;Last 30 days&lt;/span&gt;
&lt;/div&gt;</code></pre>

  </div>
</div>

## With delta

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview">
    <div class="nano-stat">
      <span class="nano-stat__label">Recovery rate</span>
      <span class="nano-stat__value">62%</span>
      <span class="nano-stat__delta nano-stat__delta--up">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 19V5"/><path d="m5 12 7-7 7 7"/></svg>
        12% vs last month
      </span>
    </div>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;div class="nano-stat"&gt;
  &lt;span class="nano-stat__label"&gt;Recovery rate&lt;/span&gt;
  &lt;span class="nano-stat__value"&gt;62%&lt;/span&gt;
  &lt;span class="nano-stat__delta nano-stat__delta--up"&gt;
    &lt;svg ...&gt;&lt;/svg&gt;
    12% vs last month
  &lt;/span&gt;
&lt;/div&gt;</code></pre>

  </div>
</div>

## Grid of stats

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview">
    <div class="nano-stat-grid">
      <div class="nano-stat">
        <span class="nano-stat__label">At-risk MRR</span>
        <span class="nano-stat__value">$1,240</span>
      </div>
      <div class="nano-stat">
        <span class="nano-stat__label">Recovered</span>
        <span class="nano-stat__value">$4,238</span>
        <span class="nano-stat__delta nano-stat__delta--up">12%</span>
      </div>
      <div class="nano-stat">
        <span class="nano-stat__label">Failed invoices</span>
        <span class="nano-stat__value">23</span>
        <span class="nano-stat__delta nano-stat__delta--down">3 vs last week</span>
      </div>
    </div>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;div class="nano-stat-grid"&gt;
  &lt;div class="nano-stat"&gt;
    &lt;span class="nano-stat__label"&gt;At-risk MRR&lt;/span&gt;
    &lt;span class="nano-stat__value"&gt;$1,240&lt;/span&gt;
  &lt;/div&gt;
  &lt;div class="nano-stat"&gt;
    &lt;span class="nano-stat__label"&gt;Recovered&lt;/span&gt;
    &lt;span class="nano-stat__value"&gt;$4,238&lt;/span&gt;
    &lt;span class="nano-stat__delta nano-stat__delta--up"&gt;12%&lt;/span&gt;
  &lt;/div&gt;
&lt;/div&gt;</code></pre>

  </div>
</div>

## Variants

- `.nano-stat--elevated` — shadow, no border
- `.nano-stat--bordered` — thicker border, no shadow
- `.nano-stat--compact` — tighter padding and smaller value

## Elements

- `.nano-stat__label` — the metric name (muted, small)
- `.nano-stat__value` — the primary number (large, bold)
- `.nano-stat__delta` — optional change indicator; use `--up` (success) or `--down` (destructive)
- `.nano-stat__help` — optional helper text below the value
- `.nano-stat__footer` — optional separated footer area (e.g. "View details →")
