return {
  {
    "SmiteshP/nvim-navic",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      local ok, navic = pcall(require, "nvim-navic")
      if not ok then
        vim.notify("Failed to load nvim-navic", vim.log.levels.ERROR)
        return
      end
      
      navic.setup({
        icons = {
          File = "󰈙 ",
          Module = "󰆧 ",
          Namespace = "󰌗 ",
          Package = "󰏗 ",
          Class = "󰌗 ",
          Method = "󰆧 ",
          Property = "󰜢 ",
          Field = "󰜢 ",
          Constructor = "󰆧 ",
          Enum = "󰕘 ",
          Interface = "󰒋 ",
          Function = "󰊕 ",
          Variable = "󰀫 ",
          Constant = "󰏿 ",
          String = "󰉿 ",
          Number = "󰎠 ",
          Boolean = "󰨙 ",
          Array = "󰅪 ",
          Object = "󰅩 ",
          Key = "󰌋 ",
          Null = "󰟢 ",
          EnumMember = "󰕘 ",
          Struct = "󰌗 ",
          Event = "󰆧 ",
          Operator = "󰆕 ",
          TypeParameter = "󰊄 ",
        },
        highlight = true,
        separator = " > ",
        depth_limit = 0,
        depth_limit_indicator = "..",
        safe_output = true,
        lsp = {
          auto_attach = true,
          preference = nil,
        },
        click = false,
      })
    end,
  },
}
