-- ~/.config/nvim/init.lua
-- lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  ui = { border = "rounded" },
})

-- Load sepearate configuration files
require("config.vim")
require("config.lsp")
require("config.cmp")
require("config.treesitter")
require("config.format")

-- 検索、ジャンプ強化：基本マッピング例（init.lua）
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help" })

-- 検索、ジャンプ強化：LSP 統合
vim.keymap.set("n", "<leader>sd", builtin.lsp_definitions, { desc = "LSP Definitions" })
vim.keymap.set("n", "<leader>sr", builtin.lsp_references, { desc = "LSP References" })
vim.keymap.set("n", "<leader>si", builtin.lsp_implementations, { desc = "LSP Implementations" })
vim.keymap.set("n", "<leader>st", builtin.lsp_type_definitions, { desc = "LSP Type Definitions" })
