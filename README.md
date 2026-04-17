# NanoUI

Vanilla CSS + Stimulus component library for Rails. Zero runtime dependencies.

30 components. Semantic HTML. Accessible by default. No build step.

**[Documentation & Live Previews](https://chille1987.github.io/nanoui/)** — Browse all 30 components with interactive examples.

## What's New in v0.6.0

- **7 new components** — Stat, Empty state, Timeline, Checklist, Copy, Code, Upload
- **Sortable data tables** — `nanoui-data-table` Stimulus controller with client- or server-side sorting + pagination styling
- **Toast action buttons** — inline CTAs styled to match each toast variant
- **New component groups** — `dashboard` (stat, empty, timeline, checklist) and `utilities` (copy, code)
- **CI + release automation** — GitHub Actions for RSpec / Rubocop and tag-driven gem publishing

## Installation

### Option A: Rubygem with Generators (recommended)

```ruby
# Gemfile
gem "nanoui", group: :development
```

```bash
bundle install
rails generate nanoui:install          # Base styles and fonts
rails generate nanoui:component --all  # All components
```

Propshaft auto-loads the CSS files — no imports or entry points to manage.

### Option B: Manual Installation

Copy files directly into your Rails 8 app:

```bash
# 1. CSS (base, components, Inter Variable font)
mkdir -p app/assets/stylesheets/nanoui
cp -r lib/generators/nanoui/templates/css/base app/assets/stylesheets/nanoui/
cp -r lib/generators/nanoui/templates/css/components app/assets/stylesheets/nanoui/
cp -r lib/generators/nanoui/templates/css/fonts app/assets/stylesheets/nanoui/

# 2. Stimulus controllers
cp lib/generators/nanoui/templates/js/controllers/*_controller.js \
   app/javascript/controllers/
```

### Troubleshooting Fonts

NanoUI ships with Inter Variable and expects it at `app/assets/stylesheets/nanoui/fonts/inter-variable.ttf`, which `rails generate nanoui:install` copies automatically.

If NanoUI falls back to system fonts instead of Inter:

- Confirm the font file exists at `app/assets/stylesheets/nanoui/fonts/inter-variable.ttf`
- Confirm `app/assets/stylesheets/nanoui/base/02_fonts.css` still points to `url("../fonts/inter-variable.ttf")`
- If you installed NanoUI before this change, rerun `rails generate nanoui:install` or copy `lib/generators/nanoui/templates/css/fonts/inter-variable.ttf` into `app/assets/stylesheets/nanoui/fonts/`
- In the browser devtools Network tab, verify `inter-variable.ttf` loads successfully instead of returning `404`

### Register Stimulus Controllers

With Rails 8 + importmap + `eagerLoadControllersFrom`, controllers auto-register by file name. Rename the controllers with a `nanoui_` prefix:

```
nanoui_dialog_controller.js      → data-controller="nanoui-dialog"
nanoui_dropdown_controller.js    → data-controller="nanoui-dropdown"
nanoui_tooltip_controller.js     → data-controller="nanoui-tooltip"
nanoui_toast_controller.js       → data-controller="nanoui-toast"
nanoui_tabs_controller.js        → data-controller="nanoui-tabs"
nanoui_accordion_controller.js   → data-controller="nanoui-accordion"
nanoui_switch_controller.js      → data-controller="nanoui-switch"
nanoui_navbar_controller.js      → data-controller="nanoui-navbar"
nanoui_sidebar_controller.js     → data-controller="nanoui-sidebar"
nanoui_copy_controller.js        → data-controller="nanoui-copy"
nanoui_upload_controller.js      → data-controller="nanoui-upload"
nanoui_data_table_controller.js  → data-controller="nanoui-data-table"
```

Or register manually:

```js
// app/javascript/controllers/index.js
import DialogController from "./nanoui_dialog_controller"
application.register("nanoui-dialog", DialogController)
// ... repeat for each controller
```

### Dark Mode

Add the `.dark` class to `<html>` to toggle dark mode. All color tokens swap automatically.

```html
<html class="dark">
```

Or toggle via JavaScript:

```js
document.documentElement.classList.toggle("dark")
```

---

## Native Element Styling

NanoUI styles bare HTML elements automatically. No classes required for the defaults:

```html
<!-- Renders as a styled primary button -->
<button>Save Changes</button>

<!-- Renders with input styling -->
<input type="text" placeholder="Enter your name">

<!-- Renders with select styling -->
<select>
  <option>Option 1</option>
  <option>Option 2</option>
</select>

<!-- Renders with label styling -->
<label for="name">Name</label>
```

Use `.nano-*` classes when you need variants:

```html
<button class="nano-btn--outline">Cancel</button>
<button class="nano-btn--destructive">Delete</button>
<button class="nano-btn--sm">Small</button>
```

---

## Component Reference

### Essentials

#### Button

6 variants, 3 sizes, icon-only, loading state. Bare `<button>` renders as a primary button.

```html
<button>Save Changes</button>
<button class="nano-btn--outline nano-btn--sm">Cancel</button>
<button class="nano-btn--destructive">Delete</button>
<a href="/about" class="nano-btn nano-btn--ghost">Learn More</a>
<button disabled>Disabled</button>
```

**Variants:** primary (default), secondary, destructive, outline, ghost, link
**Sizes:** sm, lg, icon

#### Input

Text fields wrapped in `.nano-field` with label and error support. Bare `<input>` gets input styling automatically.

```html
<div class="nano-field">
  <label for="email">Email</label>
  <input id="email" type="email" placeholder="you@example.com" required>
</div>

<div class="nano-field nano-field--error">
  <label for="name">Name</label>
  <input id="name" type="text">
  <p class="nano-field__error">Name is required</p>
</div>
```

#### Label

Bare `<label>` gets label styling. Add `nano-label--required` for the required indicator.

```html
<label for="name">Name</label>
<label for="email" class="nano-label--required">Email</label>
```

#### Card

Container with header, content, and footer sections.

```html
<article class="nano-card">
  <div class="nano-card__header">
    <h3 class="nano-card__title">Settings</h3>
    <p class="nano-card__description">Manage your account.</p>
  </div>
  <div class="nano-card__content">
    <p>Card body content here.</p>
  </div>
  <div class="nano-card__footer">
    <button>Save</button>
  </div>
</article>
```

**Variants:** default, `elevated`, `bordered`

#### Badge

Inline status indicators.

```html
<span class="nano-badge nano-badge--success">Active</span>
<span class="nano-badge nano-badge--warning">Pending</span>
<span class="nano-badge nano-badge--destructive">Failed</span>
```

**Variants:** primary, secondary, destructive, outline, success, warning

#### Alert

Contextual feedback with icon, title, and description.

```html
<div class="nano-alert nano-alert--success" role="alert">
  <div class="nano-alert__icon"><!-- SVG --></div>
  <div class="nano-alert__content">
    <p class="nano-alert__title">Saved!</p>
    <p class="nano-alert__description">Your changes have been saved.</p>
  </div>
</div>
```

**Variants:** default, destructive, success, warning

---

### Forms

#### Checkbox

```html
<div class="nano-checkbox">
  <input type="checkbox" id="tos" class="nano-checkbox__input" name="tos">
  <label for="tos" class="nano-checkbox__label">Accept terms</label>
</div>
```

#### Radio Group

```html
<fieldset class="nano-radio-group">
  <legend class="nano-radio-group__legend">Plan</legend>
  <div class="nano-radio">
    <input type="radio" id="plan-free" name="plan" value="free" class="nano-radio__input" checked>
    <label for="plan-free" class="nano-radio__label">Free</label>
  </div>
  <div class="nano-radio">
    <input type="radio" id="plan-pro" name="plan" value="pro" class="nano-radio__input">
    <label for="plan-pro" class="nano-radio__label">Pro</label>
  </div>
  <div class="nano-radio">
    <input type="radio" id="plan-ent" name="plan" value="enterprise" class="nano-radio__input">
    <label for="plan-ent" class="nano-radio__label">Enterprise</label>
  </div>
</fieldset>
```

#### Switch

Toggle switch with Stimulus controller.

```html
<button type="button" role="switch" aria-checked="true" class="nano-switch"
        data-controller="nanoui-switch" data-action="nanoui-switch#toggle">
  <span class="nano-switch__thumb"></span>
  <span class="nano-sr-only">Enable notifications</span>
</button>
```

#### Select

Native `<select>` with custom styling. Bare `<select>` gets styled automatically.

```html
<div class="nano-field">
  <label for="country">Country</label>
  <select id="country">
    <option value="">Select a country</option>
    <option>United States</option>
    <option>Canada</option>
    <option>United Kingdom</option>
  </select>
</div>
```

---

### Overlays

#### Dialog

Native `<dialog>` with `showModal()` — free focus trap, Escape close, and `::backdrop`.

```html
<div data-controller="nanoui-dialog">
  <button data-action="nanoui-dialog#open">Open</button>

  <dialog data-nanoui-dialog-target="modal" class="nano-dialog"
          aria-labelledby="dialog-title">
    <div class="nano-dialog__content">
      <header class="nano-dialog__header">
        <h2 id="dialog-title" class="nano-dialog__title">Edit Profile</h2>
        <p class="nano-dialog__description">Update your info.</p>
      </header>
      <div class="nano-dialog__body">
        <p>Dialog body content.</p>
      </div>
      <footer class="nano-dialog__footer">
        <button class="nano-btn--outline" data-action="nanoui-dialog#close">Cancel</button>
        <button>Save</button>
      </footer>
      <button class="nano-dialog__close" data-action="nanoui-dialog#close"
              aria-label="Close dialog">&times;</button>
    </div>
  </dialog>
</div>
```

**Sizes:** `sm` (24rem), default/`md` (32rem), `lg` (42rem), `full`

#### Dropdown

Click-activated menu with keyboard navigation.

```html
<div data-controller="nanoui-dropdown">
  <button class="nano-btn--outline" data-action="nanoui-dropdown#toggle">Options</button>
  <div class="nano-dropdown__menu" data-nanoui-dropdown-target="menu">
    <button class="nano-dropdown__item">Profile</button>
    <button class="nano-dropdown__item">Settings</button>
    <div class="nano-dropdown__separator"></div>
    <button class="nano-dropdown__item">Log out</button>
  </div>
</div>
```

Keyboard: Arrow Up/Down navigates items, Escape closes, click outside closes.

#### Tooltip

Hover/focus tooltip with configurable delay.

```html
<div data-controller="nanoui-tooltip" data-nanoui-tooltip-text-value="Add to favorites">
  <button class="nano-btn--primary nano-btn--icon">
    <!-- heart icon SVG -->
  </button>
</div>
```

**Positions:** top (default), bottom, left, right. **Delay:** 200ms default.

#### Toast

Auto-dismissing notifications stacked bottom-right.

Place the container once in your layout:

```html
<div class="nano-toast-container" data-controller="nanoui-toast"></div>
```

Add toasts dynamically:

```html
<div class="nano-toast nano-toast--success" role="alert">
  <div class="nano-toast__content">
    <p class="nano-toast__title">Saved!</p>
    <p class="nano-toast__description">Changes applied.</p>
  </div>
</div>
```

**Variants:** default, success, destructive, warning. **Auto-dismiss:** 5000ms default.

---

### Data Display

#### Table

Semantic table with responsive scroll wrapper.

```html
<div class="nano-table-wrapper">
  <table class="nano-table nano-table--striped nano-table--hoverable">
    <thead>
      <tr>
        <th class="nano-table__head">Name</th>
        <th class="nano-table__head">Email</th>
        <th class="nano-table__head">Status</th>
      </tr>
    </thead>
    <tbody>
      <tr class="nano-table__row">
        <td class="nano-table__cell">Jane Doe</td>
        <td class="nano-table__cell">jane@example.com</td>
        <td class="nano-table__cell">
          <span class="nano-badge nano-badge--success">Active</span>
        </td>
      </tr>
    </tbody>
  </table>
</div>
```

#### Tabs

WAI-ARIA tabs pattern with arrow key navigation.

```html
<div data-controller="nanoui-tabs" class="nano-tabs">
  <div role="tablist" aria-label="Settings" class="nano-tabs__list">
    <button role="tab" aria-selected="true" aria-controls="general"
            class="nano-tabs__trigger" data-action="nanoui-tabs#select">General</button>
    <button role="tab" aria-selected="false" aria-controls="security"
            class="nano-tabs__trigger" data-action="nanoui-tabs#select">Security</button>
    <button role="tab" aria-selected="false" aria-controls="billing"
            class="nano-tabs__trigger" data-action="nanoui-tabs#select">Billing</button>
  </div>
  <div role="tabpanel" id="general" class="nano-tabs__content">General settings...</div>
  <div role="tabpanel" id="security" class="nano-tabs__content" hidden>Security settings...</div>
  <div role="tabpanel" id="billing" class="nano-tabs__content" hidden>Billing info...</div>
</div>
```

#### Accordion

Native `<details>`/`<summary>` with optional single-open mode.

```html
<div class="nano-accordion" data-controller="nanoui-accordion"
     data-nanoui-accordion-single-value="true">
  <details class="nano-accordion__item" open>
    <summary class="nano-accordion__trigger">Is it free?</summary>
    <div class="nano-accordion__content">Yes, MIT licensed.</div>
  </details>
  <details class="nano-accordion__item">
    <summary class="nano-accordion__trigger">Build step?</summary>
    <div class="nano-accordion__content">No, vanilla CSS.</div>
  </details>
  <details class="nano-accordion__item">
    <summary class="nano-accordion__trigger">Dark mode?</summary>
    <div class="nano-accordion__content">Add .dark class to &lt;html&gt;.</div>
  </details>
</div>
```

#### Progress

Native `<progress>` element with custom styling.

```html
<div class="nano-progress">
  <progress class="nano-progress__bar" value="65" max="100"></progress>
  <span class="nano-progress__label">65%</span>
</div>

<div class="nano-progress nano-progress--success">
  <progress class="nano-progress__bar" value="100" max="100"></progress>
  <span class="nano-progress__label">Complete</span>
</div>
```

**Variants:** default (primary), success, warning, destructive

---

### Navigation

#### Navbar

Responsive top navigation bar with mobile hamburger menu.

```html
<nav class="nano-navbar nano-navbar--sticky" data-controller="nanoui-navbar">
  <a href="/" class="nano-navbar__brand">MyApp</a>
  <ul class="nano-navbar__links" data-nanoui-navbar-target="links">
    <li><a href="/dashboard" class="nano-navbar__link nano-navbar__link--active">Dashboard</a></li>
    <li><a href="/projects" class="nano-navbar__link">Projects</a></li>
    <li><a href="/settings" class="nano-navbar__link">Settings</a></li>
  </ul>
  <div class="nano-navbar__actions">
    <button class="nano-btn--outline nano-btn--sm">Log out</button>
  </div>
  <button class="nano-navbar__toggle" data-action="nanoui-navbar#toggle"
          data-nanoui-navbar-target="toggle" aria-label="Toggle menu">
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
      <path d="M3 12h18M3 6h18M3 18h18"/>
    </svg>
  </button>
</nav>
```

**Modifiers:** `--sticky`

#### Sidebar

Collapsible sidebar navigation panel with groups and icons.

```html
<aside class="nano-sidebar" data-controller="nanoui-sidebar">
  <div class="nano-sidebar__header">
    <span>MyApp</span>
    <button class="nano-sidebar__toggle" data-action="nanoui-sidebar#toggle"
            data-nanoui-sidebar-target="toggle">⟨</button>
  </div>
  <nav class="nano-sidebar__nav">
    <div class="nano-sidebar__group">
      <span class="nano-sidebar__group-label">Main</span>
      <a href="/dashboard" class="nano-sidebar__item nano-sidebar__item--active">
        <svg><!-- icon --></svg> <span>Dashboard</span>
      </a>
      <a href="/projects" class="nano-sidebar__item">
        <svg><!-- icon --></svg> <span>Projects</span>
      </a>
    </div>
  </nav>
  <div class="nano-sidebar__footer">
    <a href="/settings" class="nano-sidebar__item">
      <svg><!-- icon --></svg> <span>Settings</span>
    </a>
  </div>
</aside>
```

#### Breadcrumb

Navigation trail with separators.

```html
<nav class="nano-breadcrumb" aria-label="Breadcrumb">
  <ol class="nano-breadcrumb__list">
    <li class="nano-breadcrumb__item">
      <a href="/" class="nano-breadcrumb__link">Home</a>
      <span class="nano-breadcrumb__separator" aria-hidden="true"></span>
    </li>
    <li class="nano-breadcrumb__item">
      <a href="/projects" class="nano-breadcrumb__link">Projects</a>
      <span class="nano-breadcrumb__separator" aria-hidden="true"></span>
    </li>
    <li class="nano-breadcrumb__item">
      <span class="nano-breadcrumb__link" aria-current="page">Settings</span>
    </li>
  </ol>
</nav>
```

---

### Feedback

#### Avatar

Circular avatar with image or initials fallback and optional status indicator.

```html
<div class="nano-avatar">
  <img src="/avatar.jpg" alt="Jane Doe" class="nano-avatar__image">
  <span class="nano-avatar__status nano-avatar__status--online"></span>
</div>

<div class="nano-avatar nano-avatar--lg">
  <span class="nano-avatar__fallback">JD</span>
</div>
```

**Sizes:** sm (32px), default (40px), lg (48px), xl (64px)
**Status:** `--online`, `--offline`, `--busy`

#### Skeleton

Loading placeholder with shimmer animation.

```html
<div class="nano-skeleton" style="width: 200px;"></div>
<div class="nano-skeleton nano-skeleton--text" style="width: 80%;"></div>
<div class="nano-skeleton nano-skeleton--circle"></div>
<div class="nano-skeleton nano-skeleton--card"></div>
```

**Variants:** default (1rem line), `--text` (0.75rem), `--circle` (40px), `--card` (200px)

---

### Dashboard

#### Stat

Dashboard KPI card with label, value, optional delta, helper text, and footer. Group multiples with `.nano-stat-grid`.

```html
<div class="nano-stat">
  <span class="nano-stat__label">Recovered revenue</span>
  <span class="nano-stat__value">$4,238</span>
  <span class="nano-stat__delta nano-stat__delta--up">12% vs last month</span>
</div>

<div class="nano-stat-grid">
  <div class="nano-stat">…</div>
  <div class="nano-stat nano-stat--compact">…</div>
</div>
```

**Variants:** default, `--elevated`, `--bordered`, `--compact`

#### Empty state

Centered layout for "no data yet" or "get started" screens.

```html
<div class="nano-empty">
  <div class="nano-empty__icon"><!-- SVG --></div>
  <h3 class="nano-empty__title">No failed payments yet</h3>
  <p class="nano-empty__description">When Stripe reports a failed charge we'll queue retries here.</p>
  <div class="nano-empty__actions">
    <button class="nano-btn nano-btn--primary">Connect Stripe</button>
  </div>
</div>
```

**Variants:** default, `--bordered` (dashed outline), `--compact`

#### Timeline

Vertical activity feed with color-coded markers.

```html
<ol class="nano-timeline">
  <li class="nano-timeline__item nano-timeline__item--destructive">
    <span class="nano-timeline__marker"><!-- SVG --></span>
    <span class="nano-timeline__line"></span>
    <div class="nano-timeline__body">
      <div class="nano-timeline__header">
        <span class="nano-timeline__title">Payment failed</span>
        <time class="nano-timeline__time">3 days ago</time>
      </div>
      <span class="nano-timeline__description">Card declined — insufficient funds.</span>
    </div>
  </li>
</ol>
```

**Item states:** default, `--info`, `--success`, `--warning`, `--destructive`

#### Checklist

Onboarding / setup checklist with pending, current, and done states. Drive the summary bar with the `--nano-checklist-progress` CSS variable.

```html
<div class="nano-checklist">
  <div class="nano-checklist__summary">
    <span><span class="nano-checklist__count">2 of 4</span> complete</span>
    <span class="nano-checklist__bar" style="--nano-checklist-progress: 50%;">
      <span class="nano-checklist__bar-fill"></span>
    </span>
  </div>
  <div class="nano-checklist__item nano-checklist__item--done">
    <span class="nano-checklist__indicator"><!-- check SVG --></span>
    <div class="nano-checklist__body">
      <span class="nano-checklist__title">Connect Stripe</span>
    </div>
  </div>
  <div class="nano-checklist__item nano-checklist__item--current">
    <span class="nano-checklist__indicator">3</span>
    <div class="nano-checklist__body">
      <span class="nano-checklist__title">Pick an email template</span>
      <a class="nano-checklist__action" href="#">Choose template →</a>
    </div>
  </div>
</div>
```

---

### Utilities

#### Copy to clipboard

Button (or button + value) that copies to clipboard with a transient success state. Uses the Clipboard API with a `document.execCommand` fallback.

```html
<div class="nano-copy" data-controller="nanoui-copy">
  <span class="nano-copy__value" data-nanoui-copy-target="source">
    https://app.example.com/webhooks/stripe
  </span>
  <button class="nano-copy__button"
          data-nanoui-copy-target="button"
          data-action="nanoui-copy#copy"
          type="button">
    <span data-nanoui-copy-target="idle">Copy</span>
    <span data-nanoui-copy-target="copied" hidden>Copied</span>
  </button>
</div>
```

Dispatches `nanoui-copy:copied` with `{ text }` in the event detail.

#### Code

Monospace block with optional header, inline variant, terminal (dark) variant, and wrap mode.

```html
<div class="nano-code">
  <div class="nano-code__header">
    <span class="nano-code__language">shell</span>
  </div>
  <pre class="nano-code__body"><code>stripe listen --forward-to localhost:3000/webhooks/stripe</code></pre>
</div>

<!-- Inline -->
<p>Set <code class="nano-code nano-code--inline">STRIPE_WEBHOOK_SECRET</code> before deploying.</p>
```

**Variants:** default, `--inline`, `--terminal`, `--wrap`

---

### Data table enhancements (built on Table)

Add sortable columns and pagination to any existing table. Installing the `table` component also copies `nanoui_data_table_controller.js`.

```html
<div class="nano-table-wrapper" data-controller="nanoui-data-table">
  <table class="nano-table nano-table--hoverable">
    <thead class="nano-table__head">
      <tr>
        <th class="nano-table__header nano-table__header--sortable"
            data-nanoui-data-table-target="header"
            data-sort-key="amount"
            data-sort-type="number"
            data-action="click->nanoui-data-table#sort">
          <button type="button" class="nano-table__sort">Amount</button>
        </th>
      </tr>
    </thead>
    <tbody class="nano-table__body" data-nanoui-data-table-target="body">
      <tr class="nano-table__row" data-nanoui-data-table-target="row">
        <td class="nano-table__cell" data-sort-value="49">$49.00</td>
      </tr>
    </tbody>
  </table>
</div>

<nav class="nano-table-pagination" aria-label="Table pagination">
  <span class="nano-table-pagination__info">Showing <strong>1–10</strong> of <strong>42</strong></span>
  <span class="nano-table-pagination__controls">
    <a class="nano-table-pagination__button" aria-current="page" href="?page=1">1</a>
    <a class="nano-table-pagination__button" href="?page=2">2</a>
  </span>
</nav>
```

Set `data-nanoui-data-table-server-value="true"` to skip client-side sorting and only dispatch the `nanoui-data-table:sort` event (e.g. for Turbo Frames).

Supported `data-sort-type` values: `string` (default), `number`, `date`.

---

### Forms (extended)

#### Upload

Drag-and-drop file input with preview, `maxSize` / `accept` validation, and accessible fallback to the native picker. Wraps a hidden `<input type="file">` so standard form submission works unchanged (including `form_with` + Active Storage).

```html
<div class="nano-upload"
     data-controller="nanoui-upload"
     data-nanoui-upload-accept-value="image/*"
     data-nanoui-upload-max-size-value="2097152"
     data-action="dragover->nanoui-upload#onDragover dragleave->nanoui-upload#onDragleave drop->nanoui-upload#onDrop">
  <input type="file" name="logo" class="nano-upload__input"
         data-nanoui-upload-target="input"
         data-action="change->nanoui-upload#onChange">
  <label class="nano-upload__dropzone"
         data-nanoui-upload-target="dropzone"
         data-action="click->nanoui-upload#openPicker"
         tabindex="0">
    <span class="nano-upload__icon"><!-- SVG --></span>
    <span class="nano-upload__prompt"><strong>Click to upload</strong> or drag and drop</span>
    <span class="nano-upload__hint">PNG or JPG up to 2 MB</span>
  </label>
  <!-- preview element is toggled automatically via data-state -->
</div>
```

Dispatches `nanoui-upload:selected` and `nanoui-upload:removed`.

---

## Design Tokens

Customize your theme by editing the CSS custom properties:

| Token File | What it controls |
|---|---|
| `base/03_colors.css` | All colors (HSL), dark mode overrides |
| `base/04_typography.css` | Font families, sizes, weights, line heights |
| `base/05_spacing.css` | Spacing scale (0 to 16) |
| `base/06_radius.css` | Border radii (sm to full) |
| `base/07_shadows.css` | Box shadows (sm to xl) |
| `base/08_transitions.css` | Durations and easings |
| `base/09_z-index.css` | Z-index scale (dropdown to toast) |

### Changing your brand color

Edit one line in `base/03_colors.css`:

```css
--color-primary: 220 70% 50%;  /* Change this HSL value */
```

All components update automatically, including dark mode.

---

## Component Groups

| Group | Components |
|---|---|
| **Essentials** | Button, Input, Label, Card, Badge, Alert |
| **Forms** | Checkbox, Radio, Switch, Select, Upload |
| **Overlays** | Dialog, Dropdown, Tooltip, Toast |
| **Data** | Table (with sortable data-table controller), Tabs, Accordion, Progress |
| **Navigation** | Navbar, Sidebar, Breadcrumb |
| **Feedback** | Avatar, Skeleton |
| **Dashboard** | Stat, Empty state, Timeline, Checklist |
| **Utilities** | Copy to clipboard, Code block |
| **Layout** | Container |

```bash
rails generate nanoui:component --group essentials
rails generate nanoui:component --group forms
rails generate nanoui:component --group overlays
rails generate nanoui:component --group data
rails generate nanoui:component --group navigation
rails generate nanoui:component --group feedback
rails generate nanoui:component --group dashboard
rails generate nanoui:component --group utilities
rails generate nanoui:component --all
```

---

## Philosophy

- **Semantic HTML first** — `<dialog>`, `<details>`, `<progress>`, `<fieldset>`, `<output>`
- **Native element styling** — Bare HTML elements look good without classes
- **Accessibility is not optional** — ARIA attributes, keyboard navigation, focus management, screen reader support
- **No build step** — No Tailwind, no PostCSS, no webpack. Vanilla CSS with native nesting (no Sass-style `&--modifier` — always use `&.full-class-name`)
- **You own the code** — Generator copies files into your app. Edit freely, no runtime dependency
- **BEM naming** — `.nano-block`, `.nano-block--modifier`, `.nano-block__element`. Apply both base and modifier classes together in HTML (`class="nano-btn nano-btn--primary"`) — the component CSS selects on that compound.
- **CSS custom properties** — One file to theme everything. Dark mode with a single class swap

## Browser Support

Chrome 120+, Firefox 117+, Safari 17.2+ (native CSS nesting and `<dialog>` support).

## Icons

NanoUI works great with [Lucide Icons](https://lucide.dev) (MIT licensed). Use inline SVGs — copy what you need.

## Credits

Icons from [Lucide](https://lucide.dev).

## License

MIT
