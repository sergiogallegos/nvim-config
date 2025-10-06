# Neovim Configuration - Cross-Platform Professional Setup

A comprehensive, cross-platform Neovim configuration combining the best practices from ThePrimeagen and TJ DeVries, optimized for both Windows and macOS development with modern enhancements and advanced features.

## 🚀 Features

### Core Functionality
- **LSP Support**: Comprehensive language server support for C/C++, Python, JavaScript/TypeScript, Go, Rust, SQL, and C#
- **Completion**: nvim-cmp with LSP, snippets, and path completion
- **Fuzzy Finding**: Telescope with built-in functionality (Windows compatible)
- **Git Integration**: Complete git workflow with Fugitive and Gitsigns
- **File Navigation**: Harpoon for quick file switching and Oil for modern file management
- **Debugging**: nvim-dap with Go and Python support

### Visual & UI
- **Colorscheme**: Rose-pine (ThePrimeagen style) with TokyoNight fallback
- **Status Line**: Lualine with icons and professional styling
- **Syntax Highlighting**: Treesitter with 20+ language parsers
- **Transparency**: Smart transparency system for Windows PowerShell
- **Icons**: nvim-web-devicons for file type indicators

### Modern Enhancements
- **Auto-save**: Automatic file saving on text changes
- **Smart Splits**: Enhanced window management
- **Mini Plugins**: Lightweight alternatives for better performance
- **Session Management**: Mini.sessions for workspace persistence
- **Diagnostic Help**: Comprehensive error viewing with Trouble.nvim

### Advanced Features (From sergiogallegos/nvim-config)
- **Advanced Git**: Diffview, git worktrees, conflict resolution, git blame
- **Testing Framework**: Neotest with Go, Python, and Jest support
- **Code Execution**: Sniprun for running code snippets
- **Session Management**: Persistence for workspace management
- **Advanced File Management**: Oil with floating windows and preview

## 📁 Structure

### Clean & Organized
This configuration has been cleaned and optimized for maximum performance:

```
~/.config/nvim/
├── init.lua                     # Main configuration entry point
├── lazy-lock.json              # Plugin version lock file
├── README.md                   # This documentation
├── lua/
│   └── custom/
│       ├── plugins/            # Plugin configurations (cleaned)
│       │   ├── ultimate.lua    # ThePrimeagen + TJ DeVries plugins
│       │   ├── lsp.lua         # LSP and language servers
│       │   ├── git.lua         # Git integration
│       │   ├── colors.lua      # Rose-pine colorscheme
│       │   ├── fallback-colors.lua # TokyoNight fallback
│       │   ├── enhancements.lua # Modern mini plugins
│       │   └── cross-platform.lua # Cross-platform compatibility
│       ├── ultimate-keymaps.lua # ThePrimeagen + TJ DeVries keymaps
│       ├── enhanced-keymaps.lua # Modern enhancement keymaps
│       ├── diagnostic-help.lua # Diagnostic viewing system
│       ├── autogroups.lua      # Professional autocmd management
│       ├── transparency.lua    # Cross-platform transparency
│       ├── platform.lua        # Platform detection system
│       └── colorscheme-switcher.lua # Colorscheme management
├── plugin/                     # Plugin-specific configurations
│   ├── keymaps.lua             # Basic key mappings
│   ├── options.lua             # Neovim options
│   └── ...
└── colors/                     # Color schemes
    ├── colorbuddy.vim          # Custom theme
    └── nightshade.vim          # Alternative theme
```

### Cleaned Files
The following unused files have been removed for better performance:
- **Old plugin files**: autopairs.lua, comment.lua, completion.lua, etc.
- **Unused snippets**: elixir.lua, snippets.lua
- **Redundant configurations**: telescope.lua, treesitter.lua, f.lua
- **Empty directories**: snippets/, telescope/

## 🔧 Installation

### Cross-Platform Setup

#### Windows Installation:
```bash
# Install Neovim 0.10+
# Option 1: Chocolatey
choco install neovim

# Option 2: Winget
winget install Neovim.Neovim

# Option 3: Download from: https://github.com/neovim/neovim/releases
```

#### macOS Installation:
```bash
# Install Neovim 0.10+
# Option 1: Homebrew
brew install neovim

# Option 2: MacPorts
sudo port install neovim
```

### Configuration Setup:
```bash
# Clone this repository
git clone https://github.com/sergiogallegos/nvim-config.git ~/.config/nvim
cd ~/.config/nvim

# Start Neovim (plugins will auto-install)
nvim
```

### Platform-Specific Notes:
- **Windows**: Works with PowerShell, CMD, and Windows Terminal
- **macOS**: Works with Terminal, iTerm2, and other terminal emulators
- **Transparency**: Automatically enabled on supported terminals
- **Clipboard**: Auto-detects and configures appropriate clipboard tools

## ⌨️ Key Mappings

### Leader Key: `<Space>`

