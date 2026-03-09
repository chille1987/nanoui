# NanoUI — Vanilla CSS + Stimulus Component Library

> shadcn/ui design quality. Zero dependencies. Rails-native.

---

## Philosophy

- **Semantic HTML first.** Use the right element for the job. `<dialog>` not `<div>`, `<button>` not `<span>`, `<details>` for accordions, `<fieldset>` for form groups. If a native element does the job, use it — don't reinvent it with ARIA.
- **Accessibility is not optional.** Every component ships with correct ARIA attributes, keyboard navigation, and focus management. Screen reader users are first-class citizens. Follow WAI-ARIA Authoring Practices.
- **No build step.** No Tailwind, no PostCSS, no bundler config. Just CSS files and Stimulus controllers.
- **Rubygem with generators.** Install the gem, run the generator, files are copied into your app. You own the code — edit freely, no upstream dependency at runtime.
- **Progressive enhancement.** Every component works without JS. Stimulus adds interactivity on top.
- **BEM naming with nested CSS.** Predictable, flat specificity, easy to override. Elements nest inside their block using native CSS nesting.
- **CSS custom properties.** One file to theme everything. Dark mode with a single class swap.

---

## File Structure (Rubygem)

```
nanoui/
├── nanoui.gemspec
├── Gemfile
├── Rakefile
├── LICENSE.txt                      # MIT
├── README.md
│
├── lib/
│   ├── nanoui.rb                    # Gem entry point
│   ├── nanoui/
│   │   ├── version.rb               # VERSION constant
│   │   └── engine.rb                # Rails::Engine (optional, for asset pipeline)
│   │
│   └── generators/
│       └── nanoui/
│           ├── install_generator.rb          # rails generate nanoui:install
│           ├── component_generator.rb        # rails generate nanoui:component dialog
│           └── templates/
│               ├── css/
│               │   ├── tokens/
│               │   │   ├── _colors.css
│               │   │   ├── _typography.css
│               │   │   ├── _spacing.css
│               │   │   ├── _radius.css
│               │   │   ├── _shadows.css
│               │   │   ├── _transitions.css
│               │   │   └── _z-index.css
│               │   ├── base/
│               │   │   ├── _reset.css
│               │   │   └── _globals.css
│               │   ├── components/
│               │   │   ├── _button.css
│               │   │   ├── _input.css
│               │   │   ├── _card.css
│               │   │   ├── _badge.css
│               │   │   ├── _alert.css
│               │   │   ├── _label.css
│               │   │   ├── _select.css
│               │   │   ├── _checkbox.css
│               │   │   ├── _radio.css
│               │   │   ├── _switch.css
│               │   │   ├── _dialog.css
│               │   │   ├── _dropdown.css
│               │   │   ├── _tooltip.css
│               │   │   ├── _toast.css
│               │   │   ├── _table.css
│               │   │   ├── _tabs.css
│               │   │   ├── _accordion.css
│               │   │   └── _progress.css
│               │   └── nanoui.css            # Main entry (foundation + installed components)
│               │
│               ├── js/
│               │   └── controllers/
│               │       ├── dialog_controller.js
│               │       ├── dropdown_controller.js
│               │       ├── tooltip_controller.js
│               │       ├── toast_controller.js
│               │       ├── tabs_controller.js
│               │       ├── accordion_controller.js
│               │       ├── switch_controller.js
│               │       └── select_controller.js
│               │
│               ├── fonts/
│               │   └── inter-variable.ttf
│               │
│               └── views/
│                   └── components/
│                       ├── _button.html.erb
│                       ├── _input.html.erb
│                       ├── _card.html.erb
│                       ├── _dialog.html.erb
│                       ├── _toast.html.erb
│                       └── ...
│
├── html/
│   └── examples/                    # Not shipped in gem, for development/docs only
│       ├── foundation.html
│       ├── forms.html
│       ├── overlays.html
│       ├── data.html
│       └── kitchen-sink.html
│
└── test/
    └── generators/
        ├── install_generator_test.rb
        └── component_generator_test.rb
```

---

## Design Tokens

### Color System (shadcn-inspired HSL approach)

All colors defined as HSL values so opacity variants work naturally.

