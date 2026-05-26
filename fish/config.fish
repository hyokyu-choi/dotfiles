# fish setup
set fish_vi_key_bindings yes

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

alias wifi="impala"
