require("core")

vim.pack.add({
  { src = "https://github.com/folke/tokyonight.nvim.git" },
})

vim.cmd [[colorscheme tokyonight]]

require("plugins")