```css
/* tokens/_colors.css */
:root {
  /* Base scale — Zinc-inspired neutral palette */
  --color-background:       0 0% 100%;        /* white */
  --color-foreground:        240 10% 3.9%;      /* near-black */
  --color-muted:             240 4.8% 95.9%;    /* light gray bg */
  --color-muted-foreground:  240 3.8% 40%;      /* gray text, WCAG AA on white */
  --color-border:            240 5.9% 90%;       /* subtle border */
  --color-ring:              240 5.9% 10%;       /* focus ring */

  /* Primary — your brand color */
  --color-primary:           220 70% 50%;
  --color-primary-foreground: 0 0% 100%;

  /* Secondary */
  --color-secondary:         240 4.8% 95.9%;
  --color-secondary-foreground: 240 5.9% 10%;

  /* Destructive */
  --color-destructive:       0 84.2% 60.2%;
  --color-destructive-foreground: 0 0% 98%;

  /* Success */
  --color-success:           142 76% 36%;
  --color-success-foreground: 0 0% 100%;

  /* Warning */
  --color-warning:           38 92% 50%;
  --color-warning-foreground: 0 0% 100%;

  /* Surfaces */
  --color-card:              0 0% 100%;
  --color-card-foreground:   240 10% 3.9%;
  --color-popover:           0 0% 100%;
  --color-popover-foreground: 240 10% 3.9%;

  /* Input-specific */
  --color-input:             240 5.9% 90%;
  --color-input-focus:       220 70% 50%;
}

/* Dark mode — single class swap */
.dark {
  --color-background:        240 10% 3.9%;
  --color-foreground:         0 0% 98%;
  --color-muted:              240 3.7% 15.9%;
  --color-muted-foreground:   240 5% 64.9%;
  --color-border:             240 3.7% 15.9%;
  --color-ring:               240 4.9% 83.9%;
  --color-primary:            220 70% 60%;
  --color-primary-foreground: 0 0% 100%;
  --color-secondary:          240 3.7% 15.9%;
  --color-secondary-foreground: 0 0% 98%;
  --color-destructive:        0 62.8% 30.6%;
  --color-destructive-foreground: 0 0% 98%;
  --color-card:               240 10% 3.9%;
  --color-card-foreground:    0 0% 98%;
  --color-popover:            240 10% 3.9%;
  --color-popover-foreground: 0 0% 98%;
  --color-input:              240 3.7% 15.9%;
}
```

### Usage Pattern

```css
/* Always use hsl() wrapper so you can add opacity */
.button {
  background-color: hsl(var(--color-primary));
  color: hsl(var(--color-primary-foreground));
}

.button:hover {
  background-color: hsl(var(--color-primary) / 0.9);
}
```

### Typography

```css
/* tokens/_typography.css */
:root {
  --font-sans:    "Inter", system-ui, -apple-system, sans-serif;
  --font-mono:    "JetBrains Mono", "Fira Code", monospace;

  --text-xs:      0.75rem;     /* 12px */
  --text-sm:      0.875rem;    /* 14px */
  --text-base:    1rem;        /* 16px */
  --text-lg:      1.125rem;    /* 18px */
  --text-xl:      1.25rem;     /* 20px */
  --text-2xl:     1.5rem;      /* 24px */
  --text-3xl:     1.875rem;    /* 30px */
  --text-4xl:     2.25rem;     /* 36px */

  --leading-none:   1;
  --leading-tight:  1.25;
  --leading-normal: 1.5;
  --leading-relaxed: 1.625;

  --font-normal:  400;
  --font-medium:  500;
  --font-semibold: 600;
  --font-bold:    700;

  --tracking-tight:  -0.025em;
  --tracking-normal: 0em;
  --tracking-wide:   0.025em;
}
```

### Spacing

```css
/* tokens/_spacing.css */
:root {
  --space-0:   0;
  --space-0-5: 0.125rem;   /* 2px */
  --space-1:   0.25rem;    /* 4px */
  --space-1-5: 0.375rem;   /* 6px */
  --space-2:   0.5rem;     /* 8px */
  --space-2-5: 0.625rem;   /* 10px */
  --space-3:   0.75rem;    /* 12px */
  --space-4:   1rem;       /* 16px */
  --space-5:   1.25rem;    /* 20px */
  --space-6:   1.5rem;     /* 24px */
  --space-8:   2rem;       /* 32px */
  --space-10:  2.5rem;     /* 40px */
  --space-12:  3rem;       /* 48px */
  --space-16:  4rem;       /* 64px */
}
```

### Border Radius

```css
/* tokens/_radius.css */
:root {
  --radius-none: 0;
  --radius-sm:   0.25rem;    /* 4px */
  --radius-md:   0.375rem;   /* 6px — shadcn default */
  --radius-lg:   0.5rem;     /* 8px */
  --radius-xl:   0.75rem;    /* 12px */
  --radius-2xl:  1rem;       /* 16px */
  --radius-full: 9999px;
}
```

### Shadows

```css
/* tokens/_shadows.css */
:root {
  --shadow-sm:   0 1px 2px 0 rgb(0 0 0 / 0.05);
  --shadow-md:   0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1);
  --shadow-lg:   0 10px 15px -3px rgb(0 0 0 / 0.1), 0 4px 6px -4px rgb(0 0 0 / 0.1);
  --shadow-xl:   0 20px 25px -5px rgb(0 0 0 / 0.1), 0 8px 10px -6px rgb(0 0 0 / 0.1);
}
```

### Transitions

```css
/* tokens/_transitions.css */
:root {
  --duration-fast:    100ms;
  --duration-normal:  200ms;
  --duration-slow:    300ms;
  --ease-default:     cubic-bezier(0.4, 0, 0.2, 1);
  --ease-in:          cubic-bezier(0.4, 0, 1, 1);
  --ease-out:         cubic-bezier(0, 0, 0.2, 1);
  --ease-bounce:      cubic-bezier(0.34, 1.56, 0.64, 1);
}
```

### Z-Index Scale

```css
/* tokens/_z-index.css */
:root {
  --z-dropdown:  50;
  --z-sticky:    100;
  --z-overlay:   200;
  --z-modal:     300;
  --z-popover:   400;
  --z-tooltip:   500;
  --z-toast:     600;
}
```

---

## Semantic HTML Element Mapping

Always use the most appropriate native HTML element. Only fall back to `<div>` + ARIA when no semantic element exists.

