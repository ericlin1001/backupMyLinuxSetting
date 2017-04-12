# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
	*i*) ;;
*) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
	xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
	if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
		# We have color support; assume it's compliant with Ecma-48
		# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
		# a case would tend to support setf rather than setaf.)
		color_prompt=yes
	else
		color_prompt=
	fi
fi

if [ "$color_prompt" = yes ]; then
	#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
	#PS1='\e[0;33m${debian_chroot:+($debian_chroot)}\u@\h:\w\$ \e[m'
	PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
	xterm*|rxvt*)
		PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
		;;
	*)
		;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	#alias dir='dir --color=auto'
	#alias vdir='vdir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -atrlF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi
alias e=exit
alias version='lsb_release -a'
export LC_TIME=en_US.UTF-8
alias fkill='kill -9'
export GOPATH=$HOME/gopath
export PATH=$GOPATH:$GOPATH/bin:$PATH
#alias python=python3
alias python=ipython3


####Github-create()###################
github-create() {
	repo_name=$1
	dir_name=`basename $(pwd)`

	if [ "$repo_name" = "" ]; then
		echo "Repo name (hit enter to use '$dir_name')?"
		read repo_name
	fi

	if [ "$repo_name" = "" ]; then
		repo_name=$dir_name
	fi

	invalid_credentials=0
	username=`git config github.user`
	if [ "$username" = "" ]; then
		echo "Could not find username, run 'git config --global github.user <username>'"
		invalid_credentials=1
	fi
	pass=`git config github.pass`
	echo "using user:pass as  '$username':'$pass'"
	if [ "$pass" = "" ]; then
		echo "Could not find pass, run 'git config --global github.pass <pass>'"
		invalid_credentials=1
	fi
	if [ "$invalid_credentials" == "1" ]; then
		echo "invalid_credentials..."
		return 1
	fi

	echo -n "Creating Github repository '$repo_name' ..."
	curl -u "$username:$pass" https://api.github.com/user/repos -d "{\"name\":\"$repo_name\"}"
	echo " done."
	#echo -n "Pushing local code to remote ..."
	#git init
	#git add .
	#git commit -a -m 'first commit by script'
	git remote add origin git@github.com:$username/$repo_name.git
	git push -u origin master
	#git push -u origin master > /dev/null 2>&1
	echo " done."
}
#########end git-hub-create############

#A smart editor, that guesses the filename.
alias v="~/.bin/bvim"

#make it run in current shell
alias c=". ~/.bin/bcd"
#alias cd=". ~/.bin/cd"
alias viewtex="~/.bin/viewtex"

# A safe way to delete sth.
alias th="trash"
alias del="trash"
alias rm="echo Use 'del' to move to trash, or the full path i.e. '/bin/rm'"
alias mkcpp="cp -r ~/littlePrograms/CppTemplate/"
alias m="~/.bin/mymv"
# swap the clipboard, with ~/shared/tmp/sharedText.txt
alias s="swapClipboard ~/shared/tmp/sharedText.txt"
p(){
	cp "$1" ~/shared/tmp/sharedText.txt
}

# ShortCuts notes:
# Ctrl+Q  -> ~/restartSynergy.sh
# compress: tar -cvzf
# extract: tar -xzvf
export GEM_PATH=/home/ailab/.rbenv/versions/2.4.0/lib/ruby/gems/2.4.0
export GEM_HOME=/home/ailab/.rbenv/versions/2.4.0/lib/ruby/gems/2.4.0
export GEM_SPEC_CACHE=/home/ailab/.rbenv/versions/2.4.0/lib/ruby/gems/specs
export MY_RUBY_HOME=/home/ailab/.rbenv/versions/2.4.0/lib/ruby/gems/2.4.0
export EDITOR='vim'

export PATH=/home/ailab/.bin/:$GEM_PATH/bin:$GOPATH:$GOPATH/bin:$PATH
alias trash-restore='restore-trash'
