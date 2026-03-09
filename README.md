# NanoUI

Vanilla CSS + Stimulus component library for Rails. shadcn/ui design quality, zero runtime dependencies.

18 components. Semantic HTML. Accessible by default. No build step.

## Installation

### Option A: Rubygem with Generators (recommended)

```ruby
# Gemfile
gem "nanoui", group: :development
```

```bash
bundle install
rails generate nanoui:install          # Tokens, base, fonts
rails generate nanoui:component --all  # All components
```

### Option B: Manual Installation

Copy files directly into your Rails 8 app:

```bash
# 1. CSS (tokens, base, components, Inter Variable font)
cp -r lib/generators/nanoui/templates/css/ app/assets/stylesheets/nanoui/

# 2. Stimulus controllers
cp lib/generators/nanoui/templates/js/controllers/*_controller.js \
   app/javascript/controllers/

# 3. ERB partials (optional — you can use CSS classes directly)
cp lib/generators/nanoui/templates/views/components/ app/views/components/
```

### Import CSS

Add to `app/assets/stylesheets/application.css`:

```css
@import "nanoui/nanoui.css";
```

`rails generate nanoui:install` now creates a foundation-only `nanoui.css`, and each `nanoui:component` run rewrites the component imports so the file only references CSS that actually exists.

NanoUI ships with Inter Variable and expects it at `app/assets/stylesheets/nanoui/fonts/inter-variable.ttf`, which `rails generate nanoui:install` now copies automatically.

Or if using Propshaft, add the import to your layout:

```erb
<%= stylesheet_link_tag "nanoui/nanoui.css" %>
```

### Troubleshooting Fonts

If NanoUI falls back to system fonts instead of Inter:

- Confirm the font file exists at `app/assets/stylesheets/nanoui/fonts/inter-variable.ttf`
- Confirm `app/assets/stylesheets/nanoui/base/_globals.css` still points to `url("../fonts/inter-variable.ttf")`
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

```erb
<!-- In your layout -->
<html class="<%= "dark" if user_prefers_dark? %>">
```

Or toggle via JavaScript:

```js
document.documentElement.classList.toggle("dark")
```

---

## Component Reference

### Essentials

#### Button

6 variants, 3 sizes, icon-only, loading state.

```erb
<%= render "components/button", variant: "primary" do %>
  Save Changes
<% end %>

<%= render "components/button", variant: "outline", size: "sm" do %>
  Cancel
<% end %>

<%= render "components/button", variant: "destructive" do %>
  Delete
<% end %>

<%# Link styled as button %>
<%= render "components/button", href: "/about", variant: "ghost" do %>
  Learn More
<% end %>
```

Or use classes directly:

```html
<button class="button button--primary" type="button">Save</button>
<button class="button button--outline button--sm" type="button">Cancel</button>
<button class="button button--primary" disabled>Disabled</button>
```

**Options:** `variant` (primary, secondary, destructive, outline, ghost, link), `size` (sm, lg, icon), `tag` (:button), `href`, `class`, `html`

#### Input

Text fields wrapped in `.field` with label and error support.

```erb
<%= render "components/input", label: "Email", type: "email", required: true,
    html: { placeholder: "you@example.com" } %>

<%= render "components/input", label: "Name", error: "Name is required" %>
```

```html
<div class="field">
  <label for="email" class="label label--required">Email</label>
  <input id="email" type="email" class="input" placeholder="you@example.com" required>
</div>
```

**Options:** `label`, `type` ("text"), `required`, `error`, `id`, `class`, `html`

#### Label

```erb
<%= render "components/label", for: "name", required: true do %>Name<% end %>
```

```html
<label for="name" class="label label--required">Name</label>
```

#### Card

Container with header, content, and footer sections.

```erb
<%= render "components/card", title: "Settings", description: "Manage your account." do %>
  <% content_for(:footer) do %>
    <%= render "components/button", variant: "primary" do %>Save<% end %>
  <% end %>
  <p>Card body content here.</p>
<% end %>
```

```html
<article class="card">
  <div class="card__header">
    <h3 class="card__title">Settings</h3>
    <p class="card__description">Manage your account.</p>
  </div>
  <div class="card__content">...</div>
  <div class="card__footer">...</div>
</article>
```

**Variants:** default, `elevated`, `bordered`

#### Badge

Inline status indicators.

```erb
<%= render "components/badge", variant: "success" do %>Active<% end %>
<%= render "components/badge", variant: "warning" do %>Pending<% end %>
```

