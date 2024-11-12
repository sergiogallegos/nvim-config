" ~/.config/nvim/colors/my-colorscheme-name.vim

" Set termguicolors to enable 24-bit color
if has("termguicolors")
  set termguicolors
endif

" Clear highlights and reset syntax
hi clear
if exists("syntax_on")
  syntax reset
endif

" Set colorscheme name
let g:colors_name = "my-colorscheme-name"

" Load the Colorbuddy colorscheme from Lua
lua require('colors.my-colorscheme-name')
