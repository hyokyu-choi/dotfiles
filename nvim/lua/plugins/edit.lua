require("nvim-autopairs").setup({
  map_cr = true,
  check_ts = true,
  ts_config = {
    lua = { 'string' },
    javascript = { 'template_string' },
    java = false,
  }
})

require("mini.surround").setup({
  highlight_duration = 1500,
  mappings = {
    add = 'sa',        -- Add surrounding in Normal and Visual modes
    delete = 'sd',     -- Delete surrounding
    find = 'sf',       -- Find surrounding (to the right)
    find_left = 'sF',  -- Find surrounding (to the left)
    highlight = 'sh',  -- Highlight surroundwng
    replace = 'sr',    -- Replace surroundwng

    suffix_last = 'l', -- Suffix to search with "prev" method
    suffix_next = 'n', -- Suffix to search with "next" method
  },
  respect_selection_type = true,
})

require("ibl").setup()
require("todo-comments").setup()

vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })
