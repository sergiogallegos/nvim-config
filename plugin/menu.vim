" Disable right-click menu entirely to prevent errors
" This prevents the MenuPopup autocommand errors
set mousemodel=extend

" Clear any existing menus
aunmenu PopUp
aunmenu *

" Disable mouse right-click menu
nnoremenu PopUp.Definition  <cmd>lua vim.lsp.buf.definition()<CR>
nnoremenu PopUp.References  <cmd>Telescope lsp_references<CR>
nnoremenu PopUp.Show\ Diagnostics  <cmd>TroubleToggle<CR>
nnoremenu PopUp.Code\ actions  <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremenu PopUp.Rename  <cmd>lua vim.lsp.buf.rename()<CR>
nnoremenu PopUp.Format  <cmd>lua vim.lsp.buf.format()<CR>
nnoremenu PopUp.Copy\ line  <cmd>normal! yy<CR>
nnoremenu PopUp.Copy\ selection  <cmd>normal! gvy<CR>
nnoremenu PopUp.Copy\ path  <cmd>lua vim.fn.setreg('+', vim.fn.expand('%:p'))<CR>
nnoremenu PopUp.Copy\ filename  <cmd>lua vim.fn.setreg('+', vim.fn.expand('%:t'))<CR>