| Component | Element | Why |
|-----------|---------|-----|
| Button | `<button>` or `<a>` | Native click, keyboard, form submission |
| Input | `<input>`, `<textarea>` | Native form behavior, validation |
| Label | `<label>` | Native `for` association |
| Select | `<select>` | Native dropdown, mobile-optimized |
| Checkbox | `<input type="checkbox">` | Native checked state, form data |
| Radio | `<input type="radio">` | Native group behavior, form data |
| Switch | `<button role="switch">` | No native switch element, use role |
| Dialog | `<dialog>` | Native `showModal()`, Escape close, focus trap, inert background |
| Dropdown | `<details>` / `<div>` | `<details>` for simple cases, `<div>` for positioned menus |
| Tooltip | `<div role="tooltip">` | No native tooltip element |
| Toast | `<output role="status">` | Live region, announced by screen readers |
| Accordion | `<details>` / `<summary>` | Native expand/collapse, no JS needed for basic behavior |
| Tabs | `<div role="tablist">` + `<button role="tab">` + `<div role="tabpanel">` | WAI-ARIA tabs pattern |
| Table | `<table>`, `<thead>`, `<tbody>`, `<th scope>` | Native table semantics, accessible by default |
| Progress | `<progress>` | Native progress element with fallback |
| Card | `<article>` or `<section>` | Semantic grouping, not `<div>` |
| Alert | `<div role="alert">` | Live region, immediate announcement |
| Badge | `<span>` | Inline element, no semantic meaning needed |

---

## Accessibility Requirements

### Every component MUST have:

1. **Keyboard navigation** — All interactive elements reachable via Tab, operable via Enter/Space
2. **Focus indicators** — Visible focus ring using `--color-ring` token, never `outline: none` without replacement
3. **ARIA attributes** — Correct roles, states, and properties per WAI-ARIA Authoring Practices
4. **Color contrast** — Minimum 4.5:1 for text, 3:1 for large text and UI components
5. **Screen reader announcements** — Dynamic content changes use live regions (`aria-live`, `role="status"`, `role="alert"`)

### ARIA patterns per component:

```html
<!-- Button: no extra ARIA needed if using <button> -->
<button class="button button--primary" type="button">Save</button>

<!-- Button with loading state -->
<button class="button button--primary" type="button" aria-busy="true" aria-disabled="true">
  <span class="button__spinner" aria-hidden="true"></span>
  Saving...
</button>

<!-- Input with error -->
<div class="field">
  <label for="email" class="label">Email</label>
  <input id="email" type="email" class="input input--error"
         aria-invalid="true"
         aria-describedby="email-error"
         required>
  <p id="email-error" class="field__error" role="alert">Please enter a valid email.</p>
</div>

<!-- Switch -->
<button role="switch" aria-checked="false" class="switch"
        data-controller="switch"
        data-action="switch#toggle">
  <span class="switch__thumb"></span>
  <span class="sr-only">Enable notifications</span>
</button>

<!-- Dialog using native <dialog> -->
<dialog class="dialog" data-controller="dialog"
        aria-labelledby="dialog-title"
        data-dialog-target="modal">
  <div class="dialog__content">
    <header class="dialog__header">
      <h2 id="dialog-title" class="dialog__title">Confirm Action</h2>
      <p class="dialog__description">This cannot be undone.</p>
    </header>
    <div class="dialog__body">
      <!-- content -->
    </div>
    <footer class="dialog__footer">
      <button class="button button--outline" data-action="dialog#close">Cancel</button>
      <button class="button button--destructive">Delete</button>
    </footer>
    <button class="dialog__close" data-action="dialog#close" aria-label="Close dialog">
      <svg aria-hidden="true"><!-- icon --></svg>
    </button>
  </div>
</dialog>

<!-- Accordion using native <details> -->
<div class="accordion" data-controller="accordion">
  <details class="accordion__item" data-accordion-target="item">
    <summary class="accordion__trigger">
      <span>Section Title</span>
      <svg class="accordion__icon" aria-hidden="true"><!-- chevron --></svg>
    </summary>
    <div class="accordion__content">
      <p>Panel content here.</p>
    </div>
  </details>
</div>

<!-- Tabs (WAI-ARIA tabs pattern) -->
<div class="tabs" data-controller="tabs">
  <div role="tablist" class="tabs__list" aria-label="Account settings">
    <button role="tab" id="tab-1" class="tabs__trigger"
            aria-selected="true" aria-controls="panel-1"
            data-action="tabs#select" data-tabs-target="tab">
      General
    </button>
    <button role="tab" id="tab-2" class="tabs__trigger"
            aria-selected="false" aria-controls="panel-2" tabindex="-1"
            data-action="tabs#select" data-tabs-target="tab">
      Security
    </button>
  </div>
  <div role="tabpanel" id="panel-1" class="tabs__panel"
       aria-labelledby="tab-1" data-tabs-target="panel">
    <!-- content -->
  </div>
  <div role="tabpanel" id="panel-2" class="tabs__panel"
       aria-labelledby="tab-2" data-tabs-target="panel" hidden>
    <!-- content -->
  </div>
</div>

<!-- Toast using <output> for live region -->
<div class="toast-container" data-controller="toast" aria-live="polite">
  <output class="toast toast--success" role="status" data-toast-target="item">
    <div class="toast__content">
      <p class="toast__title">Payment recovered</p>
      <p class="toast__description">$49.00 from customer #1234</p>
    </div>
    <button class="toast__close" data-action="toast#dismiss" aria-label="Dismiss notification">
      <svg aria-hidden="true"><!-- icon --></svg>
    </button>
  </output>
</div>

<!-- Alert (live region) -->
<div role="alert" class="alert alert--destructive">
  <svg class="alert__icon" aria-hidden="true"><!-- icon --></svg>
  <div class="alert__content">
    <h5 class="alert__title">Error</h5>
    <p class="alert__description">Your session has expired.</p>
  </div>
</div>

<!-- Progress using native <progress> -->
<div class="progress">
  <progress class="progress__bar" value="65" max="100"
            aria-label="Recovery rate">65%</progress>
  <span class="progress__label" aria-hidden="true">65%</span>
</div>

<!-- Table with proper scope -->
<table class="table">
  <thead class="table__head">
    <tr>
      <th scope="col" class="table__header">Customer</th>
      <th scope="col" class="table__header">Amount</th>
      <th scope="col" class="table__header">Status</th>
    </tr>
  </thead>
  <tbody class="table__body">
    <tr class="table__row">
      <td class="table__cell">Jane Doe</td>
      <td class="table__cell">$49.00</td>
      <td class="table__cell"><span class="badge badge--success">Recovered</span></td>
    </tr>
  </tbody>
</table>
```

