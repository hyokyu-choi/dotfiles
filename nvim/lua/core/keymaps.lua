-- <leader>
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- terminal
vim.keymap.set("t", "C-[", "<esc>", { desc = "Terminal mode esc" })
vim.keymap.set("t", "<esc>", "<C-\\><C-n>", { desc = "Terminal mode esc" })

-- indent
vim.keymap.set("v", "<", "<gv", { desc = "Indent decrease" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent increase" })

-- buffer, tab
vim.keymap.set("n", "<C-b>h", ":bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<C-b>l", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<C-t>h", ":tabprevious<CR>", { desc = "Previous tab" })
vim.keymap.set("n", "<C-t>l", ":tabnext<CR>", { desc = "Next tab" })
vim.keymap.set("n", "<Left>", ":bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<Right>", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<Up>", ":tabprevious<CR>", { desc = "Previous tab" })
vim.keymap.set("n", "<Down>", ":tabnext<CR>", { desc = "Next tab" })