```html
<span class="badge badge--success">Active</span>
<span class="badge badge--destructive">Failed</span>
```

**Variants:** primary, secondary, destructive, outline, success, warning

#### Alert

Contextual feedback with icon, title, and description.

```erb
<%= render "components/alert", variant: "success", title: "Saved!" do %>
  Your changes have been saved successfully.
<% end %>
```

```html
<div class="alert alert--success" role="alert">
  <div class="alert__icon"><!-- SVG --></div>
  <div class="alert__content">
    <p class="alert__title">Saved!</p>
    <p class="alert__description">Your changes have been saved.</p>
  </div>
</div>
```

**Variants:** default, destructive, success, warning

---

### Forms

#### Checkbox

```erb
<%= render "components/checkbox", label: "Accept terms", name: "tos", error: true %>
<%= render "components/checkbox", label: "Remember me", checked: true %>
```

```html
<div class="checkbox">
  <input type="checkbox" id="tos" class="checkbox__input" name="tos">
  <label for="tos" class="checkbox__label">Accept terms</label>
</div>
```

**Options:** `label`, `name`, `value`, `checked`, `disabled`, `error`, `id`

#### Radio Group

```erb
<%= render "components/radio_group",
    legend: "Plan",
    name: "plan",
    options: [
      { label: "Free", value: "free", checked: true },
      { label: "Pro", value: "pro" },
      { label: "Enterprise", value: "enterprise" }
    ] %>
```

```html
<fieldset class="radio-group">
  <legend class="radio-group__legend">Plan</legend>
  <div class="radio">
    <input type="radio" id="plan-0" name="plan" value="free" class="radio__input" checked>
    <label for="plan-0" class="radio__label">Free</label>
  </div>
  <!-- ... -->
</fieldset>
```

#### Switch

Toggle switch with Stimulus controller.

```erb
<%= render "components/switch", label: "Enable notifications", checked: true %>
```

```html
<button type="button" role="switch" aria-checked="true" class="switch"
        data-controller="nanoui-switch" data-action="nanoui-switch#toggle">
  <span class="switch__thumb"></span>
  <span class="sr-only">Enable notifications</span>
</button>
```

#### Select

Native `<select>` with custom styling.

```erb
<%= render "components/select",
    label: "Country",
    placeholder: "Select a country",
    options: ["United States", "Canada", "United Kingdom"] %>

<%= render "components/select",
    label: "Role",
    required: true,
    options: [
      { label: "Admin", value: "admin" },
      { label: "Editor", value: "editor" }
    ] %>
```

**Options:** `label`, `placeholder`, `options`, `required`, `error`, `disabled`, `name`, `id`

---

### Overlays

#### Dialog

Native `<dialog>` with `showModal()` — free focus trap, Escape close, and `::backdrop`.

```erb
<%= render "components/dialog", title: "Edit Profile", description: "Update your info." do %>
  <% content_for(:trigger) do %>
    <%= render "components/button" do %>Open<% end %>
  <% end %>
  <% content_for(:footer) do %>
    <button class="button button--outline" data-action="nanoui-dialog#close">Cancel</button>
    <button class="button button--primary">Save</button>
  <% end %>
  <p>Dialog body content.</p>
<% end %>
```

```html
<div data-controller="nanoui-dialog">
  <button data-action="nanoui-dialog#open">Open</button>

  <dialog data-nanoui-dialog-target="modal" class="dialog"
          aria-labelledby="dialog-title">
    <div class="dialog__content">
      <header class="dialog__header">
        <h2 id="dialog-title" class="dialog__title">Title</h2>
      </header>
      <div class="dialog__body">...</div>
      <footer class="dialog__footer">...</footer>
      <button class="dialog__close" data-action="nanoui-dialog#close"
              aria-label="Close dialog">...</button>
    </div>
  </dialog>
</div>
```

**Sizes:** `sm` (24rem), default/`md` (32rem), `lg` (42rem), `full`

#### Dropdown

Click-activated menu with keyboard navigation.

```erb
<%= render "components/dropdown" do %>
  <% content_for(:trigger) do %>
    <%= render "components/button", variant: "outline" do %>Options<% end %>
  <% end %>
  <button class="dropdown__item">Profile</button>
  <button class="dropdown__item">Settings</button>
  <div class="dropdown__separator"></div>
  <button class="dropdown__item">Log out</button>
<% end %>
```

Keyboard: Arrow Up/Down navigates items, Escape closes, click outside closes.

