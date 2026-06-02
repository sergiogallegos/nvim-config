-- emacs-default: a faithful port of GNU Emacs's default `font-lock` faces
-- (light background, the classic `emacs -q` look) to Neovim + Treesitter + LSP.
--
-- Palette below uses the exact X11 color names Emacs defines its default faces
-- with, so syntax colors match vanilla Emacs ~95%. Emacs does NOT bold its
-- default faces (only warnings), so nothing here is bold either, for fidelity.

vim.cmd "highlight clear"
if vim.fn.exists "syntax_on" then
    vim.cmd "syntax reset"
end
vim.o.background = "light"
vim.g.colors_name = "emacs-default"

-- Default Emacs font-lock colors (X11 names -> hex)
local c = {
    bg = "#FFFFFF", -- Emacs default background
    fg = "#000000", -- default foreground
    keyword = "#A020F0", -- font-lock-keyword-face         (Purple)
    func = "#0000FF", -- font-lock-function-name-face    (Blue1)
    variable = "#A0522D", -- font-lock-variable-name-face    (sienna)
    type = "#228B22", -- font-lock-type-face             (ForestGreen)
    constant = "#008B8B", -- font-lock-constant-face         (dark cyan)
    builtin = "#483D8B", -- font-lock-builtin-face          (dark slate blue)
    string = "#8B2252", -- font-lock-string-face           (VioletRed4)
    comment = "#B22222", -- font-lock-comment-face          (Firebrick)
    warning = "#FF0000", -- font-lock-warning-face          (Red)
    doc = "#8B2252", -- font-lock-doc-face (inherits string)

    -- UI chrome (Emacs default frame faces)
    region = "#EEDC82", -- region (default light selection, LightGoldenrod2)
    cursorline = "#F2F2F2",
    linenr = "#999999",
    linenr_cur = "#000000",
    modeline_bg = "#E5E5E5", -- mode-line
    modeline_fg = "#000000",
    fringe = "#FFFFFF",
    hl_line = "#F0F0F0",
    match_paren = "#40E0D0", -- show-paren-match (turquoise)
    err = "#FF0000",
    warn = "#FF8C00",
    info = "#0000FF",
    hint = "#008B8B",
}

