# NanoUI — Project Instructions

## CSS Convention: Native Nesting

All component CSS uses **native CSS nesting** (not Sass/PostCSS). Native CSS does not support
Sass-style `&--modifier` or `&__element` concatenation — those patterns produce invalid selectors
in browsers. Use the full class name after `&` instead. Follow this pattern:

```css
.nano-component {
  /* base styles */

  &.nano-component--modifier {
    /* variant styles — assumes the element also carries the modifier class */
  }

  &:hover {
    /* pseudo-class styles */
  }

  .nano-component__child {
    /* child element styles */

    &.nano-component__child--state {
      /* modifier on a child element, same rule */
    }

    &:hover {
      /* nested pseudo-class */
    }
  }
}
```

### Rules

- **Modifiers**: use `&.nano-component--modifier`, never `&--modifier` (not valid native CSS)
- **Child elements**: use the full class `.nano-component__child` inside the parent block, never `&__child`
- **Element modifiers**: inside a child block, use `&.nano-component__child--state`, never `&--state`
- Nest pseudo-classes (`:hover`, `:focus-visible`, `:disabled`) using `&:`
- Attribute selectors: `&[aria-sort="ascending"]`, `&[data-state="open"]`
- For modifiers that override child styles, nest the child inside the modifier
- Keep `@keyframes` and bare element selectors (`button`, `input`) at the top level
- Never use flat/separate selector blocks for related styles
- HTML must carry both the base class and the modifier class together
  (e.g. `class="nano-btn nano-btn--primary"`) — the compound-selector CSS assumes this

## Naming

- BEM convention: `.nano-block`, `.nano-block--modifier`, `.nano-block__element`
- Stimulus controllers: `nanoui-*` prefix (e.g., `data-controller="nanoui-dialog"`)
- CSS custom properties: use design tokens from `base/*.css` (e.g., `--color-*`, `--space-*`)

## Component Structure

Each component consists of:
- CSS file in `lib/generators/nanoui/templates/css/components/` (or `layout/`)
- Optional Stimulus controller in `lib/generators/nanoui/templates/js/controllers/`
- Doc page in `docs/components/`
- Registration in `lib/generators/nanoui/component_generator.rb` (COMPONENT_ORDER, GROUPS, STIMULUS_COMPONENTS)
- Tests updated in `spec/`
