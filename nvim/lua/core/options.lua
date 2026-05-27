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
vim.opt.mouse = "a"

-- clipboard
if vim.env.SSH_CONNECTION or vim.env.SSH_CLIENT then
  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
      ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    },
    paste = {
      ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
      ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
    },
  }
else
  vim.g.clipboard = {
    name = "pbcopy",
    copy = {
      ["+"] = { "pbcopy", "--type", "text/plain" },
      ["*"] = { "pbcopy", "--type", "text/plain" },
    },
    paste = {
      ["+"] = { "pbpaste", "--no-newline" },
      ["*"] = { "pbpaste", "--no-newline" },
    },
    cache = {
      enabled = true,
    },
  }
end
