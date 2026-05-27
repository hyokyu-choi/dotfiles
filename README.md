# dotfiles
My personal dotfiles setup to using many environment

## Dependencies
- Neovim 0.12+: `vim.pack`, and `vim.lsp` is available with `nvim` 0.12+
    - In my setup, neovim version is controlled with `bob`
    - `git`, `wget`, `npm`: for `vim.lsp` with `Mason`

## Installation
Make soft link in configulation directory (`~/.config/`)
```bash
ln -s $(pwd)/nvim $HOME/.config/
```
