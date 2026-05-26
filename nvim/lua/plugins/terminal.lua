require("toggleterm").setup({
  open_mapping = [[<c-\>]],
  direction = 'tab',   -- 'vertical' | 'horizontal' | 'tab' | 'float'
  highlights = {
    Normal = {
      link = "Normal",
    },
    NormalFloat = {
      link = "Normal",
    },
    FloatBorder = {
      link = "FloatBorder",
    },
  },
})
