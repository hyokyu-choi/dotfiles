vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "lua",
    "c",
    "cpp",
    "latex",
    "python",
    "vim",
    "yaml",
    "bash",
    "rust",
    "toml",
    "markdown",
  },
  callback = function() vim.treesitter.start() end,
})
