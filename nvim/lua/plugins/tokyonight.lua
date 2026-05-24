vim.pack.add({"https://github.com/folke/tokyonight.nvim.git"})

local status, tokyonight = pcall(require, "tokyonight")
if not status then return end
tokyonight.setup({})

vim.cmd[[colorscheme tokyonight]]
