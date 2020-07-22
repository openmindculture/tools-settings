alias ll="ls -lG"
alias gitk="open -a sourcetree"
GIT_PROMPT_ONLY_IN_REPO=1
source ~/.bash-git-prompt/gitprompt.sh
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
ssh-add -K ~/.ssh/id_rsa

export BASH_SILENCE_DEPRECATION_WARNING=1

# node version manager
  export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Your previous /Users/ingo.steinke/.bash_profile file was backed up as /Users/ingo.steinke/.bash_profile.macports-saved_2019-06-04_at_09:11:45
##

# MacPorts Installer addition on 2019-06-04_at_09:11:45: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH:~/projects/phpcs/bin:~/bin/sw"
# Finished adapting your PATH environment variable for use with MacPorts.

# Workaround for distinct npm after brew install node
export PATH="$HOME/.npm-packages/bin:$PATH"

export PATH="$HOME/.symfony/bin:$PATH"
