#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
export NODE_ENV=development
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"

PS1="\n \[\033[01;34m\]\w\[\033[00m\] \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\] \n\[\033[1;35m\] ツ\[\033[0m\] "


if [ -e ~/.bashrc.aliases ] ; then
   source ~/.bashrc.aliases
fi

BROWSER=/usr/bin/google-chrome-stable
EDITOR=/usr/bin/nano
