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

-- Status line settings - RESET TO BASIC
opt.laststatus = 2  -- Always show status line
opt.cmdheight = 1   -- Command line height

-- Popup transparency settings
opt.pumblend = 10   -- Light popup transparency
opt.winblend = 10   -- Light window transparency
opt.pumheight = 10 -- Maximum popup menu height
opt.pumwidth = 20  -- Minimum popup menu width
opt.termguicolors = true
