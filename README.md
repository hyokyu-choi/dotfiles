# dotfiles
My personal dotfiles setup to using many environment

## Dependencies
- Neovim 0.12+: `vim.pack`, and `vim.lsp` is available with `nvim` 0.12+
    - In my setup, neovim version is controlled with `bob`
    - `git`, `wget`, `npm`: for `vim.lsp` with `Mason`
- Fonts: `JetBrainsMono Nerd Font Mono`, and `구름 산스 코드 400` (https://goorm-sans.goorm.io/)

## Installation
Make soft link in configulation directory (`~/.config/`)
```bash
ln -s $(pwd)/ghostty $HOME/.config/
ln -s $(pwd)/fish $HOME/.config/
ln -s $(pwd)/nvim $HOME/.config/

```
