-- Platform Detection and Configuration
local M = {}

-- Detect operating system
M.is_windows = vim.fn.has("win32") == 1
M.is_macos = vim.fn.has("mac") == 1
M.is_linux = vim.fn.has("unix") == 1 and not M.is_macos

-- Platform-specific configurations
M.config = {
  -- File paths
  paths = {
    -- Use appropriate path separators
    separator = M.is_windows and "\\" or "/",
    -- Home directory
    home = M.is_windows and os.getenv("USERPROFILE") or os.getenv("HOME"),
  },
  
  -- Terminal detection
  terminal = {
    -- Windows terminals
    powershell = M.is_windows and os.getenv("PSModulePath") ~= nil,
    cmd = M.is_windows and os.getenv("ComSpec") ~= nil,
    -- macOS terminals
    iterm = M.is_macos and os.getenv("TERM_PROGRAM") == "iTerm.app",
    terminal = M.is_macos and os.getenv("TERM_PROGRAM") == "Apple_Terminal",
    -- Cross-platform
    alacritty = os.getenv("ALACRITTY_LOG") ~= nil,
    kitty = os.getenv("KITTY_WINDOW_ID") ~= nil,
    tmux = os.getenv("TMUX") ~= nil,
  },
  
  -- Transparency support
  transparency = {
    -- Windows PowerShell supports transparency
    supported = M.is_windows and (M.is_windows and os.getenv("PSModulePath") ~= nil) or M.is_macos,
    -- Different transparency approaches per platform
    method = M.is_windows and "powershell" or "standard",
  },
  
  -- Clipboard
  clipboard = {
    -- Windows
    win32yank = M.is_windows and vim.fn.executable("win32yank.exe") == 1,
    -- macOS
    pbcopy = M.is_macos and vim.fn.executable("pbcopy") == 1,
    -- Linux
    xclip = M.is_linux and vim.fn.executable("xclip") == 1,
    xsel = M.is_linux and vim.fn.executable("xsel") == 1,
  },
  
  -- Package managers
  package_managers = {
    -- Windows
    chocolatey = M.is_windows and vim.fn.executable("choco") == 1,
    winget = M.is_windows and vim.fn.executable("winget") == 1,
    -- macOS
    homebrew = M.is_macos and vim.fn.executable("brew") == 1,
    -- Linux
    apt = M.is_linux and vim.fn.executable("apt") == 1,
    yum = M.is_linux and vim.fn.executable("yum") == 1,
    pacman = M.is_linux and vim.fn.executable("pacman") == 1,
  },
}

-- Platform-specific settings
function M.setup_platform_specific()
  -- Windows-specific settings
  if M.is_windows then
    -- Windows path handling
    vim.opt.shell = "powershell"
    vim.opt.shellcmdflag = "-NoLogo -ExecutionPolicy RemoteSigned -Command"
    vim.opt.shellxquote = ""
    
    -- Windows clipboard
    if M.config.clipboard.win32yank then
      vim.g.clipboard = {
        name = "win32yank",
        copy = {
          ["+"] = "win32yank.exe -i --crlf",
          ["*"] = "win32yank.exe -i --crlf",
        },
        paste = {
          ["+"] = "win32yank.exe -o --lf",
          ["*"] = "win32yank.exe -o --lf",
        },
        cache_enabled = 0,
      }
    end
    
    -- Windows transparency
    if M.config.transparency.supported then
      vim.opt.termguicolors = true
    end
    
  -- macOS-specific settings
  elseif M.is_macos then
    -- macOS clipboard
    if M.config.clipboard.pbcopy then
      vim.g.clipboard = {
        name = "pbcopy",
        copy = {
          ["+"] = "pbcopy",
          ["*"] = "pbcopy",
        },
        paste = {
          ["+"] = "pbpaste",
          ["*"] = "pbpaste",
        },
        cache_enabled = 0,
      }
    end
    
    -- macOS transparency
    if M.config.transparency.supported then
      vim.opt.termguicolors = true
    end
    
  -- Linux-specific settings
  elseif M.is_linux then
    -- Linux clipboard
    if M.config.clipboard.xclip then
      vim.g.clipboard = {
        name = "xclip",
        copy = {
          ["+"] = "xclip -selection clipboard",
          ["*"] = "xclip -selection clipboard",
        },
        paste = {
          ["+"] = "xclip -selection clipboard -o",
          ["*"] = "xclip -selection clipboard -o",
        },
        cache_enabled = 0,
      }
    elseif M.config.clipboard.xsel then
      vim.g.clipboard = {
        name = "xsel",
        copy = {
          ["+"] = "xsel --clipboard --input",
          ["*"] = "xsel --clipboard --input",
        },
        paste = {
          ["+"] = "xsel --clipboard --output",
          ["*"] = "xsel --clipboard --output",
        },
        cache_enabled = 0,
      }
    end
  end
