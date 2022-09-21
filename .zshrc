# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/relyt/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="kafeitu"

DISABLE_UNTRACKED_FILES_DIRTY="true"
DISABLE_MAGIC_FUNCTIONS="true"
HIST_STAMPS="mm/dd/yyyy"

plugins=(
git
zsh-autosuggestions
zsh-syntax-highlighting
tmux
)

# Start tmux on startup
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_DEFAULT_SESSION_NAME="main"

source $ZSH/oh-my-zsh.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# Manually setting language environment
export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Check for aliases in .zsh_aliases
if [ -f ~/.zsh_aliases  ]; then
	source ~/.zsh_aliases
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Set vi mode 
set -o vi

# Set GOPATH
export GOPATH=$HOME/Coding/Go/

# Adding Ruby (brew version) to $PATH
if [ -d "/usr/local/opt/ruby/bin"  ]; then
	export PATH=/usr/local/opt/ruby/bin:$PATH
	export PATH=/`gem environment gemdir`/bin:$PATH 
fi

# Enable Elixir history
export ERL_AFLAGS="-kernel shell_history enabled"