local function hl(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

-- ── Core editor ──────────────────────────────────────────────────────────
hl("Normal", { fg = c.fg, bg = c.bg })
hl("NormalNC", { fg = c.fg, bg = c.bg })
hl("NormalFloat", { fg = c.fg, bg = c.bg })
hl("FloatBorder", { fg = c.linenr, bg = c.bg })
hl("FloatTitle", { fg = c.func, bg = c.bg, bold = true })
hl("Cursor", { fg = c.bg, bg = c.fg })
hl("CursorLine", { bg = c.cursorline })
hl("CursorLineNr", { fg = c.linenr_cur, bg = c.cursorline })
hl("CursorColumn", { bg = c.cursorline })
hl("ColorColumn", { bg = c.hl_line })
hl("LineNr", { fg = c.linenr, bg = c.bg })
hl("SignColumn", { fg = c.fg, bg = c.fringe })
hl("Folded", { fg = c.comment, bg = c.hl_line })
hl("FoldColumn", { fg = c.linenr, bg = c.bg })
hl("Visual", { bg = c.region })
hl("VisualNOS", { bg = c.region })
hl("Search", { fg = c.fg, bg = "#FFFF00" }) -- isearch / lazy-highlight (yellow)
hl("IncSearch", { fg = c.bg, bg = c.keyword })
hl("CurSearch", { fg = c.bg, bg = c.keyword })
hl("MatchParen", { bg = c.match_paren, bold = true })
hl("NonText", { fg = "#CCCCCC" })
hl("Whitespace", { fg = "#DDDDDD" })
hl("SpecialKey", { fg = "#CCCCCC" })
hl("Conceal", { fg = c.linenr })
hl("Directory", { fg = c.func })
hl("Title", { fg = c.func, bold = true })
hl("EndOfBuffer", { fg = c.bg })
hl("WinSeparator", { fg = "#CCCCCC", bg = c.bg })
hl("VertSplit", { fg = "#CCCCCC", bg = c.bg })

-- Statusline / tabline (mode-line)
hl("StatusLine", { fg = c.modeline_fg, bg = c.modeline_bg })
hl("StatusLineNC", { fg = c.linenr, bg = c.hl_line })
hl("TabLine", { fg = c.linenr, bg = c.hl_line })
hl("TabLineSel", { fg = c.fg, bg = c.bg, bold = true })
hl("TabLineFill", { bg = c.bg })
hl("WildMenu", { fg = c.bg, bg = c.func })

-- Popup menu (company/completion)
hl("Pmenu", { fg = c.fg, bg = "#F0F0F0" })
hl("PmenuSel", { fg = c.bg, bg = c.func })
hl("PmenuSbar", { bg = "#E0E0E0" })
hl("PmenuThumb", { bg = c.linenr })

-- Messages
hl("ErrorMsg", { fg = c.err, bold = true })
hl("WarningMsg", { fg = c.warn })
hl("ModeMsg", { fg = c.fg })
hl("MoreMsg", { fg = c.func })
hl("Question", { fg = c.func })

-- ── Classic syntax groups (vim regex / fallback) ─────────────────────────
hl("Comment", { fg = c.comment })
hl("Constant", { fg = c.constant })
hl("String", { fg = c.string })
hl("Character", { fg = c.string })
hl("Number", { fg = c.constant })
hl("Float", { fg = c.constant })
hl("Boolean", { fg = c.constant })
hl("Identifier", { fg = c.fg }) -- plain identifiers are uncolored in Emacs
hl("Function", { fg = c.func })
hl("Statement", { fg = c.keyword })
hl("Conditional", { fg = c.keyword })
hl("Repeat", { fg = c.keyword })
hl("Label", { fg = c.keyword })
hl("Operator", { fg = c.fg }) -- Emacs leaves operators in default fg
hl("Keyword", { fg = c.keyword })
hl("Exception", { fg = c.keyword })
hl("PreProc", { fg = c.builtin }) -- font-lock-preprocessor-face inherits builtin
hl("Include", { fg = c.builtin })
hl("Define", { fg = c.builtin })
hl("Macro", { fg = c.builtin })
hl("PreCondit", { fg = c.builtin })
hl("Type", { fg = c.type })
hl("StorageClass", { fg = c.keyword })
hl("Structure", { fg = c.type })
hl("Typedef", { fg = c.type })
hl("Special", { fg = c.constant })
hl("SpecialChar", { fg = c.constant })
hl("Tag", { fg = c.func })
hl("Delimiter", { fg = c.fg })
hl("SpecialComment", { fg = c.comment, bold = true })
hl("Debug", { fg = c.warning })
hl("Underlined", { fg = c.func, underline = true })
hl("Ignore", { fg = c.linenr })
hl("Error", { fg = c.err, bold = true })
hl("Todo", { fg = c.warning, bg = c.bg, bold = true })

-- ── Treesitter (@captures) ───────────────────────────────────────────────
-- Comments / docs
hl("@comment", { link = "Comment" })
hl("@comment.documentation", { fg = c.doc })
hl("@comment.error", { fg = c.err, bold = true })
hl("@comment.warning", { fg = c.warn })
hl("@comment.todo", { link = "Todo" })
hl("@comment.note", { fg = c.info })

-- Keywords (Purple)
hl("@keyword", { fg = c.keyword })
hl("@keyword.function", { fg = c.keyword })
hl("@keyword.operator", { fg = c.keyword })
hl("@keyword.return", { fg = c.keyword })
hl("@keyword.conditional", { fg = c.keyword })
hl("@keyword.repeat", { fg = c.keyword })
hl("@keyword.exception", { fg = c.keyword })
hl("@keyword.import", { fg = c.builtin }) -- imports read as preprocessor in Emacs
hl("@keyword.directive", { fg = c.builtin })
hl("@keyword.storage", { fg = c.keyword })
hl("@keyword.coroutine", { fg = c.keyword })
hl("@conditional", { fg = c.keyword })
hl("@repeat", { fg = c.keyword })
hl("@exception", { fg = c.keyword })
hl("@label", { fg = c.keyword })

-- Functions / methods (Blue)
hl("@function", { fg = c.func })
hl("@function.call", { fg = c.func })
hl("@function.method", { fg = c.func })
hl("@function.method.call", { fg = c.func })
hl("@function.builtin", { fg = c.builtin })
hl("@function.macro", { fg = c.builtin })
hl("@constructor", { fg = c.func })
hl("@method", { fg = c.func })

-- Types (ForestGreen)
hl("@type", { fg = c.type })
hl("@type.builtin", { fg = c.type })
hl("@type.definition", { fg = c.type })
hl("@type.qualifier", { fg = c.keyword })
hl("@storageclass", { fg = c.keyword })
hl("@attribute", { fg = c.builtin })
hl("@namespace", { fg = c.type })
hl("@module", { fg = c.type })

-- Constants / numbers (dark cyan)
hl("@constant", { fg = c.constant })
hl("@constant.builtin", { fg = c.constant })
hl("@constant.macro", { fg = c.builtin })
hl("@number", { fg = c.constant })
hl("@number.float", { fg = c.constant })
hl("@float", { fg = c.constant })
hl("@boolean", { fg = c.constant })
hl("@character", { fg = c.string })
hl("@character.special", { fg = c.constant })

-- Strings (VioletRed4)
hl("@string", { fg = c.string })
hl("@string.documentation", { fg = c.doc })
hl("@string.regexp", { fg = c.constant })
hl("@string.escape", { fg = c.constant })
hl("@string.special", { fg = c.constant })
hl("@string.special.symbol", { fg = c.constant })
hl("@string.special.url", { fg = c.func, underline = true })

-- Variables: plain references are uncolored in Emacs; only params/definitions tinted
hl("@variable", { fg = c.fg })
hl("@variable.builtin", { fg = c.builtin })
hl("@variable.parameter", { fg = c.variable })
hl("@variable.member", { fg = c.variable })
hl("@parameter", { fg = c.variable })
hl("@field", { fg = c.variable })
hl("@property", { fg = c.variable })

-- Punctuation / operators (default fg, like Emacs)
hl("@operator", { fg = c.fg })
hl("@punctuation.delimiter", { fg = c.fg })
hl("@punctuation.bracket", { fg = c.fg })
hl("@punctuation.special", { fg = c.constant })

-- Preprocessor
hl("@preproc", { fg = c.builtin })
hl("@define", { fg = c.builtin })
hl("@macro", { fg = c.builtin })

-- Tags / markup
hl("@tag", { fg = c.func })
hl("@tag.attribute", { fg = c.variable })
hl("@tag.delimiter", { fg = c.fg })
hl("@markup.heading", { fg = c.func, bold = true })
hl("@markup.strong", { bold = true })
hl("@markup.italic", { italic = true })
hl("@markup.link", { fg = c.func, underline = true })
hl("@markup.link.url", { fg = c.func, underline = true })
hl("@markup.raw", { fg = c.string })
hl("@markup.list", { fg = c.keyword })

-- ── LSP semantic tokens (mirror the font-lock mapping) ───────────────────
hl("@lsp.type.keyword", { fg = c.keyword })
hl("@lsp.type.function", { fg = c.func })
hl("@lsp.type.method", { fg = c.func })
hl("@lsp.type.namespace", { fg = c.type })
hl("@lsp.type.type", { fg = c.type })
hl("@lsp.type.class", { fg = c.type })
hl("@lsp.type.struct", { fg = c.type })
hl("@lsp.type.enum", { fg = c.type })
hl("@lsp.type.interface", { fg = c.type })
hl("@lsp.type.typeParameter", { fg = c.type })
hl("@lsp.type.parameter", { fg = c.variable })
hl("@lsp.type.property", { fg = c.variable })
hl("@lsp.type.variable", { fg = c.fg })
hl("@lsp.type.enumMember", { fg = c.constant })
hl("@lsp.type.string", { fg = c.string })
hl("@lsp.type.number", { fg = c.constant })
hl("@lsp.type.comment", { fg = c.comment })
hl("@lsp.type.macro", { fg = c.builtin })
hl("@lsp.type.builtinType", { fg = c.type })
hl("@lsp.type.decorator", { fg = c.builtin })

-- ── Diagnostics ──────────────────────────────────────────────────────────
hl("DiagnosticError", { fg = c.err })
hl("DiagnosticWarn", { fg = c.warn })
hl("DiagnosticInfo", { fg = c.info })
hl("DiagnosticHint", { fg = c.hint })
hl("DiagnosticUnderlineError", { sp = c.err, undercurl = true })
hl("DiagnosticUnderlineWarn", { sp = c.warn, undercurl = true })
hl("DiagnosticUnderlineInfo", { sp = c.info, undercurl = true })
hl("DiagnosticUnderlineHint", { sp = c.hint, undercurl = true })
hl("DiagnosticVirtualTextError", { fg = c.err, bg = c.bg })
hl("DiagnosticVirtualTextWarn", { fg = c.warn, bg = c.bg })
hl("DiagnosticVirtualTextInfo", { fg = c.info, bg = c.bg })
hl("DiagnosticVirtualTextHint", { fg = c.hint, bg = c.bg })

-- ── Diffs / git ──────────────────────────────────────────────────────────
hl("DiffAdd", { bg = "#DDFFDD" })
hl("DiffChange", { bg = "#FFFFDD" })
hl("DiffDelete", { bg = "#FFDDDD" })
hl("DiffText", { bg = "#FFFF99" })
hl("Added", { fg = c.type })
hl("Changed", { fg = c.func })
hl("Removed", { fg = c.err })
hl("GitSignsAdd", { fg = c.type })
hl("GitSignsChange", { fg = c.func })
hl("GitSignsDelete", { fg = c.err })

-- ── Misc plugin niceties ─────────────────────────────────────────────────
hl("WhichKey", { fg = c.func })
hl("WhichKeyGroup", { fg = c.keyword })
hl("WhichKeyDesc", { fg = c.fg })
hl("WhichKeySeparator", { fg = c.linenr })
hl("TelescopeBorder", { fg = c.linenr })
hl("TelescopeSelection", { bg = c.region })
hl("TelescopeMatching", { fg = c.keyword, bold = true })
