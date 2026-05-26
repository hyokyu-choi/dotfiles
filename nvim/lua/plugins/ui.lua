require("mini.icons").setup()
require("oil").setup({
  columns = {
    "icon",
    -- "permissions",
    -- "size",
    -- "mtime",
  },
  float = {
    border = "rounded",
  },
  confirmation = {
    border = "rounded",
  },
  progress = {
    border = "rounded",
    minimized_border = "none",
  },
  ssh = {
    border = "rounded",
  },
  keymaps_help = {
    border = "rounded",
  },
})

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

--[[
 mini.pick has some errors with actions-preview
]]

local telescope = require("telescope")
--local default_color = "tokyonight"
telescope.setup({
  defaults = {
    preview = { treesitter = true },
    color_devicons = true,
    sorting_strategy = "ascending",
    borderchars = {
      "", -- top
      "", -- right
      "", -- bottom
      "", -- left
      "", -- top-left
      "", -- top-right
      "", -- bottom-right
      "", -- bottom-left
    },
    path_displays = { "smart" },
    layout_config = {
      height = 100,
      width = 400,
      prompt_position = "top",
      preview_cutoff = 40,
    }
  }
})
telescope.load_extension("ui-select")

require("actions-preview").setup {
  backend = { "telescope" },
  extensions = { "env" },
  telescope = vim.tbl_extend(
    "force",
    require("telescope.themes").get_dropdown(), {}
  )
}

--vim.keymap.set("n", "<leader>f", ":Pick files<CR>")
--vim.keymap.set("n", "<leader>h", ":Pick help<CR>")

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>f", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>h", builtin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "<leader>d", builtin.diagnostics, { desc = "Telescope diagnostics" })
vim.keymap.set("n", "<leader>k", builtin.keymaps, { desc = "Telescope keymaps" })
vim.keymap.set("n", "<leader>gf", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>gi", builtin.git_files, { desc = "Telescope git files" })
vim.keymap.set("n", "<leader>gs", builtin.grep_string, { desc = "Telescope grep string" })
vim.keymap.set("n", "<leader>lr", builtin.lsp_references, { desc = "Telescope lsp references" })
vim.keymap.set("n", "<leader>ca", require("actions-preview").code_actions, { desc = "Code actions" })
