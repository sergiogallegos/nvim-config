local opt = vim.opt

----- Interesting Options -----

-- You have to turn this one on :)
opt.inccommand = "split"

-- Best search settings :)
opt.smartcase = true
opt.ignorecase = true

----- Personal Preferences -----
opt.number = true
opt.relativenumber = true

opt.splitbelow = true
opt.splitright = true

opt.signcolumn = "yes"
opt.shada = { "'10", "<0", "s10", "h" }

opt.swapfile = false

-- Don't have `o` add a comment
opt.formatoptions:remove "o"

opt.wrap = true
opt.linebreak = true

opt.tabstop = 4
opt.shiftwidth = 4

opt.more = false

opt.termguicolors = true

-- Status line settings
opt.laststatus = 2  -- Always show status line
opt.cmdheight = 1   -- Command line height

-- Enhanced transparency settings for better popup integration
opt.pumblend = 15  -- Popup menu transparency (reduced for better visibility)
opt.winblend = 15  -- Floating window transparency (reduced for better visibility)
opt.pumheight = 10 -- Maximum popup menu height
opt.pumwidth = 20  -- Minimum popup menu width

-- Force better popup rendering
opt.pumblend = 15
opt.winblend = 15
opt.termguicolors = true

-- Additional transparency settings
vim.g.transparency = true