#### ThePrimeagen's Signature Features
- `<leader>a` - Add file to Harpoon
- `<leader>e` - Toggle Harpoon quick menu
- `<leader>1-4` - Jump to Harpoon files 1-4
- `<leader>h` - Previous Harpoon file
- `<leader>l` - Next Harpoon file
- `<leader>z` - Toggle Zen mode
- `<leader>gs` - Git status (Fugitive)
- `<leader>gp` - Git push
- `<leader>gP` - Git pull
- `<leader>gc` - Git commit
- `<leader>gb` - Git blame
- `<leader>gd` - Git diff split
- `<leader>gl` - Git log

#### TJ DeVries' Professional Features
- `<leader>ff` - Find files (Telescope)
- `<leader>fg` - Live grep (Telescope)
- `<leader>fb` - Find buffers (Telescope)
- `<leader>fh` - Find help tags (Telescope)
- `-` - Open parent directory (Oil)
- `<leader>u` - Toggle undotree
- `<leader>xx` - Toggle Trouble (diagnostics)
- `<leader>xw` - Workspace diagnostics
- `<leader>xd` - Document diagnostics
- `<leader>xq` - Quickfix list
- `<leader>xl` - Location list

#### LSP & Development
- `gd` - Go to definition
- `gr` - Go to references
- `K` - Hover information
- `<leader>ca` - Code actions
- `<leader>rn` - Rename symbol
- `<leader>f` - Format code
- `]d` / `[d` - Next/Previous diagnostic
- `<leader>dl` - Show line diagnostics
- `<leader>dL` - Show diagnostics in location list
- `<leader>dQ` - Show diagnostics in quickfix list

#### Modern Enhancements
- `<leader>e` - Open file explorer (Mini.files)
- `<leader>E` - Open file explorer (current file)
- `<leader>bd` - Delete buffer
- `<leader>bD` - Delete buffer (force)
- `<leader>ss` - Save session
- `<leader>sl` - Load session
- `<leader>sd` - Delete session
- `<leader>st` - Open starter screen
- `<leader>tw` - Trim trailing whitespace
- `<leader>j` - Jump 2D
- `<leader>p` - Start picker

#### Window Management
- `<leader>wv` - Split vertically
- `<leader>wh` - Split horizontally
- `<leader>we` - Equalize windows
- `<leader>wo` - Close other windows
- `<C-h/j/k/l>` - Smart window navigation

#### Buffer Management
- `<leader>bn` - Next buffer
- `<leader>bp` - Previous buffer
- `<leader>bb` - Switch to last buffer

#### Tab Management
- `<leader>tn` - New tab
- `<leader>tc` - Close tab
- `<leader>to` - Close other tabs

#### Colorscheme & Transparency
- `<leader>cn` - Next colorscheme
- `<leader>cp` - Previous colorscheme
- `<leader>ct` - Toggle transparency

#### Advanced Git (From sergiogallegos/nvim-config)
- `<leader>gd` - Open diffview
- `<leader>gD` - Close diffview
- `<leader>gf` - Focus files
- `<leader>gh` - File history
- `<leader>gco` - Choose ours (conflict)
- `<leader>gct` - Choose theirs (conflict)
- `<leader>gcb` - Choose both (conflict)
- `<leader>gcn` - Next conflict
- `<leader>gcp` - Previous conflict
- `<leader>gw` - Git worktrees
- `<leader>gW` - Create git worktree
- `<leader>tb` - Toggle git blame (via gitsigns)

#### Testing
- `<leader>tf` - Test file
- `<leader>ts` - Stop test
- `<leader>td` - Run last test
- `<leader>to` - Open test output
- `<leader>tS` - Toggle test summary
- `<leader>tn` - Test nearest
- `<leader>tl` - Test last

#### Code Execution
- `<leader>r` - Run code
- `<leader>rr` - Run line
- `<leader>rc` - Close all
- `<leader>rl` - Reset

#### Session Management
- `<leader>qs` - Restore session
- `<leader>ql` - Restore last session
- `<leader>qd` - Don't save current session

#### Advanced File Management
- `<leader>e` - Open file explorer
- `<leader>E` - Open floating file explorer
- `-` - Open parent directory

#### Essential
- `<leader>w` - Save file
- `<leader>q` - Quit
- `<leader>Q` - Quit all
- `<leader>s` - Search
- `<leader>S` - Search backwards
- `<leader>ln` - Toggle line numbers

## 🎨 Colorschemes

### Primary Colorscheme: Rose-pine
- **Rose-pine** - ThePrimeagen's signature colorscheme (default)
- **TokyoNight** - Professional fallback
- **Default** - Vim default (fallback)

### Switching Colorschemes
- `<leader>cn` - Next colorscheme
- `<leader>cp` - Previous colorscheme
- `<leader>ct` - Toggle transparency

## 🔧 Language Support

### LSP Servers (Auto-installed via Mason)
- **C/C++** - clangd
- **Python** - pyright
- **JavaScript/TypeScript** - ts_ls
- **Go** - gopls
- **Rust** - rust_analyzer
- **SQL** - sqls (optional)
- **C#** - omnisharp (optional)

