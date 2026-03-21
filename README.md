# NanoUI

Vanilla CSS + Stimulus component library for Rails. Zero runtime dependencies.

23 components. Semantic HTML. Accessible by default. No build step.

**[Documentation & Live Previews](https://chille1987.github.io/nanoui/)** — Browse all 23 components with interactive examples.

## What's New in v0.5.0

- **5 new components** — Navbar, Sidebar, Breadcrumb, Avatar, and Skeleton
- **Native CSS nesting** — All component CSS refactored to use native nesting for better readability
- **New component groups** — `navigation` (navbar, sidebar, breadcrumb) and `feedback` (avatar, skeleton)

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
nanoui_dialog_controller.js    → data-controller="nanoui-dialog"
nanoui_dropdown_controller.js  → data-controller="nanoui-dropdown"
nanoui_tooltip_controller.js   → data-controller="nanoui-tooltip"
nanoui_toast_controller.js     → data-controller="nanoui-toast"
nanoui_tabs_controller.js      → data-controller="nanoui-tabs"
nanoui_accordion_controller.js → data-controller="nanoui-accordion"
nanoui_switch_controller.js    → data-controller="nanoui-switch"
nanoui_navbar_controller.js    → data-controller="nanoui-navbar"
nanoui_sidebar_controller.js   → data-controller="nanoui-sidebar"
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
| **Forms** | Checkbox, Radio, Switch, Select |
| **Overlays** | Dialog, Dropdown, Tooltip, Toast |
| **Data** | Table, Tabs, Accordion, Progress |
| **Navigation** | Navbar, Sidebar, Breadcrumb |
| **Feedback** | Avatar, Skeleton |
| **Layout** | Container |

```bash
rails generate nanoui:component --group essentials
rails generate nanoui:component --group forms
rails generate nanoui:component --group overlays
rails generate nanoui:component --group data
rails generate nanoui:component --group navigation
rails generate nanoui:component --group feedback
rails generate nanoui:component --all
```

---

## Philosophy

- **Semantic HTML first** — `<dialog>`, `<details>`, `<progress>`, `<fieldset>`, `<output>`
- **Native element styling** — Bare HTML elements look good without classes
- **Accessibility is not optional** — ARIA attributes, keyboard navigation, focus management, screen reader support
- **No build step** — No Tailwind, no PostCSS, no webpack. Vanilla CSS with native nesting
- **You own the code** — Generator copies files into your app. Edit freely, no runtime dependency
- **BEM naming** — `.nano-block`, `.nano-block--modifier`, `.nano-block__element`
- **CSS custom properties** — One file to theme everything. Dark mode with a single class swap

## Browser Support

Chrome 120+, Firefox 117+, Safari 17.2+ (native CSS nesting and `<dialog>` support).

## Icons

NanoUI works great with [Lucide Icons](https://lucide.dev) (MIT licensed). Use inline SVGs — copy what you need.

## Credits

Icons from [Lucide](https://lucide.dev).

## License

MIT
