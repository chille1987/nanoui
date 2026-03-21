# Changelog

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
