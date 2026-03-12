---
layout: default
title: Getting Started
---

# NanoUI

Vanilla CSS + Stimulus component library for Rails. No build step, no JavaScript framework — just CSS custom properties and optional Stimulus controllers.

## Installation

Add to your Gemfile:

```ruby
gem "nanoui"
```

Then run the generators:

```bash
# Install base styles and fonts
rails generate nanoui:install

# Install all components
rails generate nanoui:component --all

# Or pick specific ones
rails generate nanoui:component button input card
```

## How it works

NanoUI uses **Propshaft** to serve CSS files. Each component is a standalone CSS file — no `@import`, no entry point, no concatenation. Just drop the files in `app/assets/stylesheets/nanoui/` and they're loaded automatically.

### Native element styling

Buttons, inputs, selects, and labels are styled out of the box. Write plain HTML and it looks good:

```html
<button>Save</button>
<input type="email" placeholder="you@example.com">
<select>
  <option>Choose...</option>
</select>
<label>Email</label>
```

Use `.nano-*` classes for variants:

```html
<button class="nano-btn nano-btn--destructive nano-btn--sm">Delete</button>
```

### Component groups

Install components by group:

```bash
rails generate nanoui:component --group essentials  # button input label card badge alert
rails generate nanoui:component --group forms        # + checkbox radio switch select
rails generate nanoui:component --group overlays     # dialog dropdown tooltip toast
rails generate nanoui:component --group data         # table tabs accordion progress
```

### Stimulus controllers

Some components ship with optional Stimulus controllers: dialog, dropdown, tooltip, toast, tabs, accordion, and switch. They're copied to `app/javascript/controllers/` during generation.

## Customization

Edit `app/assets/stylesheets/nanoui/base/03_colors.css` to change the color palette. All components reference CSS custom properties, so changes propagate everywhere.

Add `.dark` to `<html>` or `<body>` for dark mode — all color tokens have dark variants built in.
