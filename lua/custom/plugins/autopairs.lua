return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    enabled = false,  -- Disable autopairs completely
    config = function()
      -- Autopairs is disabled - no automatic bracket completion
      -- You can manually type all brackets, parentheses, quotes, etc.
    end,
  },
}
