local is_windows = vim.loop.os_uname().sysname == "Windows_NT"

return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false,
  opts = {
    -- Any additional options can go here
  },
  build = is_windows
    and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
    or "make",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
    "zbirenbaum/copilot.lua",
    {
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          use_absolute_path = is_windows,  -- Required for Windows only
        },
      },
    },
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}