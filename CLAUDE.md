# NanoUI — Project Instructions

## CSS Convention: Native Nesting

All component CSS uses native CSS nesting. Follow this pattern when creating or modifying components:

```css
.nano-component {
  /* base styles */

  &--modifier {
    /* variant styles */
  }

  &:hover {
    /* pseudo-class styles */
  }

  .nano-component__child {
    /* child element styles */

    &:hover {
      /* nested pseudo-class */
    }
  }
}
```

### Rules

- Nest modifiers (`--variant`) using `&--`
- Nest pseudo-classes (`:hover`, `:focus-visible`, `:disabled`) using `&:`
- Nest child elements (`.nano-component__child`) directly inside the parent block
- For modifiers that override child styles, nest the child inside the modifier
- Keep `@keyframes` and bare element selectors (`button`, `input`) at the top level
- Never use flat/separate selector blocks for related styles

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
