local builtin = require("telescope.builtin")

-- 検索、ジャンプ強化：基本マッピング例
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help" })

-- 検索、ジャンプ強化：LSP 統合
vim.keymap.set("n", "<leader>jd", builtin.lsp_definitions, { desc = "LSP Definitions" })
vim.keymap.set("n", "<leader>jr", builtin.lsp_references, { desc = "LSP References" })
vim.keymap.set("n", "<leader>ji", builtin.lsp_implementations, { desc = "LSP Implementations" })
vim.keymap.set("n", "<leader>jt", builtin.lsp_type_definitions, { desc = "LSP Type Definitions" })