### Utility class for screen-reader-only text:

```css
.sr-only {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  white-space: nowrap;
  border-width: 0;
}
```

---

## BEM Naming Convention

```
.component                     /* Block */
.component--variant            /* Modifier */
.component__element            /* Element */
.component__element--modifier  /* Element modifier */
```

---

## CSS Nesting Convention

**Always nest elements and modifiers inside their block.** This keeps related styles co-located and makes components self-contained. Native CSS nesting is supported in all modern browsers (Chrome 120+, Firefox 117+, Safari 17.2+).

### Rules:

1. **Block is the top-level selector** — never nest blocks inside blocks
2. **Elements nest inside their block** using `&__element` or `.block__element`
3. **Modifiers nest inside their block** using `&--modifier`
4. **State classes** (`.is-open`, `.is-active`) nest where they apply
5. **Pseudo-classes** (`:hover`, `:focus-visible`) nest inside their selector
6. **Max nesting depth: 2 levels** — deeper nesting is a code smell

### Full component example:

```css
/* components/_card.css */
.card {
  background-color: hsl(var(--color-card));
  color: hsl(var(--color-card-foreground));
  border: 1px solid hsl(var(--color-border));
  border-radius: var(--radius-lg);
  box-shadow: var(--shadow-sm);

  /* Variants */
  &--elevated {
    box-shadow: var(--shadow-md);
    border: none;
  }

  &--bordered {
    border: 2px solid hsl(var(--color-border));
    box-shadow: none;
  }

  /* Elements */
  &__header {
    display: flex;
    flex-direction: column;
    gap: var(--space-1-5);
    padding: var(--space-6);
    padding-bottom: 0;
  }

  &__title {
    font-size: var(--text-2xl);
    font-weight: var(--font-semibold);
    line-height: var(--leading-none);
    letter-spacing: var(--tracking-tight);
  }

  &__description {
    font-size: var(--text-sm);
    color: hsl(var(--color-muted-foreground));
  }

  &__content {
    padding: var(--space-6);
  }

  &__footer {
    display: flex;
    align-items: center;
    padding: var(--space-6);
    padding-top: 0;
  }
}
```

### Another example — Button with nested variants, sizes, and states:

```css
/* components/_button.css */
.button {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: var(--space-2);
  border-radius: var(--radius-md);
  font-size: var(--text-sm);
  font-weight: var(--font-medium);
  line-height: var(--leading-none);
  cursor: pointer;
  transition: background-color var(--duration-fast) var(--ease-default),
              color var(--duration-fast) var(--ease-default);
  padding: var(--space-2-5) var(--space-4);

  &:focus-visible {
    outline: 2px solid hsl(var(--color-ring));
    outline-offset: 2px;
  }

  &:disabled,
  &[aria-disabled="true"] {
    pointer-events: none;
    opacity: 0.5;
  }

  /* Variants */
  &--primary {
    background-color: hsl(var(--color-primary));
    color: hsl(var(--color-primary-foreground));

    &:hover {
      background-color: hsl(var(--color-primary) / 0.9);
    }
  }

  &--secondary {
    background-color: hsl(var(--color-secondary));
    color: hsl(var(--color-secondary-foreground));

    &:hover {
      background-color: hsl(var(--color-secondary) / 0.8);
    }
  }

  &--destructive {
    background-color: hsl(var(--color-destructive));
    color: hsl(var(--color-destructive-foreground));

    &:hover {
      background-color: hsl(var(--color-destructive) / 0.9);
    }
  }

  &--outline {
    border: 1px solid hsl(var(--color-border));
    background-color: transparent;
    color: hsl(var(--color-foreground));

    &:hover {
      background-color: hsl(var(--color-muted));
    }
  }

  &--ghost {
    background-color: transparent;
    color: hsl(var(--color-foreground));

    &:hover {
      background-color: hsl(var(--color-muted));
    }
  }

  /* Sizes */
  &--sm {
    font-size: var(--text-xs);
    padding: var(--space-2) var(--space-3);
    border-radius: var(--radius-sm);
  }

  &--lg {
    font-size: var(--text-base);
    padding: var(--space-3) var(--space-6);
    border-radius: var(--radius-md);
  }

  &--icon {
    padding: var(--space-2-5);
    aspect-ratio: 1;
  }

  /* Inner elements */
  &__spinner {
    animation: spin 1s linear infinite;

    @keyframes spin {
      to { transform: rotate(360deg); }
    }
  }
}
```