end

-- Platform-specific plugin configurations
function M.get_platform_config()
  return {
    -- Telescope configuration
    telescope = {
      -- Windows: Use built-in functionality (no fzf-native)
      -- macOS/Linux: Can use fzf-native if available
      use_fzf = not M.is_windows,
    },
    
    -- Which-key configuration
    which_key = {
      -- Windows: Disabled due to compatibility issues
      -- macOS/Linux: Can be enabled
      enabled = not M.is_windows,
    },
    
    -- Transparency configuration
    transparency = {
      enabled = M.config.transparency.supported,
      method = M.config.transparency.method,
    },
    
    -- File explorer
    file_explorer = {
      -- Use Oil.nvim (cross-platform)
      use_oil = true,
    },
  }
end

-- Platform-specific keymaps
function M.setup_platform_keymaps()
  local set = vim.keymap.set
  
  -- Windows-specific keymaps
  if M.is_windows then
    -- Windows PowerShell specific
    if M.config.terminal.powershell then
      set("n", "<leader>pt", function()
        vim.notify("PowerShell detected - Transparency supported", vim.log.levels.INFO)
      end, { desc = "Check PowerShell transparency" })
    end
  end
  
  -- macOS-specific keymaps
  if M.is_macos then
    -- macOS specific commands
    set("n", "<leader>pm", function()
      vim.notify("macOS detected - Using standard transparency", vim.log.levels.INFO)
    end, { desc = "Check macOS transparency" })
  end
end

-- Platform detection info
function M.get_platform_info()
  local info = {
    os = M.is_windows and "Windows" or M.is_macos and "macOS" or "Linux",
    terminal = "Unknown",
    transparency = M.config.transparency.supported,
    clipboard = "None",
  }
  
  -- Detect terminal
  if M.config.terminal.powershell then
    info.terminal = "PowerShell"
  elseif M.config.terminal.iterm then
    info.terminal = "iTerm2"
  elseif M.config.terminal.terminal then
    info.terminal = "Terminal"
  elseif M.config.terminal.alacritty then
    info.terminal = "Alacritty"
  elseif M.config.terminal.kitty then
    info.terminal = "Kitty"
  elseif M.config.terminal.tmux then
    info.terminal = "Tmux"
  end
  
  -- Detect clipboard
  if M.config.clipboard.win32yank then
    info.clipboard = "win32yank"
  elseif M.config.clipboard.pbcopy then
    info.clipboard = "pbcopy"
  elseif M.config.clipboard.xclip then
    info.clipboard = "xclip"
  elseif M.config.clipboard.xsel then
    info.clipboard = "xsel"
  end
  
  return info
end

-- Debug platform info
function M.debug_platform()
  local info = M.get_platform_info()
  vim.notify("Platform: " .. info.os .. " | Terminal: " .. info.terminal .. " | Clipboard: " .. info.clipboard, vim.log.levels.INFO)
end

return M
