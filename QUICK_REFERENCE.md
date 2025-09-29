# Neovim Quick Reference

## 🚀 Essential Commands

### Plugin Management
```bash
:Lazy              # Open plugin manager
:Lazy sync         # Install/update plugins
:Lazy clean        # Remove unused plugins
:Lazy update       # Update all plugins
:Lazy health       # Check plugin health
```

### LSP & Language Servers
```bash
:LspInfo           # Show LSP status
:LspLog            # Open LSP logs
:Mason             # Open Mason (LSP installer)
:MasonInstallAll   # Install all LSP servers
```

### File Operations
```bash
:Oil               # Open file explorer
:Telescope find_files    # Find files
:Telescope git_files     # Git files only
:Telescope live_grep     # Search in files
:Telescope buffers       # List buffers
```

### Git Operations
```bash
:DiffviewOpen      # Open git diff
:DiffviewClose     # Close git diff
:GitBlameToggle    # Toggle git blame
:GitWorktree       # Manage worktrees
```

### Testing & Debugging
```bash
:Neotest run       # Run tests
:Neotest summary   # Test summary
:SnipRun           # Run code snippet
:DapContinue       # Start debugging
:DapToggleBreakpoint # Toggle breakpoint
```

## ⌨️ Key Mappings Quick Reference

### Navigation
| Key | Action |
|-----|--------|
| `<Space>fd` | Find files |
| `<Space>ft` | Git files |
| `<Space>fg` | Multi-ripgrep |
| `<Space>fb` | Buffers |
| `<Space>/` | Fuzzy find in buffer |
| `<Space>a` | Toggle Aerial |
| `{` / `}` | Previous/Next symbol |

### Git
| Key | Action |
|-----|--------|
| `<Space>gd` | Open diffview |
| `<Space>gb` | Toggle git blame |
| `]c` / `[c` | Next/Previous hunk |
| `<Space>hs` | Stage hunk |
| `<Space>hr` | Reset hunk |

### LSP
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Go to references |
| `K` | Hover info |
| `<Space>ca` | Code actions |
| `<Space>rn` | Rename |
| `<Space>f` | Format |

### Testing
| Key | Action |
|-----|--------|
| `<Space>tf` | Test file |
| `<Space>ts` | Stop test |
| `<Space>td` | Run last test |
| `<Space>to` | Test output |

### Debugging
| Key | Action |
|-----|--------|
| `<Space>b` | Toggle breakpoint |
| `F1` | Continue |
| `F2` | Step into |
| `F3` | Step over |
| `F4` | Step out |


## 🔧 Troubleshooting

### Quick Fixes
```bash
# Reset plugins
:Lazy reset

# Check startup time
:StartupTime

# Check for errors
:messages

# Reload configuration
:source ~/.config/nvim/init.lua
```

### Debug Commands
```bash
# Check LSP status
:LspInfo

# Check plugin status
:Lazy

# Check key mappings
:map <key>

# Check variables
:lua print(vim.inspect(vim.g))
```

## 📁 File Locations

### Configuration Files
- Main config: `~/.config/nvim/init.lua`
- Plugins: `~/.config/nvim/lua/custom/plugins/`
- Keymaps: `~/.config/nvim/plugin/keymaps.lua`
- Options: `~/.config/nvim/plugin/options.lua`

### Data Directories
- Plugins: `~/.local/share/nvim/lazy/`
- LSP servers: `~/.local/share/nvim/mason/`
- Logs: `~/.local/state/nvim/`
- Cache: `~/.cache/nvim/`

## 🎨 Customization

### Colors
- Theme: `colors/colorbuddy.vim`
- Highlights: `lua/custom/plugins/colorschemes.lua`

### Keymaps
- Add to: `plugin/keymaps.lua`
- Format: `vim.keymap.set("mode", "key", "action", {desc = "description"})`

### Plugins
- Add to: `lua/custom/plugins/`
- Follow existing pattern
- Use lazy loading

## 🚀 Performance

### Startup Optimization
- Use `:StartupTime` to check
- Lazy load plugins with `event = "VeryLazy"`
- Disable unused built-in plugins

### Runtime Optimization
- Use `vim.schedule()` for heavy operations
- Avoid blocking operations
- Cache expensive computations

## 📚 Useful Resources

- [Neovim Docs](https://neovim.io/doc/)
- [Lazy.nvim](https://github.com/folke/lazy.nvim)
- [LSP Config](https://github.com/neovim/nvim-lspconfig)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)

---

**Pro Tip**: Use `:help <command>` for detailed help on any command!
