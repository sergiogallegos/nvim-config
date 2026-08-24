-- emacs-default-dark: a dark companion to the GNU Emacs `font-lock` palette,
-- tuned for modern Neovim development (Treesitter, LSP, and plugins).
--
-- The classic hues stay recognizable, while colors used for small text meet a
-- comfortable contrast level and transient editor state gets subtle tinting.

vim.cmd "highlight clear"
if vim.fn.exists "syntax_on" then
    vim.cmd "syntax reset"
end
vim.o.background = "dark"
vim.g.colors_name = "emacs-default-dark"

-- Emacs-inspired font-lock colors, lifted for contrast on a neutral dark base.
local c = {
    bg = "#121417",
    fg = "#E6E8EB",
    keyword = "#C678DD", -- purple
    func = "#61AFEF", -- blue
    variable = "#E5A66A", -- sienna/chocolate
    type = "#98C379", -- forest green
    constant = "#56B6C2", -- cyan
    builtin = "#A9A1E1", -- slate blue
    string = "#E06C75", -- violet red
    comment = "#8B949E", -- gray
    warning = "#FF7B72", -- red

    -- UI chrome (Emacs default frame faces)
    region = "#294A70",
    reference = "#1F344D",
    cursorline = "#191D22",
    colorcolumn = "#21191B",
    linenr = "#5C6370",
    linenr_cur = "#FFFFFF",
    modeline_bg = "#20252B",
    modeline_fg = "#E6E8EB",
    fringe = "#121417",
    hl_line = "#181B20",
    match_paren = "#2B6F77",
    err = "#FF7B72",
    warn = "#E5C07B",
    info = "#79B8FF",
    hint = "#70D7E0",
    diag_error_bg = "#351D22",
    diag_warn_bg = "#332B18",
    diag_info_bg = "#1B2C40",
    diag_hint_bg = "#173238",
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
hl("CursorLineSign", { bg = c.cursorline })
hl("CursorLineFold", { bg = c.cursorline })
hl("CursorColumn", { bg = c.cursorline })
hl("ColorColumn", { bg = c.colorcolumn })
hl("LineNr", { fg = c.linenr, bg = c.bg })
hl("SignColumn", { fg = c.fg, bg = c.fringe })
hl("Folded", { fg = c.comment, bg = c.hl_line })
hl("FoldColumn", { fg = c.linenr, bg = c.bg })
hl("Visual", { bg = c.region })
hl("VisualNOS", { bg = c.region })
hl("Search", { fg = c.bg, bg = "#E5C07B" })
hl("IncSearch", { fg = c.bg, bg = "#E5A66A", bold = true })
hl("CurSearch", { fg = c.bg, bg = "#E5A66A", bold = true })
hl("MatchParen", { bg = c.match_paren, bold = true })
hl("NonText", { fg = "#3B4048" })
hl("Whitespace", { fg = "#2C3138" })
hl("SpecialKey", { fg = "#3B4048" })
hl("Conceal", { fg = c.linenr })
hl("Directory", { fg = c.func })
hl("Title", { fg = c.func, bold = true })
hl("EndOfBuffer", { fg = c.bg })
hl("WinSeparator", { fg = "#3B4048", bg = c.bg })
hl("VertSplit", { fg = "#3B4048", bg = c.bg })

-- Statusline / tabline (mode-line)
hl("StatusLine", { fg = c.modeline_fg, bg = c.modeline_bg })
hl("StatusLineNC", { fg = c.linenr, bg = c.hl_line })
hl("TabLine", { fg = c.linenr, bg = c.hl_line })
hl("TabLineSel", { fg = c.fg, bg = c.bg, bold = true })
hl("TabLineFill", { bg = c.bg })
hl("WildMenu", { fg = c.bg, bg = c.func })

-- Popup menu (company/completion)
hl("Pmenu", { fg = c.fg, bg = "#1B1F24" })
hl("PmenuSel", { fg = c.bg, bg = c.func })
hl("PmenuMatch", { fg = c.func, bold = true })
hl("PmenuMatchSel", { fg = c.bg, bg = c.func, bold = true })
hl("PmenuKind", { fg = c.type, bg = "#1B1F24" })
hl("PmenuKindSel", { fg = c.bg, bg = c.func })
hl("PmenuExtra", { fg = c.comment, bg = "#1B1F24" })
hl("PmenuExtraSel", { fg = c.bg, bg = c.func })
hl("PmenuSbar", { bg = "#292E35" })
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
hl("@comment.documentation", { fg = c.comment })
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
hl("@string.documentation", { fg = c.string })
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

-- LSP navigation and inline context
hl("LspReferenceText", { bg = c.reference })
hl("LspReferenceRead", { bg = c.reference })
hl("LspReferenceWrite", { bg = c.reference, underline = true })
hl("LspSignatureActiveParameter", { fg = c.func, bg = c.reference, bold = true })
hl("LspInlayHint", { fg = c.comment, bg = c.cursorline })
hl("LspCodeLens", { fg = c.comment })
hl("LspCodeLensSeparator", { fg = c.linenr })

-- ── Diagnostics ──────────────────────────────────────────────────────────
hl("DiagnosticError", { fg = c.err })
hl("DiagnosticWarn", { fg = c.warn })
hl("DiagnosticInfo", { fg = c.info })
hl("DiagnosticHint", { fg = c.hint })
hl("DiagnosticOk", { fg = c.type })
hl("DiagnosticSignError", { fg = c.err })
hl("DiagnosticSignWarn", { fg = c.warn })
hl("DiagnosticSignInfo", { fg = c.info })
hl("DiagnosticSignHint", { fg = c.hint })
hl("DiagnosticSignOk", { fg = c.type })
hl("DiagnosticUnderlineError", { sp = c.err, undercurl = true })
hl("DiagnosticUnderlineWarn", { sp = c.warn, undercurl = true })
hl("DiagnosticUnderlineInfo", { sp = c.info, undercurl = true })
hl("DiagnosticUnderlineHint", { sp = c.hint, undercurl = true })
hl("DiagnosticVirtualTextError", { fg = c.err, bg = c.diag_error_bg })
hl("DiagnosticVirtualTextWarn", { fg = c.warn, bg = c.diag_warn_bg })
hl("DiagnosticVirtualTextInfo", { fg = c.info, bg = c.diag_info_bg })
hl("DiagnosticVirtualTextHint", { fg = c.hint, bg = c.diag_hint_bg })
hl("DiagnosticFloatingError", { fg = c.err })
hl("DiagnosticFloatingWarn", { fg = c.warn })
hl("DiagnosticFloatingInfo", { fg = c.info })
hl("DiagnosticFloatingHint", { fg = c.hint })

-- Spelling and list navigation
hl("SpellBad", { sp = c.err, undercurl = true })
hl("SpellCap", { sp = c.info, undercurl = true })
hl("SpellRare", { sp = c.keyword, undercurl = true })
hl("SpellLocal", { sp = c.hint, undercurl = true })
hl("QuickFixLine", { bg = c.reference, bold = true })

-- ── Diffs / git ──────────────────────────────────────────────────────────
hl("DiffAdd", { bg = "#183B2A" })
hl("DiffChange", { bg = "#3A3318" })
hl("DiffDelete", { bg = "#442126" })
hl("DiffText", { bg = "#594A18" })
hl("Added", { fg = c.type })
hl("Changed", { fg = c.func })
hl("Removed", { fg = c.err })
hl("GitSignsAdd", { fg = c.type })
hl("GitSignsChange", { fg = c.func })
hl("GitSignsDelete", { fg = c.err })

-- ── Completion ───────────────────────────────────────────────────────────
hl("CmpItemAbbr", { fg = c.fg })
hl("CmpItemAbbrMatch", { fg = c.func, bold = true })
hl("CmpItemAbbrMatchFuzzy", { fg = c.keyword, bold = true })
hl("CmpItemAbbrDeprecated", { fg = c.linenr, strikethrough = true })
hl("CmpItemMenu", { fg = c.comment })
hl("CmpItemKindText", { fg = c.fg })
hl("CmpItemKindMethod", { fg = c.func })
hl("CmpItemKindFunction", { fg = c.func })
hl("CmpItemKindConstructor", { fg = c.func })
hl("CmpItemKindField", { fg = c.variable })
hl("CmpItemKindVariable", { fg = c.variable })
hl("CmpItemKindProperty", { fg = c.variable })
hl("CmpItemKindClass", { fg = c.type })
hl("CmpItemKindInterface", { fg = c.type })
hl("CmpItemKindStruct", { fg = c.type })
hl("CmpItemKindTypeParameter", { fg = c.type })
hl("CmpItemKindModule", { fg = c.type })
hl("CmpItemKindUnit", { fg = c.constant })
hl("CmpItemKindValue", { fg = c.constant })
hl("CmpItemKindEnum", { fg = c.constant })
hl("CmpItemKindEnumMember", { fg = c.constant })
hl("CmpItemKindConstant", { fg = c.constant })
hl("CmpItemKindKeyword", { fg = c.keyword })
hl("CmpItemKindSnippet", { fg = c.builtin })
hl("CmpItemKindFile", { fg = c.func })
hl("CmpItemKindFolder", { fg = c.func })
hl("CmpItemKindReference", { fg = c.builtin })
hl("CmpItemKindColor", { fg = c.constant })
hl("CmpItemKindEvent", { fg = c.builtin })
hl("CmpItemKindOperator", { fg = c.keyword })

-- ── Plugin surfaces ──────────────────────────────────────────────────────
hl("WhichKey", { fg = c.func })
hl("WhichKeyGroup", { fg = c.keyword })
hl("WhichKeyDesc", { fg = c.fg })
hl("WhichKeySeparator", { fg = c.linenr })
hl("WhichKeyNormal", { fg = c.fg, bg = c.bg })
hl("WhichKeyBorder", { fg = c.linenr, bg = c.bg })
hl("WhichKeyTitle", { fg = c.func, bg = c.bg, bold = true })
hl("TelescopeBorder", { fg = c.linenr })
hl("TelescopePromptBorder", { fg = c.func })
hl("TelescopePromptTitle", { fg = c.bg, bg = c.func, bold = true })
hl("TelescopeResultsTitle", { fg = c.func, bold = true })
hl("TelescopePreviewTitle", { fg = c.type, bold = true })
hl("TelescopeSelection", { bg = c.region })
hl("TelescopeSelectionCaret", { fg = c.func, bg = c.region, bold = true })
hl("TelescopeMatching", { fg = c.keyword, bold = true })

-- Bufferline defaults are applied with `default = true`, so these colors win.
hl("BufferLineFill", { bg = c.modeline_bg })
hl("BufferLineBackground", { fg = c.comment, bg = c.hl_line })
hl("BufferLineBufferVisible", { fg = c.fg, bg = c.hl_line })
hl("BufferLineBufferSelected", { fg = c.fg, bg = c.bg, bold = true })
hl("BufferLineIndicatorSelected", { fg = c.func, bg = c.bg })
hl("BufferLineSeparator", { fg = c.modeline_bg, bg = c.hl_line })
hl("BufferLineSeparatorVisible", { fg = c.modeline_bg, bg = c.hl_line })
hl("BufferLineSeparatorSelected", { fg = c.modeline_bg, bg = c.bg })
hl("BufferLineModified", { fg = c.warn, bg = c.hl_line })
hl("BufferLineModifiedVisible", { fg = c.warn, bg = c.hl_line })
hl("BufferLineModifiedSelected", { fg = c.warn, bg = c.bg, bold = true })
hl("BufferLineCloseButton", { fg = c.comment, bg = c.hl_line })
hl("BufferLineCloseButtonVisible", { fg = c.comment, bg = c.hl_line })
hl("BufferLineCloseButtonSelected", { fg = c.err, bg = c.bg })

hl("TroubleNormal", { fg = c.fg, bg = c.bg })
hl("TroubleNormalNC", { fg = c.fg, bg = c.bg })
hl("TroubleText", { fg = c.fg })
hl("TroubleSource", { fg = c.comment })
hl("TroubleCode", { fg = c.constant })
hl("TroubleIndent", { fg = "#3B4048" })
hl("TroublePreview", { bg = c.reference })

hl("OilDir", { fg = c.func, bold = true })
hl("OilDirIcon", { fg = c.func })
hl("OilHidden", { fg = c.linenr })
hl("OilLink", { fg = c.constant, underline = true })
hl("OilOrphanLink", { fg = c.err, underline = true })
hl("OilCreate", { fg = c.type })
hl("OilDelete", { fg = c.err })
hl("OilMove", { fg = c.warn })
hl("OilCopy", { fg = c.func })
hl("OilChange", { fg = c.keyword })
