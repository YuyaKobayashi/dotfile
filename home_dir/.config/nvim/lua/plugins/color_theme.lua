return {
  -- 好みのものを1つ選んで有効化してください

  -- vscode.vim
  {
      "Mofiqul/vscode.nvim",
      lazy = false,
      priority = 1000,
      opts = {
          transparent = false,
          italic_comments = true,
            color_overrides = {
            },
            group_overrides = {
              -- this supports the same valuse as `:h highlight-group`
              ["@comment"] = { fg = "#A50000", bold = true },  -- Purple comments
              ["@spell"] = { fg = "#A50000", bold = true },  -- Purple comments
              ["@variable"] = { fg = "#FFFFFF", bold = true },
              ["@variable.member"] = { fg = "#FFFFFF", bold = true },
              ["@variable.builtin"] = { fg = "#000099", bold = true },
            }
      },
      config = function(_, opts)
          require("vscode").setup(opts)
          vim.cmd.colorscheme("vscode")
      end,
  },
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

  --Catppuccin
  --{
  --  "catppuccin/nvim",
  --  name = "catppuccin",
  --  lazy = false,
  --  priority = 1000,
  --  opts = {
  --    flavour = "mocha",
  --    integrations = { treesitter = true, lsp_trouble = true, which_key = true },
  --  },
  --  config = function(_, opts)
  --    require("catppuccin").setup(opts)
  --    vim.cmd.colorscheme("catppuccin")
  --  end,
  --},

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
  --{
  --  "shaunsingh/nord.nvim",
  --  lazy = false,
  --  priority = 1000,
  --  config = function()
  --    vim.cmd.colorscheme("nord")
  --  end,
  --},
}
