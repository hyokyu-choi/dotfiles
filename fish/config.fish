# fish setup
set -g fish_key_bindings fish_vi_key_bindings
set -gx VISUAL nvim
set -gx EDITOR $HOME/.local/share/bob/nvim-bin/nvim
set -gx SUDO_EDITOR $HOME/.local/share/bob/nvim-bin/nvim

# user alias
alias ls "lsd"
alias obsidian "cd $HOME/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/ingB3"

# path
fish_add_path (brew --prefix)/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.local/share/bob/nvim-bin
fish_add_path $HOME/opt/lua@5.1/bin
fish_add_path $HOME/Library/Python/3.9/bin

# environment variables
set -gx VIMPYTHON $HOME/.conda/envs/root_env/bin/python3
set -gx VIMCTAGS (brew --prefix)/bin/ctags
set -gx DYLD_FALLBACK_LIBRARY_PATH (brew --prefix)/lib $DYLD_FALLBACK_LIBRARY_PATH

# yazi
function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	command yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
		builtin cd -- "$cwd"
	end
	command rm -f -- "$tmp"
end

# Cargo environment
source "$HOME/.cargo/env.fish"

# Added by `rbenv init`
status --is-interactive; and rbenv init - --no-rehash fish | source

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/miniforge3/bin/conda
    eval /opt/miniforge3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/opt/miniforge3/etc/fish/conf.d/conda.fish"
        . "/opt/miniforge3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/opt/miniforge3/bin" $PATH
    end
end

if test -f "/opt/miniforge3/etc/fish/conf.d/mamba.fish"
    source "/opt/miniforge3/etc/fish/conf.d/mamba.fish"
end
# <<< conda initialize <<<
