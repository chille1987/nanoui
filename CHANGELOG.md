# Changelog

## 0.6.0 (2026-04-17)

### Fixed

- **Breaking (but only if you relied on broken CSS):** All component CSS now uses valid native CSS nesting. Sass-style `&--modifier` and `&__element` concatenation was silently invalid in browsers — every modifier block has been rewritten to `&.nano-component--modifier` and every child to its full `.nano-component__child` class. HTML usage is unchanged: apply the base and modifier class together (`class="nano-btn nano-btn--primary"`), which has always been the documented pattern. 72 selectors across 26 files were rewritten.

### Added

- **Stat** component — dashboard KPI card with label, value, delta, and optional footer (CSS only)
- **Empty state** component — centered "no data yet" / "get started" layout with icon, title, description, and actions (CSS only)
- **Timeline** component — vertical activity feed with color-coded markers for retry history, audit logs, and status changes (CSS only)
- **Checklist** component — onboarding / setup checklist with pending / current / done states and optional progress summary (CSS only)
- **Copy** component — one-click copy-to-clipboard button with transient success state and `execCommand` fallback (CSS + Stimulus)
- **Code** component — monospace block for snippets, inline fragments, and terminal-style output (CSS only)
- **Upload** component — drag-and-drop file input with preview, size/type validation, and accessible fallback (CSS + Stimulus)
- **Data-table Stimulus controller** — click-to-sort headers (`string` / `number` / `date`), dispatches `nanoui-data-table:sort` for server-side sorting; paired with new CSS for `.nano-table__header--sortable` and `.nano-table-pagination`
- **Toast action buttons** — `.nano-toast__action` is now a fully styled inline CTA that adopts each variant's accent color
- New component groups: `dashboard` (stat, empty, timeline, checklist) and `utilities` (copy, code)
- GitHub Actions workflows for CI (RSpec on Ruby 3.1 / 3.2 / 3.3 + Rubocop) and Release (automated gem publish on `v*.*.*` tags)
- Rubocop config with `rubocop-rspec` plugin

### Changed

- Component count: 23 → 30
- Stimulus controllers: 9 → 12
- Component generator now maps each component to its controller files via `CONTROLLER_FILES`; installing `table` automatically installs the richer `data_table` controller
- Gemspec declares `rubocop` and `rubocop-rspec` as development dependencies

## 0.5.0 (2026-03-21)

### Added

- **Navbar** component — Responsive top navigation bar with mobile hamburger menu (CSS + Stimulus)
- **Sidebar** component — Collapsible sidebar navigation panel with groups and icons (CSS + Stimulus)
- **Breadcrumb** component — Navigation trail with separators (CSS only)
- **Avatar** component — Circular avatar with image/initials fallback and status indicator (CSS only)
- **Skeleton** component — Loading placeholder with shimmer animation (CSS only)
- New component groups: `navigation` (navbar, sidebar, breadcrumb) and `feedback` (avatar, skeleton)

### Changed

- Refactored all CSS to use native CSS nesting for improved readability and maintainability
- Component count: 18 → 23
- Stimulus controllers: 7 → 9

---

## 0.4.0 (2026-03-15)

### Added

- **Container** layout component with sm, md, lg sizes

---

## 0.3.0 (2026-03-12)

### Breaking changes

- Removed `@import`-based CSS entry point (incompatible with Propshaft)
- Removed ERB view partials

### Added

- Native HTML element styling (button, input, select, label styled without classes)
- GitHub Pages documentation site with live component previews

### Changed

- Simplified generators (no more import management)

---

## 0.1.0 (2026-03-09)

### Initial release

**Design tokens:** colors, typography, spacing, radius, shadows, transitions, z-index

**Base styles:** reset, globals

**Components (18):**
- button, input, label, card
- checkbox, radio, switch, select
- badge, alert
- dialog, dropdown, tooltip, toast
- table, tabs, accordion, progress

**Component groups:**
- `essentials` — button, input, label, card, badge, alert
- `forms` — button, input, label, checkbox, radio, switch, select, badge, alert
- `overlays` — dialog, dropdown, tooltip, toast
- `data` — table, tabs, accordion, progress

**Stimulus controllers (7):** dialog, dropdown, tooltip, toast, tabs, accordion, switch

**Generators:**
- `nanoui:install` — copies tokens, base styles, fonts, and entry point CSS
- `nanoui:component` — copies component CSS, Stimulus controllers, and ERB partials
