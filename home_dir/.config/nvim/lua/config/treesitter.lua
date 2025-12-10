-- ~/.config/nvim/lua/config/treesitter.lua
require("nvim-treesitter.configs").setup({
  ensure_installed = { "python", "cpp", "c", "lua", "json", "yaml", "markdown" },
  highlight = { enable = true },
  indent = { enable = true },
})