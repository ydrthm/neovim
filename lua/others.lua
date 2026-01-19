return {
  {
    "j-hui/fidget.nvim",
    opts = {},
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true,
    opts = {},
  },
  -- {
  --   "windwp/nvim-ts-autotag", --html tag
  --   config = function()
  --     require("nvim-ts-autotag").setup()
  --   end,
  -- },
  {
    "kylechui/nvim-surround",
    version = "^3.0.0",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
  {
    "mbbill/undotree",
    lazy = true,          -- load only when called
    cmd = "UndotreeToggle", -- lazy-load when this command is used
    config = function()
      vim.g.undotree_SetFocusWhenToggle = 1
      vim.g.undotree_HighlightChangedText = 1
      -- vim.g.undotree_TreeNodeShape = "●"
    end,
    vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "UndotreeToggle" }),
  },
  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    config = function()
      require("colorizer").setup({
        filetypes = {
          "lua",
          "css",
          html = { mode = "foreground" },
        },
        user_defaultoions = { mode = "background" },
      })
    end,
  },
  {
    "stevearc/dressing.nvim",
    opts = {},
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "solarized_dark",
        },
      })
    end,
  },
  -- { "akinsho/toggleterm.nvim", version = "*", config = true },
}
