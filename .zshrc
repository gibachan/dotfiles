# Prompt
#export PS1="%n@%m %1~ %# " # default prompt
export PS1="%1~ %# "

# Alias
alias g='cd $(ghq root)/$(ghq list | peco)'
alias clean='rm -rf ~/Library/Developer/Xcode/DerivedData'

# Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# zsh-autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# asdf
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# nest(https://github.com/mtj0928/nest)
export PATH="$PATH:~/.nest/bin"

# mint
export PATH="$PATH:~/.mint/bin"
export PATH="$HOME/.local/bin:$PATH"
