# 🚀 Neovim Configuration

A comprehensive, modern Neovim configuration optimized for development with transparency support, multi-language linting, and professional-grade tooling.

## ✨ Features

### 🎨 **Visual & UI**
- **Transparent background** with beautiful transparency effects
- **Custom colorscheme** with colorbuddy.nvim
- **Beautiful startup screen** with ASCII art and quick actions
- **Enhanced notifications** with nvim-notify
- **Better input dialogs** with dressing.nvim
- **Smooth animations** and visual feedback

### 🔧 **Core Functionality**
- **Lazy.nvim** plugin manager for fast startup
- **LSP support** for 10+ programming languages
- **Comprehensive linting** for code quality
- **Auto-formatting** with conform.nvim
- **Session management** with persistence.nvim
- **Undo tree visualization** with undotree

### 🧭 **Navigation & Search**
- **Telescope** for fuzzy finding and file navigation
- **Aerial** for code outline and symbol navigation
- **Flash** for advanced jump navigation
- **Harpoon** for quick file switching
- **Oil** for file system navigation

### 🔍 **Code Understanding**
- **Treesitter** for syntax highlighting and parsing
- **LSP diagnostics** with virtual text and lines
- **Code actions** and refactoring
- **Symbol navigation** and go-to-definition
- **Inlay hints** for better code understanding

### 🧪 **Development Tools**
- **Neotest** for running tests in multiple languages
- **Sniprun** for code execution and testing
- **DAP** for debugging support
- **Git integration** with gitsigns and diffview
- **Conflict resolution** with git-conflict.nvim

### 📝 **Editing Enhancements**
- **Auto-pairs** for bracket completion
- **Comment** for smart commenting
- **Illuminate** for highlighting word under cursor
- **Indent guides** with indent-blankline
- **Trouble** for diagnostics management

## 🛠️ **Supported Languages**

### **LSP Support**
- **Python** (pyright)
- **JavaScript/TypeScript** (tsserver, typescript-tools)
- **Go** (gopls)
- **Rust** (rust-analyzer)
- **C/C++** (clangd)
- **Java** (jdtls)
- **Lua** (lua-language-server)
- **Zig** (zls)
- **PHP** (intelephense)
- **Bash** (bash-language-server)
- **SQL** (sqlls)
- **C#** (omnisharp)

### **Linting Support**
- **Python**: flake8
- **JavaScript/TypeScript**: eslint
- **Go**: golangci-lint
- **C/C++**: clang-check, clang-tidy
- **Rust**: cargo
- **Java**: checkstyle
- **SQL**: sqlfluff
- **Shell**: shellcheck
- **Zig**: zig
- **Lua**: luacheck

## ⌨️ **Key Bindings**

### **Leader Key: `<Space>`**

#### **File Operations**
- `<leader>w` - Save file
- `<leader>q` - Quit
- `<leader>Q` - Quit all
- `<leader>e` - Open file explorer (Oil)
- `<leader>u` - Toggle undo tree

#### **Navigation**
- `<leader>a` - Toggle Aerial (code outline)
- `{` / `}` - Navigate symbols
- `<leader>f` - Find files (Telescope)
- `<leader>r` - Recently used files
- `<leader>t` - Find text

#### **LSP & Code Actions**
- `gd` - Go to definition
- `gr` - Go to references
- `K` - Hover information
- `<leader>ca` - Code actions
- `<leader>rn` - Rename symbol
- `<leader>f` - Format code
- `<leader>l` - Toggle diagnostics display

#### **Git Operations**
- `<leader>gd` - Open git diff (diffview)
- `<leader>gD` - Close git diff
- `<leader>gw` - Grep string

#### **Testing**
- `<leader>tf` - Test file
- `<leader>ts` - Stop test
- `<leader>td` - Run last test
- `<leader>to` - Open test output
- `<leader>tS` - Toggle test summary

#### **Code Execution**
- `<leader>r` - Run code snippet (SnipRun)
- `<leader>r` (visual) - Run selected code

#### **Configuration**
- `<leader>ev` - Edit init.lua
- `<leader>sv` - Source init.lua
- `<leader>c` - Open configuration
- `<leader>l` - Open Lazy plugin manager

#### **Window Management**
- `<C-h/j/k/l>` - Navigate splits
- `<leader>=` - Equalize windows
- `<leader>o` - Close other windows
- `<M-,/.>` - Resize splits horizontally
- `<M-t/s>` - Resize splits vertically

