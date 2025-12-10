-- ~/.config/nvim/lua/config/mason.lua
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "pyright", "clangd" },
  automatic_installation = true,
})