### Treesitter Parsers
- **Languages**: C, C++, Python, Java, JavaScript, TypeScript, Go, Rust, Zig, SQL, Lua, Vim, Markdown, JSON, YAML, TOML, Bash, Fish, Dockerfile

## 🚀 Performance Features

### Optimizations
- **Lazy Loading**: Most plugins load only when needed
- **Mini Plugins**: Lightweight alternatives for better performance
- **Smart Caching**: Enhanced startup times
- **Cross-Platform**: Works seamlessly on Windows, macOS, and Linux
- **Clean Structure**: Removed unused files for better performance

### Cross-Platform Compatibility
- **Windows & macOS Support**: Seamlessly works on both platforms
- **Automatic Detection**: Detects OS, terminal, and clipboard automatically
- **Platform-Specific Optimizations**: Windows PowerShell, macOS pbcopy, Linux xclip
- **Smart Transparency**: Different transparency methods per platform
- **Unified Experience**: Same configuration works everywhere

### Startup Time
- **Fast Startup**: Optimized for quick loading
- **Error Handling**: Graceful fallbacks for missing dependencies
- **Safe LSP Setup**: Only loads available language servers

## 🔍 Diagnostic System

### Reading Error Messages
- **`K`** - Hover over diagnostic to see message
- **`<leader>dl`** - Show all diagnostics in current line
- **`]d`** and **`[d`** - Navigate between diagnostics
- **`<leader>xx`** - Open Trouble diagnostic viewer
- **`<leader>xw`** - Show workspace-wide diagnostics
- **`<leader>xd`** - Show current document diagnostics

### Diagnostic Severity
- **`E`** = Error (❌ Red) - Critical issues
- **`W`** = Warning (⚠️ Yellow) - Potential problems
- **`I`** = Info (ℹ️ Blue) - Informational messages
- **`H`** = Hint (💡 Green) - Suggestions

## 🛠️ Troubleshooting

### Common Issues

1. **Plugins not loading**:
   ```bash
   :Lazy sync
   ```

2. **LSP not working**:
   ```bash
   :Mason
   # Install the required LSP server
   ```

3. **Diagnostic messages**:
   ```bash
   :Trouble
   # Or use <leader>xx
   ```

4. **Performance issues**:
   ```bash
   :checkhealth
   # Check system health
   ```

### Debug Commands
- `<leader>xx` - Open Trouble (diagnostic viewer)
- `<leader>dl` - Show line diagnostics
- `<leader>dL` - Show diagnostics in location list
- `<leader>dQ` - Show diagnostics in quickfix list

## 📦 Plugin Architecture

### Core Plugins
- **lazy.nvim** - Plugin manager
- **nvim-lspconfig** - LSP configuration
- **mason.nvim** - LSP/DAP installer
- **nvim-cmp** - Completion engine
- **telescope.nvim** - Fuzzy finder
- **treesitter** - Syntax highlighting

### ThePrimeagen's Signature Plugins
- **harpoon** - File navigation
- **vim-fugitive** - Git integration
- **zen-mode** - Focus mode

### TJ DeVries' Professional Plugins
- **telescope.nvim** - Fuzzy finder
- **treesitter** - Syntax highlighting
- **lualine.nvim** - Status line
- **oil.nvim** - File explorer

### Modern Enhancements
- **mini.ai** - Enhanced text objects
- **mini.surround** - Better surround functionality
- **mini.comment** - Smart commenting
- **mini.pairs** - Better auto-pairs
- **mini.bufremove** - Better buffer management
- **mini.files** - Modern file explorer
- **mini.sessions** - Session management
- **trouble.nvim** - Diagnostic viewer
- **undotree** - Visual undo history

## 🎯 Best Practices

### Configuration Structure
- **Modular Design**: Separate files for different concerns
- **Error Handling**: Graceful fallbacks for missing dependencies
- **Windows Compatibility**: All plugins tested on Windows
- **Performance Optimized**: Lazy loading and smart caching

### Development Workflow
- **Harpoon**: Quick file navigation
- **Telescope**: Fuzzy finding
- **Trouble**: Diagnostic management
- **Git Integration**: Complete git workflow
- **LSP Support**: Professional language support

## 📝 License

This configuration is for personal use. Feel free to adapt it for your needs.

## 🤝 Contributing

If you find issues or have improvements:
1. Fork the repository
2. Make your changes
3. Test thoroughly
4. Submit a pull request

---

**Happy coding with your cross-platform professional Neovim setup! 🎉✨**

## 🌟 What Makes This Special

This configuration is designed to be your **main Neovim setup** that works seamlessly across platforms:

- **🏠 Home Setup**: Perfect for personal development on both Windows and macOS
- **💼 Professional**: Combines the best practices from top Neovim developers
- **🚀 Modern**: Latest plugins and features with optimal performance
- **🔧 Maintainable**: Clean structure that's easy to customize and extend
- **🌍 Cross-Platform**: Same experience whether you're on Windows or macOS

Whether you're coding on your Windows machine at work or your MacBook at home, this configuration provides a consistent, powerful development environment.