#### Tooltip

Hover/focus tooltip with configurable delay.

```erb
<%= render "components/tooltip", text: "Add to favorites", position: "top" do %>
  <%= render "components/button", variant: "primary", size: "icon" do %>
    <!-- heart icon SVG -->
  <% end %>
<% end %>
```

**Positions:** top (default), bottom, left, right. **Delay:** 200ms default.

#### Toast

Auto-dismissing notifications stacked bottom-right.

Place the container once in your layout:

```erb
<%# app/views/layouts/application.html.erb %>
<%= render "components/toast_container" %>
```

Add toasts dynamically (via Turbo Stream or JS):

```erb
<%= render "components/toast", variant: "success",
    title: "Saved!", description: "Changes applied." %>
```

**Variants:** default, success, destructive, warning. **Auto-dismiss:** 5000ms default.

---

### Data Display

#### Table

Semantic table with responsive scroll wrapper.

```erb
<%= render "components/table",
    headers: ["Name", "Email", "Status"],
    striped: true, hoverable: true do %>
  <tr class="table__row">
    <td class="table__cell">Jane Doe</td>
    <td class="table__cell">jane@example.com</td>
    <td class="table__cell">
      <%= render "components/badge", variant: "success" do %>Active<% end %>
    </td>
  </tr>
<% end %>
```

**Options:** `headers`, `striped`, `hoverable`, `class`

#### Tabs

WAI-ARIA tabs pattern with arrow key navigation.

```erb
<%= render "components/tabs", label: "Settings", tabs: [
  { id: "general", label: "General", content: "<p>General settings...</p>", active: true },
  { id: "security", label: "Security", content: "<p>Security settings...</p>" },
  { id: "billing", label: "Billing", content: "<p>Billing info...</p>" }
] %>
```

**Options:** `tabs` (array), `label` (aria-label), `hash` (URL hash sync)

#### Accordion

Native `<details>`/`<summary>` with optional single-open mode.

```erb
<%= render "components/accordion", single: true, items: [
  { title: "Is it free?", content: "Yes, MIT licensed.", open: true },
  { title: "Build step?", content: "No, vanilla CSS." },
  { title: "Dark mode?", content: "Add .dark class to <html>." }
] %>
```

**Options:** `items` (array), `single` (single-open mode), `class`

#### Progress

Native `<progress>` element with custom styling.

```erb
<%= render "components/progress", value: 65, label: "65%", aria_label: "Upload progress" %>
<%= render "components/progress", value: 100, variant: "success", label: "Complete" %>
```

**Variants:** default (primary), success, warning, destructive

---

## Design Tokens

Customize your theme by editing the CSS custom properties:

| Token File | What it controls |
|---|---|
| `tokens/_colors.css` | All colors (HSL), dark mode overrides |
| `tokens/_typography.css` | Font families, sizes, weights, line heights |
| `tokens/_spacing.css` | Spacing scale (0 to 16) |
| `tokens/_radius.css` | Border radii (sm to full) |
| `tokens/_shadows.css` | Box shadows (sm to xl) |
| `tokens/_transitions.css` | Durations and easings |
| `tokens/_z-index.css` | Z-index scale (dropdown to toast) |

### Changing your brand color

Edit one line in `tokens/_colors.css`:

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

```bash
rails generate nanoui:component --group essentials
rails generate nanoui:component --group forms
rails generate nanoui:component --group overlays
rails generate nanoui:component --group data
rails generate nanoui:component --all
```

---

## Philosophy

- **Semantic HTML first** — `<dialog>`, `<details>`, `<progress>`, `<fieldset>`, `<output>`
- **Accessibility is not optional** — ARIA attributes, keyboard navigation, focus management, screen reader support
- **No build step** — No Tailwind, no PostCSS, no webpack. Vanilla CSS with native nesting
- **You own the code** — Generator copies files into your app. Edit freely, no runtime dependency
- **BEM naming** — `.block`, `.block--modifier`, `.block__element`
- **CSS custom properties** — One file to theme everything. Dark mode with a single class swap

## Browser Support

Chrome 120+, Firefox 117+, Safari 17.2+ (native CSS nesting and `<dialog>` support).

## Icons

NanoUI works great with [Lucide Icons](https://lucide.dev) (MIT licensed). Use inline SVGs — copy what you need.

## Credits

Built with inspiration from [shadcn/ui](https://ui.shadcn.com). Icons from [Lucide](https://lucide.dev).

## License

MIT
