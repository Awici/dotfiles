export GTK_IM_MODULE='fcitx'
export QT_IM_MODULE='fcitx'
export SDL_IM_MODULE='fcitx'
export XMODIFIERS='@im=fcitx'

# export TERM="screen"

# Path to your oh-my-zsh installation.
export ZSH="/home/le/.oh-my-zsh"
export VISUAL=nvim
export EDITOR=lvim
export PAGER=bat

export PATH=/home/le/.yarn/bin:/home/le/.local/bin:/home/le/.nimble/bin:$PATH
# alias fd='fdfind'

export FZF_DEFAULT_COMMAND="fd --type file --color=always"
export FZF_DEFAULT_OPTS="--ansi"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --preview 'bat --color=always --line-range :300 {}'" 
export NNN_PLUG='f:finder;o:fzopen;p:preview-tabbed;d:diffs;t:nmount;v:imgview;w:wall;j:autojump;u:dragdrop'
export NNN_BMS="s:$HOME/Documents/notes/;t:$HOME/Documents/notes/textbooks/;c:$HOME/Documents/code/;p:$HOME/Documents/code/projects/;D:$HOME/Downloads/"
export NNN_FIFO=/tmp/nnn.fifo
export NNN_COLORS='1234'
export NNN_FCOLORS='c1e20b02006005f7c6d6abc4'
export NNN_OPTS="uUoxEd"
export NNN_TMPFILE='/tmp/.lastd'

export VISUAL=nvim
export EDITOR="$VISUAL"

export PICO_SDK_PATH=/home/le/Documents/code/pico/libs/pico-sdk
