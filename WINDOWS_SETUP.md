# Windows Setup Guide

This Neovim configuration is fully compatible with Windows and includes platform-specific optimizations.

## 🪟 Windows Compatibility Features

### ✅ **Fully Supported**
- **PowerShell Integration**: Automatic PowerShell detection and configuration
- **Windows Paths**: Proper handling of Windows path separators (`\`)
- **Clipboard**: Auto-detects and configures `win32yank` for clipboard support
- **Transparency**: PowerShell transparency support when available
- **Terminal**: Works with PowerShell, CMD, Windows Terminal, and other Windows terminals

### 🔧 **Windows-Specific Optimizations**

#### Shell Configuration
```lua
-- Automatically configured for Windows
vim.opt.shell = "powershell"
vim.opt.shellcmdflag = "-NoLogo -ExecutionPolicy RemoteSigned -Command"
vim.opt.shellxquote = ""
```

#### Clipboard Setup
- Auto-detects `win32yank.exe` for clipboard integration
- Falls back to system clipboard if `win32yank` is not available
- Handles Windows line endings properly (`\r\n`)

#### Plugin Compatibility
- **Which-key**: Disabled on Windows due to compatibility issues
- **Telescope**: Uses built-in functionality (no fzf-native dependency)
- **File Explorer**: Uses Oil.nvim (cross-platform file manager)

## 📋 **Windows Installation Requirements**

### Required Software
1. **Neovim 0.10+**
   ```powershell
   # Option 1: Chocolatey
   choco install neovim
   
   # Option 2: Winget
   winget install Neovim.Neovim
   
   # Option 3: Scoop
   scoop install neovim
   ```

2. **Git** (for plugin management)
   ```powershell
   # Usually pre-installed on Windows 10/11
   # Or install via: winget install Git.Git
   ```

3. **PowerShell 5.1+** (recommended terminal)
   - Pre-installed on Windows 10/11
   - PowerShell 7+ recommended for better performance

### Optional Enhancements
1. **win32yank** (for better clipboard support)
   ```powershell
   # Install via Chocolatey
   choco install win32yank
   
   # Or download from: https://github.com/equalsraf/win32yank/releases
   ```

2. **ripgrep** (for better search performance)
   ```powershell
   choco install ripgrep
   ```

3. **fd** (for better file finding)
   ```powershell
   choco install fd
   ```

## 🚀 **Quick Setup**

1. **Clone the configuration**
   ```powershell
   git clone https://github.com/sergiogallegos/nvim-config.git $env:LOCALAPPDATA\nvim
   cd $env:LOCALAPPDATA\nvim
   ```

2. **Start Neovim** (plugins will auto-install)
   ```powershell
   nvim
   ```

3. **Verify installation**
   ```vim
   :checkhealth
   ```

## 🔧 **Windows-Specific Keymaps**

- `<leader>pt` - Check PowerShell transparency support
- `<leader>pi` - Debug platform information
- All standard keymaps work across platforms

## 🐛 **Troubleshooting**

### Common Issues

1. **PowerShell Execution Policy**
   ```powershell
   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
   ```

2. **Path Issues**
   - Ensure Neovim is in your PATH
   - Check that `nvim` command works in PowerShell

3. **Clipboard Issues**
   - Install `win32yank` for better clipboard support
   - Or use system clipboard as fallback

4. **Plugin Installation Issues**
   - Ensure Git is installed and accessible
   - Check internet connection for plugin downloads

### Performance Tips

1. **Use PowerShell 7+** for better performance
2. **Windows Terminal** recommended for better rendering
3. **Disable Windows Defender** real-time scanning for the nvim directory (optional)

## 📁 **Windows Paths**

The configuration automatically handles Windows paths:
- User config: `%LOCALAPPDATA%\nvim\`
- Data directory: `%LOCALAPPDATA%\nvim-data\`
- State directory: `%LOCALAPPDATA%\nvim-state\`

## 🔄 **Cross-Platform Compatibility**

This configuration works identically across:
- ✅ Windows (PowerShell, CMD, Windows Terminal)
- ✅ macOS (Terminal, iTerm2)
- ✅ Linux (various terminals)

The same configuration files work on all platforms with automatic platform detection and optimization.
