-- indent
vim.opt.showtabline = 2
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 0
vim.opt.smartindent = false
vim.opt.wrap = false

-- ui
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ruler = false
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 100
vim.opt.winborder = "single"

-- backup
vim.opt.backup = false
vim.opt.swapfile = false

vim.opt.fileencodings:append("utf-8,euc-kr")

-- io
vim.opt.autoread = true
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamed'
