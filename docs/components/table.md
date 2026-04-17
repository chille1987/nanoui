---
layout: default
title: Table
---

# Table

Styled data tables with optional striping and hover effects.

## Default

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview">
    <div class="nano-table-wrapper">
      <table class="nano-table nano-table--striped nano-table--hoverable">
        <thead class="nano-table__head">
          <tr>
            <th scope="col" class="nano-table__header">Name</th>
            <th scope="col" class="nano-table__header">Email</th>
            <th scope="col" class="nano-table__header">Status</th>
          </tr>
        </thead>
        <tbody class="nano-table__body">
          <tr class="nano-table__row">
            <td class="nano-table__cell">Jane Doe</td>
            <td class="nano-table__cell">jane@example.com</td>
            <td class="nano-table__cell"><span class="nano-badge nano-badge--success">Active</span></td>
          </tr>
          <tr class="nano-table__row">
            <td class="nano-table__cell">John Smith</td>
            <td class="nano-table__cell">john@example.com</td>
            <td class="nano-table__cell"><span class="nano-badge nano-badge--warning">Pending</span></td>
          </tr>
          <tr class="nano-table__row">
            <td class="nano-table__cell">Bob Wilson</td>
            <td class="nano-table__cell">bob@example.com</td>
            <td class="nano-table__cell"><span class="nano-badge nano-badge--secondary">Inactive</span></td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;div class="nano-table-wrapper"&gt;
  &lt;table class="nano-table nano-table--striped nano-table--hoverable"&gt;
    &lt;thead class="nano-table__head"&gt;
      &lt;tr&gt;
        &lt;th scope="col" class="nano-table__header"&gt;Name&lt;/th&gt;
        &lt;th scope="col" class="nano-table__header"&gt;Email&lt;/th&gt;
        &lt;th scope="col" class="nano-table__header"&gt;Status&lt;/th&gt;
      &lt;/tr&gt;
    &lt;/thead&gt;
    &lt;tbody class="nano-table__body"&gt;
      &lt;tr class="nano-table__row"&gt;
        &lt;td class="nano-table__cell"&gt;Jane Doe&lt;/td&gt;
        &lt;td class="nano-table__cell"&gt;jane@example.com&lt;/td&gt;
        &lt;td class="nano-table__cell"&gt;
          &lt;span class="nano-badge nano-badge--success"&gt;Active&lt;/span&gt;
        &lt;/td&gt;
      &lt;/tr&gt;
    &lt;/tbody&gt;
  &lt;/table&gt;
&lt;/div&gt;</code></pre>

  </div>
</div>

### Variants

- `nano-table--striped` -- alternating row backgrounds
- `nano-table--hoverable` -- highlight rows on hover

## Sortable columns

Wrap a table with `data-controller="nanoui-data-table"` and mark sortable headers with `--sortable` + `data-nanoui-data-table-target="header"`. The controller toggles `aria-sort` on click and (by default) sorts rows client-side. Set `data-nanoui-data-table-server-value="true"` to let the controller only dispatch a `nanoui-data-table:sort` event and leave actual sorting to the server (Turbo Frame, fetch, etc.).