### What NOT to do:

```css
/* ❌ WRONG — flat, disconnected selectors */
.card { }
.card__header { }
.card__title { }
.card__footer { }

/* ❌ WRONG — nesting blocks inside blocks */
.card {
  .button { }  /* Don't style other components inside a component */
}

/* ❌ WRONG — too deep (3+ levels) */
.card {
  &__header {
    &__title {
      &--large { }  /* Too deep — refactor */
    }
  }
}
```

---

## Stimulus Controller Patterns

### Convention: semantic HTML + data attributes bridge HTML → Stimulus

```html
<!-- Dialog using native <dialog> element -->
<div data-controller="dialog">
  <button data-action="dialog#open" type="button">Open</button>

  <dialog data-dialog-target="modal" class="dialog"
          aria-labelledby="dialog-title">
    <div class="dialog__content">
      <header class="dialog__header">
        <h2 id="dialog-title" class="dialog__title">Title</h2>
        <p class="dialog__description">Description</p>
      </header>
      <div class="dialog__body">
        <!-- content -->
      </div>
      <footer class="dialog__footer">
        <button class="button button--outline" data-action="dialog#close">Cancel</button>
        <button class="button button--primary">Confirm</button>
      </footer>
      <button data-action="dialog#close" class="dialog__close" aria-label="Close dialog">
        <svg aria-hidden="true"><!-- x icon --></svg>
      </button>
    </div>
  </dialog>
</div>
```

### Controller pattern rules:

1. **Use native elements first** — `<dialog>.showModal()` gives you free focus trap, Escape close, and `::backdrop`
2. **Use `hidden` attribute** for non-dialog show/hide — CSS handles transitions via `.is-open` class
3. **Always handle Escape key** for overlays (native `<dialog>` does this automatically)
4. **Trap focus** inside modals/dialogs (native `<dialog>` does this automatically)
5. **Clean up on disconnect** — remove event listeners, clear timeouts
6. **Emit custom events** so controllers can communicate:
   ```js
   this.dispatch("closed", { detail: { id: this.element.id } })
   ```
7. **Use CSS classes for animations**, toggled by Stimulus:
   ```js
   // Add .is-open, let CSS handle the transition
   this.overlayTarget.classList.add("is-open")
   this.overlayTarget.hidden = false
   ```
8. **Always announce dynamic changes** — use `aria-live` regions for toasts, errors, status updates

### Dialog controller example (using native `<dialog>`):

```js
// js/controllers/dialog_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal"]

  open() {
    this.modalTarget.showModal()
    this.modalTarget.classList.add("is-open")
  }

  close() {
    this.modalTarget.classList.remove("is-open")
    // Wait for CSS transition before actually closing
    this.modalTarget.addEventListener("transitionend", () => {
      this.modalTarget.close()
    }, { once: true })
  }

  // Native <dialog> fires "close" event on Escape
  // and handles focus trap automatically

  disconnect() {
    if (this.modalTarget.open) {
      this.modalTarget.close()
    }
  }
}
```

### State management pattern:

```css
/* CSS handles all visual states — nested inside block */
.dialog {
  opacity: 0;
  transform: scale(0.95);
  transition: opacity var(--duration-normal) var(--ease-default),
              transform var(--duration-normal) var(--ease-default);

  &.is-open {
    opacity: 1;
    transform: scale(1);
  }

  &::backdrop {
    background-color: rgb(0 0 0 / 0.5);
    backdrop-filter: blur(4px);
  }
}
```

```js
// Stimulus toggles the class, native <dialog> handles the rest
open() {
  this.modalTarget.showModal()
  // Force reflow for transition
  this.modalTarget.offsetHeight
  this.modalTarget.classList.add("is-open")
}
```

---

## Component Inventory

### Essentials (no JS needed)

| Component | Element | CSS | Stimulus | Variants |
|-----------|---------|-----|----------|----------|
| Button | `<button>`, `<a>` | ✅ | — | primary, secondary, destructive, outline, ghost, link, sm, lg, icon |
| Input | `<input>`, `<textarea>` | ✅ | — | default, error, disabled, with icon |
| Label | `<label>` | ✅ | — | default, required |
| Card | `<article>`, `<section>` | ✅ | — | default, bordered, elevated |
| Badge | `<span>` | ✅ | — | default, secondary, destructive, outline, success, warning |
| Alert | `<div role="alert">` | ✅ | — | default, destructive, success, warning |

### Forms (minimal JS)

| Component | Element | CSS | Stimulus | Notes |
|-----------|---------|-----|----------|-------|
| Select | `<select>` | ✅ | select_controller | Custom styled native select + optional enhanced dropdown |
| Checkbox | `<input type="checkbox">` | ✅ | — | CSS-only custom checkbox via `<label>` wrapping |
| Radio | `<input type="radio">` + `<fieldset>` | ✅ | — | CSS-only custom radio, grouped in `<fieldset>` |
| Switch | `<button role="switch">` | ✅ | switch_controller | `aria-checked` toggled by Stimulus |

