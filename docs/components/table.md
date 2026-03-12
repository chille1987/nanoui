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
