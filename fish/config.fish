# fish setup
set fish_vi_key_bindings yes
set -gx VISUAL nvim
set -gx EDITOR $HOME/.local/share/bob/nvim-bin/nvim
set -gx SUDO_EDITOR $HOME/.local/share/bob/nvim-bin/nvim

# user alias
alias ls "lsd"
alias wifi "impala"

# path
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.local/share/bob/nvim-bin
fish_add_path $HOME/.cargo/bin

# SSH Agent
if not set -q SSH_AUTH_SOCK
  eval (ssh-agent -c) > /dev/null
end

# yazi
function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	command yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
		builtin cd -- "$cwd"
	end
	command rm -f -- "$tmp"
end

# Hyprland
if status is-login
    if test (tty) = /dev/tty1
        exec start-hyprland
    end
end
