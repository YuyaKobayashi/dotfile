-- ~/.config/nvim/lua/config/lsp.lua
local cmp_nvim_lsp = require("cmp_nvim_lsp")

-- 共通 capabilities（補完連携）
local capabilities = cmp_nvim_lsp.default_capabilities()

-- 共通 on_attach（キー割り当て）
local on_attach = function(_, bufnr)
  local map = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
  end

  -- 定義/参照/実装/型定義
  map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
  map("n", "gr", vim.lsp.buf.references, "References")
  map("n", "gi", vim.lsp.buf.implementation, "Go to Implementation")
  map("n", "gt", vim.lsp.buf.type_definition, "Type Definition")

  -- シンボル/コードアクション/リネーム
  map("n", "K", vim.lsp.buf.hover, "Hover")
  map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
  map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")

  -- 診断
  map("n", "[d", vim.diagnostic.goto_prev, "Prev Diagnostic")
  map("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")
  map("n", "<leader>e", vim.diagnostic.open_float, "Line Diagnostics")
  map("n", "<leader>q", vim.diagnostic.setloclist, "Diagnostics to Loclist")
end

-- Python: pyright
vim.lsp.config["pyright"] = {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = { python = { analysis = { typeCheckingMode = "basic" } } },
}
vim.lsp.enable("pyright")

-- C++: clangd
vim.lsp.config["clangd"] = {
  capabilities = capabilities,
  on_attach = on_attach,
  cmd = { "clangd", "--background-index", "--clang-tidy" },
}
vim.lsp.enable("clangd")