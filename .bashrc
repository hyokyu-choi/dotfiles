# terminal
if [ "$GHOSTTY_RESOURCES_DIR" ] || [ "$TERM" = "xterm-ghostty" ]; then
  export TERM="xterm-ghostty"
else
  export TERM="xterm-256color"
fi

# bash prompt
function build_git_prompt() {
  LAST_STATUS="$?"
  if [ "$LAST_STATUS" = "0" ]; then
    STATUS_OPEN=""
    STATUS=""
    STATUS_CLOSE=""
  else
    STATUS_OPEN=" ["
    STATUS="$LAST_STATUS"
    STATUS_CLOSE="]"
  fi
  if [ "$CMSSW_ENV_ON" ] || [ "$ROOT_ENV_ON" ]; then
    CMSSW_OPEN=" ["
    CMSSW_CLOSE="]"
    if [ "$CMSSW_ENV_ON" ] && [ "$ROOT_ENV_ON" ]; then
      CMSSW_BAR="|"
    else
      CMSSW_BAR=""
    fi
  else
    CMSSW_OPEN=""
    CMSSW_CLOSE=""
    CMSSW_BAR=""
  fi

  if ! git rev-parse --is-inside-work-tree &>/dev/null; then
    GIT_OPEN=""
    GIT_BRANCH=""
    GIT_BAR=""
    GIT_MOD_STATUS=""
    GIT_CLEAN_STATUS=""
    GIT_CLOSE=""
    return
  fi

  local branch
  branch=$(git branch --show-current 2>/dev/null)
  [ -z "$branch" ] && branch=$(git rev-parse --short HEAD 2>/dev/null)

  local file_count
  file_count=$(git status --porcelain 2>/dev/null | wc -l | tr -d ' ')

  GIT_OPEN=" ("
  GIT_BRANCH="$branch"
  GIT_BAR="|"
  
  if [ "$file_count" -gt 0 ]; then
    GIT_MOD_STATUS="+${file_count}"
    GIT_CLEAN_STATUS=""
  else
    GIT_MOD_STATUS=""
    GIT_CLEAN_STATUS="✔"
  fi
  GIT_CLOSE=")"
}

PROMPT_COMMAND="build_git_prompt; $PROMPT_COMMAND"

PS1='\e[33m[@\h] \e[32m\w\e[0m${CMSSW_OPEN}\e[36m${CMSSW_ENV_ON}\e[0m${CMSSW_BAR}\e[36m${ROOT_ENV_ON}\e[0m${CMSSW_CLOSE}\e[0m${GIT_OPEN}\e[35m${GIT_BRANCH}\e[0m${GIT_BAR}\e[34m${GIT_MOD_STATUS}\e[32m${GIT_CLEAN_STATUS}\e[0m${GIT_CLOSE}\e[31m${STATUS_OPEN}${STATUS}${STATUS_CLOSE}\n\e[32m❯\e[0m '

# bash editor
export EDITOR="nvim"

# user alias
alias ls="lsd"
alias ll="lsd -lh"

# path
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/opt/bin:$PATH"

# neovim path
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
export PATH="$HOME/opt/luajit/bin:$PATH"
export PATH="$HOME/opt/lua@5.1/bin:$PATH"
export PATH="$HOME/opt/luarocks/bin:$PATH"
export VIMPYTHON="$HOME/micromamba/envs/gamma-py312/bin/python3"

# cmssw / root setup
function cmsset() {
  if [ "$CMSSW_ENV_ON" = "CMSSW" ]; then
    echo -e "\e[36m[CMSSW Error!]\e[0m CMSSW env is already loaded!"
    return 0
  fi

  source /cvmfs/cms.cern.ch/cmsset_default.sh \
  && export CMSSW_ENV_ON="CMSSW" \
  && echo -e "\e36m[CMSSW]\e0m CMSSW env loaded!"
}

function rootset() {
  if [ "$ROOT_ENV_ON" = "ROOT" ]; then
    echo -e "\e[36m[ROOT Error!]\e[0m ROOT env is already loaded!"
    return 0
  fi

  source /cvmfs/sft.cern.ch/lcg/views/LCG_105/x86_64-el9-gcc13-dbg/bin/thisroot.sh \
  && export ROOT_ENV_ON="ROOT" \
  && echo -e "\e[36m[ROOT]\e[0m ROOT env loaded!"
}

# setup yazi
export PATH="$PATH:$HOME/opt/yazi/bin"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# nvm setting
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Cargo setting
. "$HOME/.cargo/env"

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'micromamba shell init' !!
export MAMBA_EXE="$HOME/.local/bin/micromamba";
export MAMBA_ROOT_PREFIX="$HOME/micromamba";
__mamba_setup="$("$MAMBA_EXE" shell hook --shell bash --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
  eval "$__mamba_setup"
else
  alias micromamba="$MAMBA_EXE"  # Fallback on help from micromamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<
