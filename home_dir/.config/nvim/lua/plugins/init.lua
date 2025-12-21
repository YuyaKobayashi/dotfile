-- ~/.config/nvim/lua/plugins/init.lua
return {
  -- LSP 基盤
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim", config = true },
  { "williamboman/mason-lspconfig.nvim" },

  -- 補完
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "saadparwaiz1/cmp_luasnip" },
  { "L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp" },

  -- Treesitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- UI/ナビゲーション
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  { "nvim-lualine/lualine.nvim" },
  { "folke/trouble.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "folke/which-key.nvim" },

  -- LSP UI 改善（任意）
  { "nvimdev/lspsaga.nvim" },
  { "j-hui/fidget.nvim", tag = "legacy" },

  -- コードフォーマット
  { "stevearc/conform.nvim" },

  -- Git
  { "sindrets/diffview.nvim" },
  { "NeogitOrg/neogit" },
  { "tpope/vim-fugitive" },

  -- Signature Help
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    config = function()
      require("lsp_signature").setup({
        bind = true,
        hint_enable = false,           -- 仮想テキストヒントをオフ（好みで）
        floating_window = true,        -- ポップアップで表示
        floating_window_above_cur_line = true,
        floating_window_off_x = 0,
        floating_window_off_y = 0,
        transparency = 0,
        max_height = 12,
        max_width = 80,
        zindex = 50,
        -- 括弧やカンマで自動トリガ
        toggle_key = "<M-s>",          -- 必要ならトグル
      })
    end,
  },

  -- Github Co-piilot
  { "github/copilot.vim" },
}
