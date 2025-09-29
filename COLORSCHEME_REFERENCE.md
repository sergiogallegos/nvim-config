# CustomBuddy Colorscheme Variants

This document provides a quick reference for the 8 CustomBuddy colorscheme variants available in your Neovim configuration.

## Available Variants

### 1. **CustomBuddy Rose Pine** (`custombuddy-rosepine`) - **DEFAULT** 🌹
- **Style**: Beautiful, warm, aesthetic
- **Accent**: Blue theme with warm tones
- **Best for**: Developers who love beautiful, aesthetic colors
- **Inspiration**: Rose Pine color palette

### 2. **CustomBuddy Original** (`custombuddy`)
- **Style**: Warm, comfortable
- **Accent**: Mixed warm colors
- **Best for**: General development, long coding sessions
- **Inspiration**: Original CustomBuddy design

### 3. **CustomBuddy Craftz** (`custombuddy-craftz`)
- **Style**: Modern, vibrant
- **Accent**: Blue theme
- **Best for**: Modern development, web development
- **Inspiration**: craftzdog's configuration

### 4. **CustomBuddy Prime** (`custombuddy-prime`)
- **Style**: High contrast, bold
- **Accent**: Green theme
- **Best for**: Terminal-focused development, high contrast needs
- **Inspiration**: ThePrimeagen's configuration

### 5. **CustomBuddy TJ** (`custombuddy-tj`)
- **Style**: Professional, subtle
- **Accent**: Blue theme
- **Best for**: Professional development, reduced eye strain
- **Inspiration**: tjdevries' configuration

### 6. **CustomBuddy Cursor** (`custombuddy-cursor`)
- **Style**: Clean, modern
- **Accent**: Blue theme
- **Best for**: Cursor IDE users, modern development
- **Inspiration**: Cursor IDE

### 7. **CustomBuddy VS Code** (`custombuddy-vscode`)
- **Style**: Professional, familiar
- **Accent**: Blue theme
- **Best for**: VS Code users transitioning to Neovim
- **Inspiration**: VS Code's modern dark theme

### 8. **CustomBuddy Xcode** (`custombuddy-xcode`)
- **Style**: Apple-inspired, macOS native
- **Accent**: Blue theme
- **Best for**: macOS developers, iOS/macOS development
- **Inspiration**: Xcode's native colorscheme

## Key Bindings

| Key Binding | Action | Description |
|-------------|--------|-------------|
| `<leader>cn` | Next colorscheme | Cycle to next variant |
| `<leader>cp` | Previous colorscheme | Cycle to previous variant |
| `<leader>cs` | Colorscheme picker | Open Telescope picker |
| `<leader>cc` | Show current | Display current colorscheme |

## Switching Colorschemes

### Method 1: Key Bindings
- Use `<leader>cn` to cycle forward through variants
- Use `<leader>cp` to cycle backward through variants
- Use `<leader>cs` to open a Telescope picker

### Method 2: Command Line
```vim
:colorscheme custombuddy-craftz
:colorscheme custombuddy-prime
:colorscheme custombuddy-tj
:colorscheme custombuddy-cursor
:colorscheme custombuddy-vscode
:colorscheme custombuddy-xcode
:colorscheme custombuddy-rosepine
```

### Method 3: Configuration File
Edit `/Users/sergiogallegos/.config/nvim/lua/custom/plugins/colorschemes.lua`:
```lua
vim.cmd.colorscheme("custombuddy-craftz") -- Change this line
```

## Features

All variants include:
- **Transparency Support**: Perfect for modern terminal setups
- **Plugin Integration**: Complete styling for popular Neovim plugins
- **Enhanced Syntax**: Comprehensive language highlighting
- **Modern UI**: Improved status lines, search, and diagnostic styling
- **Consistent Theming**: All UI elements follow the same color palette

## Recommendations

- **For Web Development**: `custombuddy-craftz` or `custombuddy-cursor`
- **For Terminal Work**: `custombuddy-prime`
- **For Professional Use**: `custombuddy-tj` or `custombuddy-vscode`
- **For macOS Development**: `custombuddy-xcode`
- **For Beautiful Aesthetics**: `custombuddy-rosepine`
- **For General Use**: `custombuddy` (original)

## Troubleshooting

If colorschemes don't load properly:
1. Restart Neovim
2. Run `:Lazy sync` to ensure plugins are updated
3. Check that the colorscheme name is correct
4. Use `:colorscheme` to see available colorschemes
