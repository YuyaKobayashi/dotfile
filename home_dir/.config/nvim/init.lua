-- ~/.config/nvim/init.lua
-- init.lua の先頭付近で設定（マップ定義より前に）
vim.g.mapleader = " "     -- スペースを <leader> に
require("config.vim")

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
require("config.lsp")
require("config.cmp")
require("config.treesitter")
require("config.format")
require("config.telescope")