#### **Diagnostics**
- `]d` / `[d` - Next/Previous diagnostic
- `<leader>xx` - Toggle trouble
- `<leader>xw` - Workspace diagnostics
- `<leader>xd` - Document diagnostics

## 🚀 **Quick Start**

1. **Clone the repository**
   ```bash
   git clone <your-repo-url> ~/.config/nvim
   ```

2. **Install dependencies**
   ```bash
   # Install LLVM tools for C/C++ linting
   brew install llvm
   export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
   echo 'export PATH="/opt/homebrew/opt/llvm/bin:$PATH"' >> ~/.zshrc
   
   # Install other linters
   brew install shellcheck flake8 golangci-lint luacheck checkstyle
   npm install -g eslint
   pip3 install sqlfluff --break-system-packages
   ```

3. **Start Neovim**
   ```bash
   nvim
   ```

4. **Install plugins**
   - Press `<leader>l` to open Lazy
   - Press `i` to install all plugins
   - Wait for installation to complete

## 🎯 **Configuration Structure**

```
~/.config/nvim/
├── init.lua                 # Main configuration
├── plugin/                  # Plugin configurations
│   ├── keymaps.lua         # Key bindings
│   ├── options.lua         # Neovim options
│   └── ...
├── lua/custom/
│   ├── plugins/            # Plugin definitions
│   │   ├── lsp.lua         # LSP configuration
│   │   ├── lint.lua        # Linting setup
│   │   ├── telescope.lua   # Fuzzy finding
│   │   └── ...
│   └── completion.lua      # Completion setup
└── README.md               # This file
```

## 🔧 **Customization**

### **Disable Startup Screen**
Edit `lua/custom/plugins/alpha.lua`:
```lua
enabled = false, -- Set to false to disable
```

### **Add New Linters**
Edit `lua/custom/plugins/lint.lua`:
```lua
lint.linters_by_ft = {
  your_language = { "your_linter" },
}
```

### **Custom Key Bindings**
Edit `plugin/keymaps.lua`:
```lua
vim.keymap.set("n", "<your-key>", "<your-command>", { desc = "Description" })
```

## 🎨 **Themes & Colors**

- **Custom colorscheme** with colorbuddy.nvim
- **Transparent background** support
- **Syntax highlighting** with Treesitter
- **LSP diagnostics** with virtual text
- **Git integration** with gitsigns

## 📦 **Plugin List**

### **Core**
- lazy.nvim - Plugin manager
- plenary.nvim - Lua utilities
- impatient.nvim - Startup optimization

### **LSP & Completion**
- nvim-lspconfig - LSP configuration
- mason.nvim - LSP server installer
- nvim-cmp - Completion engine
- lsp_lines.nvim - LSP diagnostics
- fidget.nvim - LSP progress

### **Navigation & Search**
- telescope.nvim - Fuzzy finder
- aerial.nvim - Code outline
- flash.nvim - Jump navigation
- harpoon - File switching
- oil.nvim - File explorer

### **Development**
- neotest - Testing framework
- sniprun - Code execution
- nvim-dap - Debugging
- conform.nvim - Formatting
- nvim-lint - Linting

### **Git**
- gitsigns.nvim - Git integration
- diffview.nvim - Git diffs
- git-conflict.nvim - Merge conflicts

### **UI & Visual**
- alpha-nvim - Startup screen
- nvim-notify - Notifications
- dressing.nvim - Input dialogs
- trouble.nvim - Diagnostics
- indent-blankline - Indent guides

## 🐛 **Troubleshooting**

### **Common Issues**

1. **LSP not working**
   - Run `:LspInfo` to check LSP status
   - Install language servers with `:Mason`

2. **Linting errors**
   - Check if linters are installed
   - Run `:checkhealth` for diagnostics

3. **Startup errors**
   - Check `:messages` for error details
   - Update plugins with `:Lazy sync`

### **Performance**
- Use `:Lazy profile` to check startup time
- Disable unused plugins
- Check `:checkhealth` for system issues

## 📚 **Documentation**

- [Neovim Documentation](https://neovim.io/doc/)
- [Lazy.nvim](https://github.com/folke/lazy.nvim)
- [Telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [LSP Configuration](https://github.com/neovim/nvim-lspconfig)

## 🤝 **Contributing**

Feel free to submit issues and enhancement requests!

## 📄 **License**

This configuration is open source and available under the MIT License.

---

**Happy coding with Neovim! 🚀✨**