### Overlays (JS required)

| Component | Element | CSS | Stimulus | Notes |
|-----------|---------|-----|----------|-------|
| Dialog | `<dialog>` | ✅ | dialog_controller | Native `showModal()`, free focus trap + Escape + `::backdrop` |
| Dropdown | `<details>` / `<div>` | ✅ | dropdown_controller | `<details>` for simple, `<div>` with ARIA for positioned menus |
| Tooltip | `<div role="tooltip">` | ✅ | tooltip_controller | `aria-describedby` links trigger to tooltip |
| Toast | `<output role="status">` | ✅ | toast_controller | Inside `aria-live="polite"` container |

### Data Display

| Component | Element | CSS | Stimulus | Notes |
|-----------|---------|-----|----------|-------|
| Table | `<table>`, `<th scope>` | ✅ | — | Proper `<thead>`/`<tbody>`, `scope="col"` on headers |
| Tabs | `role="tablist"` + `role="tab"` + `role="tabpanel"` | ✅ | tabs_controller | Arrow key navigation, `aria-selected`, `aria-controls` |
| Accordion | `<details>` / `<summary>` | ✅ | accordion_controller | Native expand/collapse, `<details>` handles accessibility |
| Progress | `<progress>` | ✅ | — | Native element with `aria-label`, text fallback |

---

## Rails Integration Pattern

### Partials with local variables (not ViewComponent)

```erb
<%# app/views/components/_button.html.erb %>
<%
  variant = local_assigns.fetch(:variant, "primary")
  size    = local_assigns.fetch(:size, "md")
  tag     = local_assigns.fetch(:tag, :button)
  href    = local_assigns.fetch(:href, nil)
  classes = local_assigns.fetch(:class, "")

  css = "button button--#{variant} button--#{size} #{classes}".strip
  tag = :a if href
%>

<%= content_tag(tag, href: href, class: css, **local_assigns.fetch(:html, {})) do %>
  <%= yield %>
<% end %>
```

### Usage:

```erb
<%= render "components/button", variant: "primary" do %>
  Save Changes
<% end %>

<%= render "components/button", variant: "outline", size: "sm" do %>
  Cancel
<% end %>

<%= render "components/button", variant: "destructive", tag: :a, href: "#" do %>
  Delete
<% end %>
```

### Dialog partial (using native `<dialog>`):

```erb
<%# app/views/components/_dialog.html.erb %>
<%
  size     = local_assigns.fetch(:size, "md")
  title_id = local_assigns.fetch(:title_id, "dialog-title-#{SecureRandom.hex(4)}")
  classes  = local_assigns.fetch(:class, "")
%>

<div data-controller="dialog" class="<%= classes %>">
  <%= yield :trigger %>

  <dialog data-dialog-target="modal" class="dialog dialog--<%= size %>"
          aria-labelledby="<%= title_id %>">
    <div class="dialog__content">
      <header class="dialog__header">
        <h2 id="<%= title_id %>" class="dialog__title">
          <%= local_assigns.fetch(:title, '') %>
        </h2>
        <% if local_assigns.fetch(:description, nil) %>
          <p class="dialog__description"><%= description %></p>
        <% end %>
      </header>

      <div class="dialog__body">
        <%= yield :body %>
      </div>

      <% if content_for?(:footer) %>
        <footer class="dialog__footer">
          <%= yield :footer %>
        </footer>
      <% end %>

      <button data-action="dialog#close" class="dialog__close"
              type="button" aria-label="Close dialog">
        <svg aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="16" height="16"
             viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <path d="M18 6 6 18"/><path d="m6 6 12 12"/>
        </svg>
      </button>
    </div>
  </dialog>
</div>
```

---

## Build Order

### Phase 1 — Foundation (build first)
1. Design tokens (all `tokens/` files)
2. Reset + globals
3. Button (establishes the variant/size pattern)
4. Input + Label (establishes form patterns)
5. Card (establishes container pattern)

### Phase 2 — Forms
6. Checkbox + Radio (CSS-only)
7. Switch (first Stimulus controller)
8. Select (native + enhanced)
9. Badge + Alert (simple, builds on tokens)

### Phase 3 — Overlays
10. Dialog (modal — most complex Stimulus controller)
11. Dropdown (click-outside pattern, positioning)
12. Tooltip (hover/focus, delay logic)
13. Toast (stack management, auto-dismiss)

### Phase 4 — Data
14. Table (CSS-only, responsive)
15. Tabs (panel switching, hash support)
16. Accordion (animated height)
17. Progress (CSS-only)

### Phase 5 — Polish
18. Kitchen sink example page
19. Rails partials for all components
20. README + docs


---

## Distribution: Rubygem with Generators

### How it works

NanoUI is a Rubygem that ships **generators**, not runtime code. When you run a generator, it copies files directly into your Rails app. After that, the files are yours — no gem dependency at runtime, no version lock, edit freely.

This is the shadcn/ui model applied to Rails: the gem is a delivery mechanism, not a framework.

### Installation

```ruby
# Gemfile
gem "nanoui", group: :development  # Only needed for generators, not runtime
```

```bash
bundle install
```

### Generators

#### `rails generate nanoui:install`

Installs the full NanoUI foundation into your Rails 8 app:

```bash
rails generate nanoui:install
```

