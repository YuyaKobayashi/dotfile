-- 行番号
vim.opt.number = true

-- インデントとタブ幅
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.expandtab = true

-- コマンド表示
vim.opt.showcmd = true

-- 検索設定
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.wrapscan = false

-- マウス
vim.opt.mouse = "a"

-- TeX の conceal を無効化
vim.g.tex_conceal = ""

-- バックスペース挙動
-- Vimの 'backspace' は複数フラグをカンマで繋ぐ文字列
vim.opt.backspace = { "indent", "eol", "start" } -- set backspace=2 と bs=start の統合

-- クリップボード
if vim.fn.has("nvim") == 1 then
  vim.opt.clipboard:append("unnamedplus")
else
  vim.opt.clipboard = { "unnamed", "autoselect" }
end

-- カーソル行ハイライト
vim.opt.cursorline = true

-- nf（numberformat）
vim.opt.nf = "" -- set nf=""

-- 互換モードを無効化
vim.opt.compatible = false

-- スワップファイルを作らない
vim.opt.swapfile = false

-- gf で拡張子を補完
vim.opt.suffixesadd:append(".rc")

-- ワイルドメニュー/補完モード
vim.opt.wildmenu = true
vim.opt.wildmode = { "list:longest", "list" }

-- 非表示バッファを許可（未保存でも他バッファへ移動可能）
vim.opt.hidden = true
