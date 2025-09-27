require "custom.snippets"

vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.shortmess:append "c"

local lspkind = require "lspkind"
lspkind.init {
  mode = "symbol_text",
  menu = {
    buffer = "[buf]",
    nvim_lsp = "[LSP]",
    nvim_lua = "[api]",
    path = "[path]",
    luasnip = "[snip]",
  },
}

local cmp = require "cmp"

cmp.setup {
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body) -- Correct snippet expansion
    end,
  },

  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" }, -- LuaSnip for snippet completion
    { name = "path" },
    { name = "buffer" },
  },

  mapping = cmp.mapping.preset.insert({
    ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
    ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
    ["<C-y>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },
    ["<C-Space>"] = cmp.mapping.complete(), -- Manual trigger for completion
    ["<C-e>"] = cmp.mapping.abort(), -- Abort completion
    ["<Down>"] = cmp.mapping(function(fallback)
      fallback() -- Allow Down arrow for normal cursor movement
    end, { "i", "c" }),
    ["<Up>"] = cmp.mapping(function(fallback)
      fallback() -- Allow Up arrow for normal cursor movement
    end, { "i", "c" }),
  }),

  formatting = {
    fields = { "abbr", "kind", "menu" },
    format = lspkind.cmp_format(),
  },

  sorting = {
    priority_weight = 2,
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      cmp.config.compare.recently_used,
      cmp.config.compare.locality,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },

  window = {
    completion = {
      border = "single",
      winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:PmenuSel,Search:None",
      scrollbar = false,
    },
    documentation = {
      border = "single",
      winhighlight = "NormalFloat:Normal,FloatBorder:Normal",
    },
  },
}

cmp.setup.filetype({ "sql" }, {
  sources = {
    { name = "vim-dadbod-completion" },
    { name = "buffer" },
  },
})

-- Command-Line Customizations with transparency
vim.cmd [[
  highlight CmdLine guibg=NONE guifg=#ffffff
  highlight CmdLineBorder guibg=NONE guifg=#ffffff
  highlight CmdLinePrompt guifg=#00ff00 guibg=NONE
  highlight CmdLineCursor guifg=#ffffff guibg=#ff0000
  highlight Pmenu guibg=NONE guifg=#ffffff
  highlight PmenuSel guibg=NONE guifg=#ffffff
  highlight FloatBorder guibg=NONE guifg=#ffffff
]]