This copies:
```
app/assets/stylesheets/nanoui/
├── tokens/
│   ├── _colors.css
│   ├── _typography.css
│   ├── _spacing.css
│   ├── _radius.css
│   ├── _shadows.css
│   ├── _transitions.css
│   └── _z-index.css
├── base/
│   ├── _reset.css
│   └── _globals.css
└── nanoui.css                    # Main entry (foundation + installed components)

app/assets/stylesheets/nanoui/fonts/
└── inter-variable.ttf
```

And inserts this import into `app/assets/stylesheets/application.css` before regular CSS rules:
```css
@import "nanoui/nanoui.css";
```

`rails generate nanoui:install` creates a foundation-only `nanoui.css` with tokens and base styles. Component imports are added later based on the files actually installed.

#### `rails generate nanoui:component [name]`

Adds individual components. Install only what you need:

```bash
# Add a single component
rails generate nanoui:component button

# Add multiple components
rails generate nanoui:component button input label card

# Add a component group
rails generate nanoui:component --group essentials
rails generate nanoui:component --group forms
rails generate nanoui:component --group overlays
rails generate nanoui:component --group data

# Add everything
rails generate nanoui:component --all
```

Each component install copies:
1. **CSS file** → `app/assets/stylesheets/nanoui/components/_button.css`
2. **Stimulus controller** (if needed) → `app/javascript/controllers/nanoui_dialog_controller.js`
3. **ERB partial** → `app/views/components/_button.html.erb`
4. **Rebuilds the component import section** in `nanoui.css` so it only references installed component files

Example output:
```
$ rails generate nanoui:component dialog

      create  app/assets/stylesheets/nanoui/components/_dialog.css
      create  app/javascript/controllers/nanoui_dialog_controller.js
      create  app/views/components/_dialog.html.erb
      update  app/assets/stylesheets/nanoui/nanoui.css
```

### Component groups

| Group | Components |
|-------|-----------|
| `essentials` | button, input, label, card, badge, alert |
| `forms` | checkbox, radio, switch, select + essentials |
| `overlays` | dialog, dropdown, tooltip, toast |
| `data` | table, tabs, accordion, progress |
| `all` | everything |

### After installation

The files are yours. Edit the CSS variables to match your brand, modify component markup, add new variants. The gem is only needed to generate — you can remove it from your Gemfile after:

```ruby
# After you've generated everything you need:
# gem "nanoui"  # Can safely remove
```

### Stimulus controller registration

With Rails 8 + importmap + `eagerLoadControllersFrom`, controllers in `app/javascript/controllers/` auto-register by naming convention. Controllers are prefixed with `nanoui_` to avoid conflicts:

```
nanoui_dialog_controller.js   → data-controller="nanoui-dialog"
nanoui_dropdown_controller.js → data-controller="nanoui-dropdown"
nanoui_toast_controller.js    → data-controller="nanoui-toast"
```

No manual registration needed.

### Usage in views

```erb
<%# Using the ERB partials %>
<%= render "components/button", variant: "primary" do %>
  Save Changes
<% end %>

<%# Or just write the HTML directly — you own the CSS classes %>
<button class="button button--primary" type="button">
  Save Changes
</button>

<%# Both work. Partials are optional convenience. %>
```

---

## Generator Implementation

### install_generator.rb

```ruby
# lib/generators/nanoui/install_generator.rb
module Nanoui
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("templates", __dir__)

      APPLICATION_IMPORT = '@import "nanoui/nanoui.css";'.freeze
      LEADING_CSS_HEADER_PATTERN = /\A((?:\s|\/\*.*?\*\/\s*)*(?:@charset\s+[^;]+;\s*)?(?:@import\s+[^;]+;\s*)*)/m.freeze

      desc "Install NanoUI foundation (tokens, base styles, fonts)"

      def copy_tokens
        directory "css/tokens", "app/assets/stylesheets/nanoui/tokens"
      end

      def copy_base
        directory "css/base", "app/assets/stylesheets/nanoui/base"
      end

      def copy_entry_point
        copy_file "css/nanoui.install.css", "app/assets/stylesheets/nanoui/nanoui.css"
      end

      def copy_fonts
        directory "css/fonts", "app/assets/stylesheets/nanoui/fonts"
      end

      def add_import_to_application_css
        application_css = "app/assets/stylesheets/application.css"
        return unless File.exist?(application_css)

        content = File.read(application_css)
        return if content.include?(APPLICATION_IMPORT)

        updated_content = content.sub(LEADING_CSS_HEADER_PATTERN, "\\1#{APPLICATION_IMPORT}\n")
        File.write(application_css, updated_content)
      end

      def print_instructions
        say ""
        say "NanoUI installed!", :green
        say ""
        say "Next steps:"
        say "  1. Run: rails generate nanoui:component --all"
        say "     Or add components individually:"
        say "     rails generate nanoui:component button input card"
        say ""
        say "  2. Customize your theme in:"
        say "     app/assets/stylesheets/nanoui/tokens/_colors.css"
        say ""
      end
    end
  end
end
```

### component_generator.rb

