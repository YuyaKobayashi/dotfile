-- ~/.config/nvim/lua/config/format.lua
require("conform").setup({
  formatters_by_ft = {
    python = { "black", "ruff_fix", "ruff_format" },
    cpp = { "clang-format" },
    c = { "clang-format" },
  },
})

-- 保存時に自動フォーマット
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = { "*.py", "*.c", "*.cpp", "*.hpp" },
--   callback = function() require("conform").format({ async = false, lsp_fallback = true }) end,
-- })
