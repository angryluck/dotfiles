-- Plugins that don't require separate files, for one reason or another
return {
  "Treeniks/isabelle-syn.nvim",

  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = {},
  },

  {
    "windwp/nvim-autopairs",
    opts = { disable_filetype = { "tex", "copilot-chat" } },
  },

  {
    "catppuccin/nvim",
    config = function()
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },

  "LnL7/vim-nix",

  -- Dunno if this is needed, hmm
  -- "nvim-dap"

  -- neodev alternative
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },

  "kmonad/kmonad-vim",

  "tpope/vim-repeat",

  -- {
  --   "ggandor/leap.nvim",
  --   config = function()
  --     require("leap").create_default_mappings()
  --     require("leap.user").set_repeat_keys("<enter>", "<backspace>")
  --     vim.keymap.set("n", "s", "<Plug>(leap)")
  --     vim.keymap.set("n", "S", "<Plug>(leap-from-window)")
  --     vim.keymap.set({ "x", "o" }, "s", "<Plug>(leap-forward)")
  --     vim.keymap.set({ "x", "o" }, "S", "<Plug>(leap-backward)")
  --   end,
  -- },

  {
    "stevearc/oil.nvim",
    opts = {
      delete_to_trash = true,
      keymaps = {
        ["q"] = { "actions.close", mode = "n" },
      },
    },
  },

  -- "plenary-nvim"

  {
    -- NOTE: Possible commands: NOTE, FIX, TODO, HACK, WARN, PERF & TEST.
    "folke/todo-comments.nvim",
    config = function()
      require("todo-comments").setup()
      vim.keymap.set("n", "]t", function()
        require("todo-comments").jump_next({
          keywords = { "TODO", "HACK", "WARN", "FIX", "PERF" },
        })
      end, { desc = "Next error/warning todo comment" })
      vim.keymap.set("n", "[t", function()
        require("todo-comments").jump_prev({
          keywords = { "TODO", "HACK", "WARN", "FIX", "PERF" },
        })
      end, { desc = "Next error/warning todo comment" })
    end,
  },

  -- { "mrcjkb/haskell-tools.nvim", version = "^4", lazy = false },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  "nvim-lua/plenary.nvim",
  "nvim-tree/nvim-web-devicons",

  {
    "norcalli/nvim-colorizer.lua",
    opts = {
      user_default_options = { names = false },
    },
    config = function(_, opts)
      require("colorizer").setup(opts)
    end,
  },

  "BeneCollyridam/futhark-vim",

  {
    "abecodes/tabout.nvim",
    opts = {
      tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
      backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
      act_as_tab = true, -- shift content if tab out is not possible
      act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
      default_tab = "<C-t>", -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
      default_shift_tab = "<C-d>", -- reverse shift default action,
      enable_backwards = true, -- well ...
      completion = false, -- if the tabkey is used in a completion pum
      tabouts = {
        { open = "'", close = "'" },
        { open = '"', close = '"' },
        { open = "`", close = "`" },
        { open = "(", close = ")" },
        { open = "[", close = "]" },
        { open = "{", close = "}" },
      },
      ignore_beginning = false, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
      exclude = {}, -- tabout will ignore these filetypes
    },
  },

  -- {
  --   'akinsho/toggleterm.nvim',
  --   version = "*",
  --   opts = {
  --     open_mapping = "<leader>tt",
  --     direction = "float",
  --     close_on_exit = false,
  --     insert_mappings = false,
  --     float_opts = {
  --       border = "curved",
  --     },
  --   },
  --   config = function(_, opts)
  --     require("toggleterm").setup(opts)
  --     local Terminal = require('toggleterm.terminal').Terminal
  --     local lazygit  = Terminal:new({ cmd = "lazygit", hidden = true })
  --     function _lazygit_toggle()
  --       lazygit:toggle()
  --     end
  --
  --     vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
  --   end
  -- }

  {
    "numToStr/FTerm.nvim",
    opts = {
      border = "rounded",
    },
    config = function(_, opts)
      local fterm = require("FTerm")
      fterm.setup(opts)
      vim.keymap.set("n", "<leader>tt", fterm.toggle)
      vim.keymap.set("t", "<leader>tt", fterm.toggle)
      -- vim.keymap.set("n", "<leader>g", function()
      --   fterm.run("lazygit")
      -- end)
    end,
  },

  {
    -- nvim v0.8.0
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
      {
        "<leader>sl",
        function()
          require("telescope").extensions.lazygit.lazygit()
        end,
        desc = "[S]earch [L]azyGit",
      },
    },
    config = function()
      require("telescope").load_extension("lazygit")
    end,
  },
}
