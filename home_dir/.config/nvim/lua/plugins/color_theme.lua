return {
  -- 好みのものを1つ選んで有効化してください

  -- Tokyonight
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     style = "night", -- "storm" | "night" | "moon" | "day"
  --     transparent = false,
  --     styles = { comments = { italic = true } },
  --   },
  --   config = function(_, opts)
  --     require("tokyonight").setup(opts)
  --     vim.cmd.colorscheme("tokyonight")
  --   end,
  -- },

  -- Gruvbox
  -- {
  --   "ellisonleao/gruvbox.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     contrast = "medium",
  --     italic = { comments = true },
  --   },
  --   config = function(_, opts)
  --     require("gruvbox").setup(opts)
  --     vim.cmd.colorscheme("gruvbox")
  --   end,
  -- },

  -- Catppuccin
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     flavour = "mocha",
  --     integrations = { treesitter = true, lsp_trouble = true, which_key = true },
  --   },
  --   config = function(_, opts)
  --     require("catppuccin").setup(opts)
  --     vim.cmd.colorscheme("catppuccin")
  --   end,
  -- },

  -- One Dark
  -- {
  --   "navarasu/onedark.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --       style = "warm",
  --   },
  --   config = function(_, opts)
  --     require("onedark").setup(opts)
  --     vim.cmd.colorscheme("onedark")
  --   end,
  -- },

  -- Nord
  {
    "shaunsingh/nord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("nord")
    end,
  },
}
