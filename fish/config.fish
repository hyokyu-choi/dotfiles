fish_vi_key_bindings

# ssh
eval (ssh-agent -c)

# yazi
function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	command yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
		builtin cd -- "$cwd"
	end
	command rm -f -- "$tmp"
end

# hyprland
if status is-login
    if test (tty) = /dev/tty1
        exec start-hyprland
    end
end