```ruby
# lib/generators/nanoui/component_generator.rb
module Nanoui
  module Generators
    class ComponentGenerator < Rails::Generators::Base
      source_root File.expand_path("templates", __dir__)

      COMPONENT_ORDER = %w[
        button
        input
        label
        card
        checkbox
        radio
        switch
        select
        badge
        alert
        dialog
        dropdown
        tooltip
        toast
        table
        tabs
        accordion
        progress
      ].freeze
      COMPONENT_IMPORT_PATTERN = /^\s*@import "components\/_([^\"]+)\.css";\s*\n?/

      argument :components, type: :array, default: [], banner: "component [component] ..."

      class_option :group, type: :string, desc: "Install a component group"
      class_option :all, type: :boolean, default: false, desc: "Install all components"

      GROUPS = {
        "essentials" => %w[button input label card badge alert],
        "forms"      => %w[button input label checkbox radio switch select badge alert],
        "overlays"   => %w[dialog dropdown tooltip toast],
        "data"       => %w[table tabs accordion progress],
      }.freeze

      STIMULUS_COMPONENTS = %w[dialog dropdown tooltip toast tabs accordion switch select].freeze

      def resolve_components
        @resolved = if options[:all]
          GROUPS.values.flatten.uniq
        elsif options[:group]
          GROUPS.fetch(options[:group]) { abort "Unknown group: #{options[:group]}" }
        else
          components
        end

        abort "Specify components, --group, or --all" if @resolved.empty?
      end

      def copy_component_css
        @resolved.each do |name|
          copy_file "css/components/_#{name}.css",
                    "app/assets/stylesheets/nanoui/components/_#{name}.css"
        end
      end

      def copy_stimulus_controllers
        @resolved.each do |name|
          next unless STIMULUS_COMPONENTS.include?(name)
          copy_file "js/controllers/#{name}_controller.js",
                    "app/javascript/controllers/nanoui_#{name}_controller.js"
        end
      end

      def copy_partials
        @resolved.each do |name|
          source = "views/components/_#{name}.html.erb"
          next unless File.exist?(File.join(self.class.source_root, source))
          copy_file source, "app/views/components/_#{name}.html.erb"
        end
      end

      def update_nanoui_css
        nanoui_css = "app/assets/stylesheets/nanoui/nanoui.css"
        return unless File.exist?(nanoui_css)

        content = File.read(nanoui_css)
        content_without_component_imports = content.gsub(COMPONENT_IMPORT_PATTERN, "")
        component_section = ["/* Components */", component_imports].reject(&:empty?).join("\n")

        updated_content = if content_without_component_imports.include?("/* Components */")
          content_without_component_imports.sub("/* Components */", component_section)
        else
          "#{content_without_component_imports.rstrip}\n\n#{component_section}\n"
        end

        File.write(nanoui_css, updated_content)
      end

      def print_summary
        say ""
        say "NanoUI components installed:", :green
        @resolved.each do |name|
          parts = ["CSS"]
          parts << "Stimulus" if STIMULUS_COMPONENTS.include?(name)
          say "  ✓ #{name} (#{parts.join(", ")})"
        end
        say ""
      end

      private

      def component_imports
        installed_components.map { |name| "@import \"components/_#{name}.css\";" }.join("\n")
      end

      def installed_components
        component_dir = "app/assets/stylesheets/nanoui/components"
        names = Dir.glob(File.join(component_dir, "_*.css")).map do |path|
          File.basename(path, ".css").delete_prefix("_")
        end

        names.uniq.sort_by do |name|
          [COMPONENT_ORDER.index(name) || COMPONENT_ORDER.length, name]
        end
      end
    end
  end
end
```

### nanoui.gemspec

```ruby
Gem::Specification.new do |spec|
  spec.name          = "nanoui"
  spec.version       = Nanoui::VERSION
  spec.authors       = ["Your Name"]
  spec.email         = ["your@email.com"]
  spec.summary       = "Vanilla CSS + Stimulus component library for Rails"
  spec.description   = "shadcn/ui quality components with semantic HTML, accessibility-first, " \
                        "native CSS nesting, and BEM naming. Zero runtime dependencies."
  spec.homepage      = "https://github.com/yourname/nanoui"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 3.1"
  spec.files         = Dir["lib/**/*", "LICENSE.txt", "README.md", "CHANGELOG.md"]
  spec.require_paths = ["lib"]
  spec.add_dependency "railties", ">= 7.1"
end
```

### lib/nanoui.rb

```ruby
require "nanoui/version"

module Nanoui
  # Generator-only gem. No runtime code.
end
```

### lib/nanoui/version.rb

```ruby
module Nanoui
  VERSION = "0.1.0"
end
```

---

## Decisions Made

1. **Font:** Self-hosted Inter (~100KB). System fonts as fallback.
2. **Dark mode:** Class-based only (`.dark` on `<html>`). Manual toggle via Stimulus controller.
3. **CSS architecture:** Custom properties + BEM + native CSS nesting.
4. **HTML approach:** Semantic elements first (`<dialog>`, `<details>`, `<progress>`, `<output>`, `<fieldset>`, `<article>`). ARIA attributes always present where appropriate.
5. **Distribution:** Rubygem with Rails generators. Copies files into your app — no runtime dependency. Install what you need, own the code.
6. **Icons:** Lucide Icons (MIT licensed, 1500+ icons). Inline SVGs, copy what you need.
7. **Stimulus prefix:** Controllers named `nanoui_*_controller.js` → `data-controller="nanoui-*"` to avoid conflicts with app controllers.

## Open Questions

None — all major decisions have been made. Ready to build.
