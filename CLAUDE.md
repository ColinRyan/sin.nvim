# sin.nvim

A minimalistic neovim colorscheme with a grayscale-based palette accented by subtle red, yellow, and blue.

## Design Philosophy

- **Code in grayscale**: All code elements use shades of gray
  - Darker shades for syntax elements
  - Lighter shades for data/values
  - Mid-tones for everything in between
- **Minimal color accents**: Red, yellow, and blue used sparingly for emphasis
- **High readability**: Clear distinction between different code elements through grayscale contrast

## Color Palette

### Grayscale
- Black: Syntax elements (keywords, operators)
- White: Data (strings, numbers, values)
- Gray shades: Comments, punctuation, variables

### Accent Colors
- Red: Errors, important warnings
- Yellow: Warnings, search highlights
- Blue: Links, info messages

## Project Structure

```
sin.nvim/
├── colors/sin.lua           # Main colorscheme file
├── lua/sin/                 # Core implementation
│   └── theme.lua           # Theme definitions and highlight groups
├── lua/lualine/themes/sin.lua  # Lualine theme support
├── doc/sin.txt             # Vim documentation
└── extras/                 # Terminal emulator themes
```

**Important**: The `lua/sin/theme.lua` file contains all highlight group definitions and is the central place for theme customization.

## Development Commands

```bash
# Run tests (if available)
# TODO: Add test command when implemented

# Lint/format checks
# TODO: Add lint command when implemented
```