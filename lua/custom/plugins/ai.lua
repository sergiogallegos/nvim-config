return {
  {
    "Exafunction/codeium.nvim",
    event = "VeryLazy",
    config = function()
      local ok, codeium = pcall(require, "codeium")
      if not ok then
        vim.notify("Failed to load codeium.nvim", vim.log.levels.ERROR)
        return
      end
      
      codeium.setup({
        enable_autocmd = true,
      })
      
      vim.keymap.set("i", "<C-g>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<C-;>", function()
        return vim.fn["codeium#CycleCompletions"](1)
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<C-,>", function()
        return vim.fn["codeium#CycleCompletions"](-1)
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<C-x>", function()
        return vim.fn["codeium#Clear"]()
      end, { expr = true, silent = true })
    end,
  },
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      local ok, chatgpt = pcall(require, "chatgpt")
      if not ok then
        vim.notify("Failed to load ChatGPT.nvim", vim.log.levels.ERROR)
        return
      end
      
      chatgpt.setup({
        api_key_cmd = "echo $OPENAI_API_KEY",
        yank_register = "+",
        edit_with_instructions = {
          diff = false,
          keymaps = {
            close = "<C-c>",
            accept = "<C-y>",
            toggle_diff = "<C-d>",
            toggle_settings = "<C-o>",
            cycle_windows = "<Tab>",
            use_output_as_input = "<C-i>",
          },
        },
        chat = {
          welcome_message = "Hello! I'm ChatGPT. How can I help you today?",
          loading_text = "Loading, please wait...",
          question_sign = "?",
          answer_sign = "A",
          border_left_sign = "│",
          border_right_sign = "│",
          max_line_length = 120,
          sessions_window = {
            border = {
              style = "rounded",
              text = {
                top = " Sessions ",
              },
            },
            win_options = {
              winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
            },
          },
          keymaps = {
            close = "<C-c>",
            yank_last = "<C-l>",
            yank_last_code = "<C-k>",
            scroll_up = "<C-u>",
            scroll_down = "<C-d>",
            toggle_settings = "<C-o>",
            new_session = "<C-n>",
            cycle_windows = "<Tab>",
            next_message = "<C-j>",
            prev_message = "<C-k>",
            select_session = "<Space>",
            rename_session = "r",
            delete_session = "d",
          },
        },
        popup_layout = {
          default = "center",
          center = {
            width = "80%",
            height = "80%",
          },
          right = {
            width = "30%",
            width_settings_open = "50%",
          },
        },
        popup_window = {
          border = {
            highlight = "FloatBorder",
            style = "rounded",
            text = {
              top = " ChatGPT ",
            },
          },
          win_options = {
            wrap = true,
            linebreak = true,
          },
        },
        system_window = {
          border = {
            highlight = "FloatBorder",
            style = "rounded",
            text = {
              top = " System ",
            },
          },
          win_options = {
            wrap = true,
            linebreak = true,
          },
        },
        popup_input = {
          prompt = "  ",
          border = {
            highlight = "FloatBorder",
            style = "rounded",
            text = {
              top_align = "center",
              top = " Prompt ",
            },
          },
          win_options = {
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
          },
          submit = "<C-Enter>",
          submit_n = "<Enter>",
          max_visible_lines = 20,
        },
        settings_window = {
          setting_sign = "  ",
          border = {
            style = "rounded",
            text = {
              top = " Settings ",
            },
          },
          win_options = {
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
          },
        },
        help_window = {
          border = {
            style = "rounded",
            text = {
              top = " Help ",
            },
          },
          win_options = {
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
          },
        },
        openai_params = {
          model = "gpt-3.5-turbo",
          frequency_penalty = 0,
          presence_penalty = 0,
          max_tokens = 300,
          temperature = 0,
          top_p = 1,
          n = 1,
        },
        openai_edit_params = {
          model = "code-davinci-edit-001",
          temperature = 0,
          top_p = 1,
          n = 1,
        },
        use_openai_functions_for_edits = false,
        actions_paths = {},
        show_quickfixes_list = true,
        predefined_actions = {
          {
            name = "Fix spelling",
            selection = "function",
            prompt = "Fix spelling mistakes in the following text without changing its structure or content. Only fix actual spelling errors, not style, grammar, or formatting:",
            extract = "Please extract the code from the following text without any additional explanations:",
          },
          {
            name = "Explain code",
            selection = "function",
            prompt = "Please explain how the following code works:",
            extract = "Please extract the code from the following text without any additional explanations:",
          },
          {
            name = "Optimize code",
            selection = "function",
            prompt = "Please optimize the following code and explain your changes:",
            extract = "Please extract the code from the following text without any additional explanations:",
          },
          {
            name = "Add comments",
            selection = "function",
            prompt = "Add helpful comments to the following code:",
            extract = "Please extract the code from the following text without any additional explanations:",
          },
          {
            name = "Fix code",
            selection = "function",
            prompt = "Please fix the following code and explain what was wrong:",
            extract = "Please extract the code from the following text without any additional explanations:",
          },
        },
      })
      
      vim.keymap.set("n", "<leader>ai", "<cmd>ChatGPT<cr>", { desc = "ChatGPT" })
      vim.keymap.set("n", "<leader>ae", "<cmd>ChatGPTEditWithInstruction<cr>", { desc = "Edit with instruction" })
      vim.keymap.set("v", "<leader>ae", "<cmd>ChatGPTEditWithInstruction<cr>", { desc = "Edit with instruction" })
      vim.keymap.set("n", "<leader>ag", "<cmd>ChatGPTRun<cr>", { desc = "Run ChatGPT" })
      vim.keymap.set("v", "<leader>ag", "<cmd>ChatGPTRun<cr>", { desc = "Run ChatGPT" })
    end,
  },
}
