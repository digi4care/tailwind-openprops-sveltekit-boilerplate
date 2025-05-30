# Build Your Own CSS Tokens with Tailwind 4 and OpenProps

This guide will walk you through setting up a modern CSS architecture using Tailwind CSS v4 and OpenProps to create a flexible, customizable design system with your own design tokens.

## Table of Contents

- [Basic Setup](#basic-setup)
- [Why Use OpenProps with Tailwind 4?](#why-use-openprops-with-tailwind-4)
- [Configuration](#configuration)
- [Font Sizes](#font-sizes)
- [Gradients](#gradients)
- [Adaptive Utilities](#adaptive-utilities)
- [Development Environment](#development-environment)
- [Updating Dependencies](#updating-dependencies)
- [References](#references)

## Basic Setup

First, set up a new project with SvelteKit:
You can allready choose tailwindcss from the install menu.

```bash
# Create a new SvelteKit project
npx sv create my-app
cd my-app

# Install dependencies
npm install

# Install OpenProps
npm install -D open-props
```

## Why Use OpenProps with Tailwind 4?

### It's Non-Prescriptive

OpenProps provides a set of design tokens that work well with Tailwind 4 without being opinionated about your design choices. This gives you the flexibility to create unique designs while maintaining consistency.

### Design Consistently

Create visually harmonious designs with OpenProps' carefully curated design tokens that work well together out of the box.

### Predictable

Thanks to consistent naming conventions across all properties, you'll spend less time guessing and more time building.

### Incrementally Adoptable

Whether you want to use all the props, just the ones you need, or even import them as JavaScript objects, OpenProps adapts to your workflow.

### Customizable

Easily map the props from JavaScript or customize builds from the command line to fit your project's specific needs.

## Configuration

### 1. Set up Tailwind CSS v4

Edit `src/app.css` file with the basic configuration:

```css
@import 'tailwindcss';
@import 'open-props/style';

@theme {
 /* We'll add our theme configurations here */
}
```

## Font Sizes

Tailwind v4 makes it easy to map your own font sizes using CSS custom properties:

```css
@theme {
 --font-size-*: initial;
 --font-size-00: var(--font-size-00);
 --font-size-0: var(--font-size-0);
 --font-size-1: var(--font-size-1);
 --font-size-2: var(--font-size-2);
 --font-size-3: var(--font-size-3);
 --font-size-4: var(--font-size-4);
 --font-size-5: var(--font-size-5);
 --font-size-6: var(--font-size-6);
 --font-size-7: var(--font-size-7);
 --font-size-8: var(--font-size-8);
}
```

Usage:

```html
<h1 class="text-5">Hello World</h1>
```

## Gradients

Easily add beautiful gradients from OpenProps:

```css
@theme {
 --background-image-gradient-1: var(--gradient-1);
 --background-image-gradient-2: var(--gradient-2);
 --background-image-gradient-3: var(--gradient-3);
 /* Add more gradients as needed */
}
```

Usage:

```html
<div class="bg-gradient-3">
 <!-- Your content -->
</div>
```

## Adaptive Utilities

Create adaptive utilities that automatically adjust for light and dark modes:

1. First, define your theme variables

```css
:root {
 --ink-1: var(--gray-9);
 --ink-2: var(--gray-7);
 --surface-1: var(--gray-2);
 --surface-2: var(--gray-1);
 --link: var(--indigo-6);
}

@media (prefers-color-scheme: dark) {
 :root {
  --ink-1: var(--gray-1);
  --ink-2: var(--gray-5);
  --surface-1: var(--gray-11);
  --surface-2: var(--gray-10);
  --link: var(--indigo-4);
 }
}
```

2. Then, map them in your Tailwind theme

```css
@theme {
 --color-ink-1: var(--ink-1);
 --color-ink-2: var(--ink-2);
 --color-surface-1: var(--surface-1);
 --color-surface-2: var(--surface-2);
 --color-link: var(--link);
}
```

Now you can use these adaptive utilities in your components:

```html
<div class="bg-surface-2">
 <header>
  <h1 class="text-ink-1">Adaptive Heading</h1>
  <p class="text-ink-2">This text automatically adapts to light/dark mode</p>
  <a href="#" class="text-link">Adaptive Link</a>
 </header>
</div>
```

## Development Environment

This project comes with a fully configured development container that includes multiple JavaScript/TypeScript runtimes and package managers. The container is pre-configured with all necessary tools for a smooth development experience.

### Available Runtimes & Tools

The development container includes the following runtimes and package managers:

- **Node.js**: Multiple versions managed by NVM (Node Version Manager)
- **npm**: Latest stable version
- **Yarn**: Modern package manager
- **pnpm**: Fast, disk space efficient package manager
- **Bun**: Fast all-in-one JavaScript runtime
- **Deno**: Secure runtime for JavaScript and TypeScript
- **npm-check-updates**: Tool to update dependencies

### Package Management

#### Updating Dependencies

This project includes `npm-check-updates` to easily update your dependencies. To update all dependencies to their latest versions:

```bash
npm-check-updates
ncu -u
npm install
```

#### Using Different Package Managers

You can use any of the following package managers (all pre-installed):

```bash
# Using npm
npm install

# Using Yarn
yarn install

# Using pnpm
pnpm install

# Using Bun
bun install

# Using Deno
deno install
```

### Makefile Utilities

The project includes a comprehensive `Makefile` with useful commands for development, building, testing, and maintaining your application:

#### Project Management
```bash
make create           # Create a new Svelte project
make setup            # Install dependencies
make add pkg=package  # Add a new package
```

#### Development
```bash
make dev              # Start development server
make build            # Build for production
make preview          # Preview production build
make check            # Check for errors
```

#### Testing
```bash
make test             # Run tests
make test-watch       # Run tests in watch mode
make test-coverage    # Generate test coverage
```

#### Code Quality
```bash
make lint             # Run linter
make format           # Format code
make typecheck        # Check types
```

#### Migrations
```bash
make migrate          # Run available migrations
make migrate-svelte5  # Migrate to Svelte 5
make migrate-kit2     # Migrate to SvelteKit 2
```

#### Add-ons
```bash
make add-drizzle      # Add Drizzle ORM
make add-eslint       # Add ESLint
make add-lucia        # Add Lucia authentication
make add-mdsvex       # Add mdsvex (Markdown)
make add-playwright   # Add Playwright tests
make add-prettier     # Add Prettier
make add-storybook    # Add Storybook
```

### Development Container Features

- **Node.js Version Management**: Switch between Node.js versions using NVM
- **Zsh Shell**: Enhanced shell with useful plugins
- **Git Integration**: Pre-configured Git with sensible defaults
- **Health Checks**: Automatic container health monitoring
- **Version Reporting**: See all installed tool versions on container start

To start the development container, use VS Code's "Reopen in Container" command or run:

```bash
docker-compose up -d
```

## References

- [Tailwind CSS Documentation](https://tailwindcss.com/docs/)
- [OpenProps Documentation](https://open-props.style/)
- [SvelteKit Documentation](https://kit.svelte.dev/)
- [NVM Documentation](https://github.com/nvm-sh/nvm)
- [npm-check-updates](https://www.npmjs.com/package/npm-check-updates)