Per-header options:
- `data-sort-key` — the field name used in the dispatched event
- `data-sort-type` — `string` (default), `number`, or `date`
- `data-sort-value` on cells — explicit sort value when the displayed text isn't directly comparable

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview">
    <div class="nano-table-wrapper" data-controller="nanoui-data-table">
      <table class="nano-table nano-table--hoverable">
        <thead class="nano-table__head">
          <tr>
            <th scope="col" class="nano-table__header nano-table__header--sortable"
                data-nanoui-data-table-target="header"
                data-sort-key="customer"
                data-action="click->nanoui-data-table#sort">
              <button type="button" class="nano-table__sort">Customer</button>
            </th>
            <th scope="col" class="nano-table__header nano-table__header--sortable"
                data-nanoui-data-table-target="header"
                data-sort-key="amount"
                data-sort-type="number"
                data-action="click->nanoui-data-table#sort">
              <button type="button" class="nano-table__sort">Amount</button>
            </th>
            <th scope="col" class="nano-table__header nano-table__header--sortable"
                data-nanoui-data-table-target="header"
                data-sort-key="failed_at"
                data-sort-type="date"
                data-action="click->nanoui-data-table#sort">
              <button type="button" class="nano-table__sort">Failed at</button>
            </th>
          </tr>
        </thead>
        <tbody class="nano-table__body" data-nanoui-data-table-target="body">
          <tr class="nano-table__row" data-nanoui-data-table-target="row">
            <td class="nano-table__cell">Alice Anderson</td>
            <td class="nano-table__cell" data-sort-value="49">$49.00</td>
            <td class="nano-table__cell" data-sort-value="2026-04-15">Apr 15</td>
          </tr>
          <tr class="nano-table__row" data-nanoui-data-table-target="row">
            <td class="nano-table__cell">Carol Carver</td>
            <td class="nano-table__cell" data-sort-value="149">$149.00</td>
            <td class="nano-table__cell" data-sort-value="2026-04-10">Apr 10</td>
          </tr>
          <tr class="nano-table__row" data-nanoui-data-table-target="row">
            <td class="nano-table__cell">Bob Baker</td>
            <td class="nano-table__cell" data-sort-value="349">$349.00</td>
            <td class="nano-table__cell" data-sort-value="2026-04-12">Apr 12</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;div class="nano-table-wrapper" data-controller="nanoui-data-table"&gt;
  &lt;table class="nano-table"&gt;
    &lt;thead class="nano-table__head"&gt;
      &lt;tr&gt;
        &lt;th class="nano-table__header nano-table__header--sortable"
            data-nanoui-data-table-target="header"
            data-sort-key="amount"
            data-sort-type="number"
            data-action="click-&gt;nanoui-data-table#sort"&gt;
          &lt;button type="button" class="nano-table__sort"&gt;Amount&lt;/button&gt;
        &lt;/th&gt;
      &lt;/tr&gt;
    &lt;/thead&gt;
    &lt;tbody class="nano-table__body" data-nanoui-data-table-target="body"&gt;
      &lt;tr class="nano-table__row" data-nanoui-data-table-target="row"&gt;
        &lt;td class="nano-table__cell" data-sort-value="49"&gt;$49.00&lt;/td&gt;
      &lt;/tr&gt;
    &lt;/tbody&gt;
  &lt;/table&gt;
&lt;/div&gt;</code></pre>

  </div>
</div>

## Pagination

Pair the table with `.nano-table-pagination` below. Pagination is a presentation-only component — you can wire it to Turbo, a fetch-and-replace handler, or server-rendered links.

<div class="docs-example">
  <div class="docs-example__header">
    <span>Preview</span>
    <button class="docs-example__copy">Copy</button>
  </div>
  <div class="docs-preview">
    <nav class="nano-table-pagination" aria-label="Table pagination">
      <span class="nano-table-pagination__info">
        Showing <strong>1–10</strong> of <strong>42</strong>
      </span>
      <span class="nano-table-pagination__controls">
        <a class="nano-table-pagination__button" aria-disabled="true" href="#">←</a>
        <a class="nano-table-pagination__button" aria-current="page" href="#">1</a>
        <a class="nano-table-pagination__button" href="#">2</a>
        <a class="nano-table-pagination__button" href="#">3</a>
        <span class="nano-table-pagination__ellipsis">…</span>
        <a class="nano-table-pagination__button" href="#">5</a>
        <a class="nano-table-pagination__button" href="#">→</a>
      </span>
    </nav>
  </div>
  <div class="docs-example__code">

<pre><code>&lt;nav class="nano-table-pagination" aria-label="Table pagination"&gt;
  &lt;span class="nano-table-pagination__info"&gt;
    Showing &lt;strong&gt;1–10&lt;/strong&gt; of &lt;strong&gt;42&lt;/strong&gt;
  &lt;/span&gt;
  &lt;span class="nano-table-pagination__controls"&gt;
    &lt;a class="nano-table-pagination__button" aria-current="page" href="?page=1"&gt;1&lt;/a&gt;
    &lt;a class="nano-table-pagination__button" href="?page=2"&gt;2&lt;/a&gt;
    &lt;span class="nano-table-pagination__ellipsis"&gt;…&lt;/span&gt;
    &lt;a class="nano-table-pagination__button" href="?page=5"&gt;5&lt;/a&gt;
  &lt;/span&gt;
&lt;/nav&gt;</code></pre>

  </div>
</div>

## Data table Stimulus API

- Controller: `nanoui-data-table`
- Targets: `header`, `body`, `row`
- Values: `server` (Boolean, default `false`) — when `true`, skip client-side sorting and only dispatch the event
- Events: `nanoui-data-table:sort` with `{ key, direction }` in detail
