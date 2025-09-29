# Neovim Configuration

A modern, feature-rich Neovim configuration optimized for development productivity.

## 🚀 Features

### Core Functionality
- **LSP Support**: Comprehensive language server support for 15+ languages
- **Completion**: nvim-cmp with LSP, snippets, and path completion
- **Fuzzy Finding**: Telescope with fzf-native for fast searching
- **Git Integration**: Complete git workflow with diffview, git-conflict, and git-blame
- **AI Integration**: ChatGPT.nvim for AI-assisted coding
- **Debugging**: nvim-dap with multiple language adapters
- **Testing**: Neotest with support for Go, Python, and Jest

### Visual & UI
- **Custom Theme**: colorbuddy-based theme with transparency effects
- **Status Line**: lualine-max with enhanced features
- **Syntax Highlighting**: Treesitter with 20+ language parsers
- **File Explorer**: Oil.nvim for modern file management

## 📁 Structure

```
~/.config/nvim/
├── init.lua                 # Main configuration entry point
├── lazy-lock.json          # Plugin version lock file
├── README.md               # This documentation
├── lua/
│   └── custom/
│       ├── completion.lua  # Completion configuration
│       ├── telescope.lua   # Telescope configuration
│       ├── treesitter.lua  # Treesitter configuration
│       ├── plugins/        # Plugin configurations
│       │   ├── lsp.lua     # LSP and language servers
│       │   ├── git.lua     # Git-related plugins
│       │   ├── ai.lua      # AI integration
│       │   ├── dap.lua     # Debugging
│       │   └── ...         # Other plugin configs
│       └── snippets/       # Custom snippets
├── plugin/                 # Plugin-specific configurations
│   ├── keymaps.lua         # Key mappings
│   ├── options.lua         # Neovim options
│   └── ...
└── colors/                 # Color schemes
    └── colorbuddy.vim      # Custom theme
```

## 🔧 Installation

1. **Prerequisites**:
   ```bash
   # Install Neovim 0.9+
   brew install neovim  # macOS
   # or
   sudo apt install neovim  # Ubuntu/Debian
   ```

2. **Clone Configuration**:
   ```bash
   git clone <your-repo> ~/.config/nvim
   cd ~/.config/nvim
   ```

3. **Install Dependencies**:
   ```bash
   # Install LSP servers (optional - Mason will install them automatically)
   # Python
   pip install pyright black isort
   
   # Node.js
   npm install -g typescript-language-server prettier
   
   # Go
   go install golang.org/x/tools/gopls@latest
   ```

4. **Start Neovim**:
   ```bash
   nvim
   # Lazy.nvim will automatically install all plugins
   ```

## ⌨️ Key Mappings

### Leader Key: `<Space>`

#### Navigation
- `<Space>fd` - Find files
- `<Space>ft` - Git files
- `<Space>fg` - Multi-ripgrep search
- `<Space>fb` - Buffers
- `<Space>/` - Fuzzy find in current buffer
- `<Space>a` - Toggle Aerial (symbol outline)
- `{` / `}` - Previous/Next symbol

#### Git
- `<Space>gd` - Open diffview
- `<Space>gD` - Close diffview
- `<Space>gb` - Toggle git blame
- `<Space>gw` - Git worktrees
- `<Space>gW` - Create git worktree
- `]c` / `[c` - Next/Previous git hunk
- `<Space>hs` - Stage hunk
- `<Space>hr` - Reset hunk

#### LSP
- `gd` - Go to definition
- `gr` - Go to references
- `K` - Hover information
- `<Space>ca` - Code actions
- `<Space>rn` - Rename symbol
- `<Space>f` - Format code
- `]d` / `[d` - Next/Previous diagnostic

#### Testing
- `<Space>tf` - Test file
- `<Space>ts` - Stop test
- `<Space>td` - Run last test
- `<Space>to` - Open test output
- `<Space>tS` - Toggle test summary

#### Debugging
- `<Space>b` - Toggle breakpoint
- `<Space>gb` - Run to cursor
- `<Space>?` - Eval variable under cursor
- `F1` - Continue
- `F2` - Step into
- `F3` - Step over
- `F4` - Step out

#### AI
- `<Space>ai` - Open ChatGPT
- `<Space>ae` - Edit with instruction
- `<Space>ag` - Run ChatGPT action

#### File Management
- `<Space>e` - Open file explorer (Oil)
- `-` - Open parent directory
- `<Space>-` - Toggle floating file explorer

#### Other
- `<Space>w` - Save file
- `<Space>q` - Quit
- `<Space>Q` - Quit all
- `<Space>h` - Clear highlights
- `<Space>u` - Toggle undo tree
- `<Space>r` - Run code snippet
- `<Space>tt` - Toggle inlay hints

## 🎨 Customization

### Colorscheme
The configuration uses a custom colorbuddy-based theme. To modify colors:

1. Edit `colors/colorbuddy.vim`
2. Modify highlight groups in `lua/custom/plugins/colorschemes.lua`

### Adding New Plugins
1. Create a new file in `lua/custom/plugins/`
2. Follow the existing pattern:
   ```lua
   return {
     {
       "author/plugin-name",
       config = function()
         require("plugin-name").setup({
           -- configuration
         })
       end,
     },
   }
   ```

### Adding New LSP Servers
1. Add the server to `lua/custom/plugins/lsp.lua`
2. Add it to the `servers` table
3. Mason will automatically install it

## 🔍 Troubleshooting

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

3. **Colors not displaying**:
   ```bash
   :colorscheme custombuddy
   ```

4. **Performance issues**:
   ```bash
   :StartupTime
   # Check startup performance
   ```

### Debug Commands
- `<Space>pd` - Debug popup colors
- `<Space>pt` - Fix popup colors
- `<Space>sr` - Refresh status line
- `<Space>st` - Toggle status line

## 📦 Plugin List

### Core Plugins
- **lazy.nvim** - Plugin manager
- **nvim-lspconfig** - LSP configuration
- **mason.nvim** - LSP/DAP installer
- **nvim-cmp** - Completion engine
- **telescope.nvim** - Fuzzy finder
- **treesitter** - Syntax highlighting

### Git Plugins
- **gitsigns.nvim** - Git signs
- **diffview.nvim** - Git diff viewer
- **git-conflict.nvim** - Conflict resolution
- **git-blame.nvim** - Git blame
- **git-worktree.nvim** - Worktree management

### AI & Productivity
- **ChatGPT.nvim** - AI integration
- **harpoon** - File navigation
- **persistence.nvim** - Session management
- **oil.nvim** - File explorer

### Development
- **nvim-dap** - Debugging
- **neotest** - Testing framework
- **conform.nvim** - Code formatting
- **nvim-lint** - Linting
- **sniprun** - Code execution

## 🚀 Performance

This configuration is optimized for performance:
- Lazy loading for most plugins
- Disabled unnecessary built-in plugins
- Smart caching enabled
- Startup time monitoring

## 📝 License

This configuration is for personal use. Feel free to adapt it for your needs.

## 🤝 Contributing

If you find issues or have improvements:
1. Fork the repository
2. Make your changes
3. Test thoroughly
4. Submit a pull request

---

**Happy coding! 🎉**