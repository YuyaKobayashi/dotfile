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
  { "folke/lsp-status.nvim" },
  { "folke/which-key.nvim" },

  -- LSP UI 改善（任意）
  { "nvimdev/lspsaga.nvim" },
  { "j-hui/fidget.nvim", tag = "legacy" },
  { "folke/lsp-status.nvim" },

  -- コードフォーマット
  { "stevearc/conform.nvim" },
}