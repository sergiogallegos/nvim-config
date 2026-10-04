-- Shared highlight mappings for the Xcode light and dark themes.
local M = {}

function M.apply(mode)
    vim.cmd.highlight "clear"
    if vim.fn.exists "syntax_on" == 1 then
        vim.cmd.syntax "reset"
    end
    vim.o.background = mode
    vim.g.colors_name = "xcode-" .. mode
    local c = require(mode == "dark" and "custom.xcode-dark-palette" or "custom.xcode-palette")
    for i, color in ipairs(c.ansi) do
        vim.g["terminal_color_" .. (i - 1)] = color
    end
    -- GUI clients can use the same family/size; terminal Neovim inherits Ghostty.
    vim.o.guifont = mode == "dark" and "SF Mono Medium:h12" or "SF Mono:h12"

    local function hl(name, value)
        vim.api.nvim_set_hl(0, name, value)
    end
    local function groups(names, value)
        for name in names:gmatch "%S+" do
            hl(name, value)
        end
    end
    local function link(names, target)
        groups(names, { link = target })
    end

    -- Editor surfaces use the selected palette, including floating UI.
    groups("Normal NormalNC NormalFloat MsgArea StatusLine StatusLineNC TabLineFill", { fg = c.fg, bg = c.bg })
    groups("FloatBorder WinSeparator VertSplit", { fg = c.border, bg = c.bg })
    groups("Cursor lCursor TermCursor", { fg = c.bg, bg = c.fg })
    groups("CursorLine CursorColumn CursorLineSign CursorLineFold ColorColumn", { bg = c.subtle })
    hl("CursorLineNr", { fg = c.fg, bg = c.subtle })
    groups("LineNr FoldColumn SignColumn", { fg = c.comment, bg = c.bg })
    hl("Folded", { fg = c.comment, bg = c.subtle })
    groups("Visual VisualNOS Search", { bg = c.selection })
    groups("IncSearch CurSearch MatchParen", { fg = c.fg, bg = c.border, bold = true })
    groups("NonText Whitespace SpecialKey", { fg = c.invisibles })
    hl("Conceal", { fg = c.comment })
    hl("EndOfBuffer", { fg = c.bg })
    groups("Directory Title FloatTitle", { fg = c.declaration })
    hl("TabLine", { fg = c.comment, bg = c.subtle })
    hl("TabLineSel", { fg = c.fg, bg = c.bg, bold = true })
    groups("Pmenu PmenuKind PmenuExtra", { fg = c.fg, bg = c.bg })
    groups("PmenuSel PmenuKindSel PmenuExtraSel WildMenu", { fg = c.fg, bg = c.selection })
    groups("PmenuMatch PmenuMatchSel", { fg = c.declaration, bold = true })
    hl("PmenuSbar", { bg = c.subtle })
    hl("PmenuThumb", { bg = c.border })
    groups("ModeMsg MoreMsg Question", { fg = c.fg })

    -- Vim syntax and shared targets for Tree-sitter and semantic tokens.
    hl("Comment", { fg = c.comment })
    groups("String", { fg = c.string })
    groups("Number Float Character", { fg = c.number })
    groups("Statement Conditional Repeat Label Keyword Exception StorageClass Boolean", { fg = c.keyword, bold = true })
    groups("Identifier Constant Function", { fg = c.identifier })
    groups("Type Structure Typedef", { fg = c.type })
    groups("PreProc Include Define Macro PreCondit", { fg = c.macro })
    groups("Operator Delimiter", { fg = c.fg })
    groups("Special SpecialChar", { fg = c.character })
    hl("SpecialComment", { fg = c.doc_keyword, bold = true })
    hl("Underlined", { fg = c.url, underline = true })
    hl("Tag", { fg = c.declaration })
    groups("Todo Debug", { fg = c.attribute, bold = true })
    hl("Ignore", { fg = c.comment })

    link("@comment @comment.documentation", "Comment")
    link("@string @string.documentation", "String")
    link("@string.escape @character @character.special", "Character")
    link("@number @number.float", "Number")
    link("@boolean @keyword", "Keyword")
    link("@keyword.directive @keyword.import @function.macro @constant.macro", "PreProc")
    link("@operator @punctuation", "Delimiter")
    link("@variable @variable.parameter @variable.member @property @constant", "Identifier")
    link("@function @function.call @function.method @function.method.call", "Function")
    link("@type @type.definition @constructor @module", "Type")
    groups("@type.builtin", { fg = c.system_type })
    groups("@function.builtin @variable.builtin @constant.builtin", { fg = c.system_identifier })
    groups("@attribute @attribute.builtin", { fg = c.attribute })
    link("@tag", "Tag")
    link("@tag.attribute", "Identifier")
    link("@tag.delimiter", "Delimiter")
    link("@string.regexp", "String")
    groups("@markup.raw markdownCode markdownCodeBlock markdownCodeDelimiter", { fg = c.markup_code })
    groups("XcodeAside @markup.aside", { fg = c.aside })
    link("@markup.link.url @string.special.url", "Underlined")
    groups("@markup.heading @markup.strong", { fg = c.fg, bold = true })
    hl("@markup.italic", { fg = c.fg }) -- Keep the user's no-italics preference.
    hl("@markup.strikethrough", { fg = c.comment, strikethrough = true })
    link("@markup.link @markup.list", "Tag")

    -- Xcode distinguishes declarations and system symbols. Apply this where the
    -- language server supplies equivalent modifiers; retain syntax otherwise.
    link("@lsp.type.variable @lsp.type.parameter @lsp.type.property @lsp.type.enumMember", "Identifier")
    link("@lsp.type.function @lsp.type.method", "Function")
    link("@lsp.type.class @lsp.type.interface @lsp.type.struct @lsp.type.enum @lsp.type.type @lsp.type.typeParameter @lsp.type.namespace", "Type")
    link("@lsp.type.keyword", "Keyword")
    link("@lsp.type.comment", "Comment")
    link("@lsp.type.string", "String")
    link("@lsp.type.number", "Number")
    link("@lsp.type.operator", "Operator")
    link("@lsp.type.macro", "Macro")
    groups("@lsp.type.decorator", { fg = c.attribute })
    groups("@lsp.type.builtinType", { fg = c.system_type })
    for _, kind in ipairs({ "function", "method", "variable", "property", "parameter", "enumMember" }) do
        hl("@lsp.typemod." .. kind .. ".declaration", { fg = c.declaration })
        hl("@lsp.typemod." .. kind .. ".definition", { fg = c.declaration })
        hl("@lsp.typemod." .. kind .. ".defaultLibrary", { fg = c.system_identifier })
    end
    for _, kind in ipairs({ "class", "struct", "enum", "interface", "type", "typeParameter" }) do
        hl("@lsp.typemod." .. kind .. ".declaration", { fg = c.type_declaration })
        hl("@lsp.typemod." .. kind .. ".definition", { fg = c.type_declaration })
        hl("@lsp.typemod." .. kind .. ".defaultLibrary", { fg = c.system_type })
    end
    groups("LspReferenceText LspReferenceRead LspReferenceWrite", { bg = c.selection })
    hl("LspSignatureActiveParameter", { fg = c.declaration, bold = true })
    groups("LspInlayHint LspCodeLens LspCodeLensSeparator", { fg = c.comment })

    -- Diagnostic and version-control colors use the syntax palette on neutral UI.
    for kind, color in pairs({ Error = c.error, Warn = c.warning, Info = c.info, Hint = c.hint, Ok = c.green }) do
        groups("Diagnostic" .. kind .. " DiagnosticSign" .. kind .. " DiagnosticFloating" .. kind .. " DiagnosticVirtualText" .. kind, { fg = color })
        hl("DiagnosticUnderline" .. kind, { sp = color, undercurl = true })
    end
    link("Error ErrorMsg @comment.error", "DiagnosticError")
    link("WarningMsg @comment.warning", "DiagnosticWarn")
    link("@comment.todo @comment.note", "Todo")
    for name, color in pairs({ SpellBad = c.string, SpellCap = c.declaration, SpellRare = c.keyword, SpellLocal = c.identifier }) do
        hl(name, { sp = color, undercurl = true })
    end
    hl("QuickFixLine", { bg = c.selection })
    groups("Added GitSignsAdd DiffAdd @diff.plus", { fg = c.green })
    groups("Changed GitSignsChange DiffChange", { fg = c.diff })
    groups("Removed GitSignsDelete DiffDelete @diff.minus", { fg = c.error })
    hl("DiffText", { fg = c.declaration, bg = c.selection, bold = true })
    link("@diff.delta", "Changed")

    -- Completion and installed plugin surfaces.
    link("CmpItemAbbr", "Normal")
    groups("CmpItemAbbrMatch CmpItemAbbrMatchFuzzy", { fg = c.declaration, bold = true })
    hl("CmpItemAbbrDeprecated", { fg = c.comment, strikethrough = true })
    link("CmpItemMenu", "Comment")
    for _, kind in ipairs({ "Function", "Method", "Constructor" }) do link("CmpItemKind" .. kind, "Function") end
    for _, kind in ipairs({ "Class", "Struct", "Interface", "TypeParameter", "Module", "Enum" }) do link("CmpItemKind" .. kind, "Type") end
    for _, kind in ipairs({ "Variable", "Field", "Property", "Constant", "EnumMember", "Value" }) do link("CmpItemKind" .. kind, "Identifier") end
    link("CmpItemKindKeyword", "Keyword")
    link("CmpItemKindText", "Normal")
    groups("TelescopeNormal TelescopePromptNormal TelescopeResultsNormal TelescopePreviewNormal WhichKeyNormal TroubleNormal TroubleNormalNC", { fg = c.fg, bg = c.bg })
    link("TelescopeBorder TelescopePromptBorder TelescopeResultsBorder TelescopePreviewBorder WhichKeyBorder", "FloatBorder")
    groups("TelescopeSelection", { fg = c.fg, bg = c.selection })
    groups("TelescopeMatching TelescopeSelectionCaret WhichKey WhichKeyGroup", { fg = c.declaration, bold = true })
    link("TelescopePromptTitle TelescopeResultsTitle TelescopePreviewTitle WhichKeyTitle", "FloatTitle")
    link("WhichKeyDesc TroubleText", "Normal")
    link("WhichKeySeparator TroubleSource TroubleCode TroubleIndent", "Comment")
    link("TroublePreview", "Visual")
    link("OilDir OilDirIcon OilCopy", "Directory")
    link("OilHidden", "Comment")
    link("OilLink", "Underlined")
    link("OilOrphanLink OilDelete", "DiagnosticError")
    link("OilCreate", "Added")
    link("OilMove OilChange", "Changed")
    hl("BufferLineFill", { bg = c.bg })
    groups("BufferLineBackground BufferLineBufferVisible", { fg = c.comment, bg = c.subtle })
    hl("BufferLineBufferSelected", { fg = c.fg, bg = c.bg, bold = true })
    groups("BufferLineIndicatorSelected", { fg = c.declaration, bg = c.bg })
    groups("BufferLineSeparator BufferLineSeparatorVisible BufferLineSeparatorSelected", { fg = c.border, bg = c.bg })

end

return M
