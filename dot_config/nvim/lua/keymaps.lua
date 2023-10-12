-- mapleader
vim.g.mapleader = " "

-- コロンとセミコロン入れ替え
vim.keymap.set("n", ":", ";", { noremap = true, silent = true })
vim.keymap.set("n", ";", ":", { noremap = true, silent = true })
vim.keymap.set("i", ":", ";", { noremap = true, silent = true })
vim.keymap.set("i", ";", ":", { noremap = true, silent = true })

-- バッファ切り替え
vim.keymap.set("n", "<leader>n", "<CMD>bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>p", "<CMD>bprevious<CR>", { noremap = true, silent = true })

-- ハイライト解除
vim.keymap.set("n", "<ESC><ESC>", "<CMD>nohlsearch<CR>", { noremap = true, silent = true })
