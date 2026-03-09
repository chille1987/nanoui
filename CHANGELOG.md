# Changelog

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
