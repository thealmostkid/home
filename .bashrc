# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# set up the paths (PATH, MANPATH, LD_LIBRARY)
if [ -f $HOME/.bashrc_path ]; then
	. $HOME/.bashrc_path
fi

# set aliases
alias cd..="cd .."
alias cp="cp -i"
alias grep="grep -n"
alias h="history"
alias ls="ls -FaG"
alias mv="mv -i"
alias remake='make clean && make'
alias rm="rm -i"
alias ssh="ssh -X"
alias svnaction="svn status | awk '/^[^?]/ { print }'"
alias svnmodified="svn status | awk '/^M|^A|^D/ { print }'"
alias svnnew="svn status | awk '/^?/ { print }'"

#if [ -f $HOME/.aliases ]; then
#    awk '{if(index($0, "#") != 1) { system("echo " $1 "=" $2);}}' $HOME/.aliases
#fi

# store history every command
shopt -s histappend

# environment variables
export EDITOR=vim
export SVN_EDITOR=vim
export CVS_RSH=ssh

#
# to ensure the correct DISPLAY variable is used.
if [ 0 == 1 ]; then
if [ "`tty`" != "not a tty" ]; then
	if [ "`tty`" != "/dev/console" ]; then
        	if [ "x${DISPLAY}" == "x" ]; then
                	REMOTEHOST=`who am i | awk '-F(' '{print substr($2, 1, length($2)-1)}'`
                	if [ "$REMOTEHOST" != "" ]; then
                        	DISPLAY=${REMOTEHOST}:0.0
				export DISPLAY
                        	echo "Login from remote host: setting DISPLAY variable to $DISPLAY"
			else
				DISPLAY=:0.0
				export DISPLAY
				echo "Local login: setting DISPLAY to $DISPLAY"
                	fi
        	fi
	fi
fi
fi

# Source local definitions
if [ -f $HOME/.bashrc-local ]; then
	. $HOME/.bashrc-local
fi

. $HOME/.bash/git-completion.bash
# command prompt
generate_prompt () {
. $HOME/.bash/colors.bash

if [ -f $HOME/.bash/git-ps1.bash ]; then
    . $HOME/.bash/git-ps1.bash
fi

if [[ -n "$GIT_PROMPT_FUNCTIONS" ]]; then
    git_prompt
    git_status
fi

git_space=''
if [ "X${GIT_PROMPT_STATUS}" != "X" ]; then
    git_space=" "
fi
prefix="${BGreen}[\h]${Color_Off}"
prompt=" ${White}\$${Color_Off}"
if [[ ${EUID} == 0 ]]; then
    prefix="${BRed}[\h]${Color_Off}"
    prompt=" ${BRed}#${Color_Off}"
fi

directory="${directory}${BWhite}\w${Color_Off}"
if [ "X${GIT_PROMPT_DIR}" != "X" ]; then
    directory="${GIT_PROMPT_DIR}"
fi

virtualenv=''
if [[ -n "$VIRTUAL_ENV" ]]
then
    virtualenv="${White}(`basename $VIRTUAL_ENV`)${Color_Off} "
fi

if ${use_color} ; then
	echo -ne "${virtualenv}${prefix}${directory}${git_space}${GIT_PROMPT_STATUS}${prompt} "
else
    echo -ne "\[\033[01m\][\h]\w \$\[\033[00m\] "
fi
}

export PROMPT_COMMAND='PS1="$(generate_prompt)"'

#echo "$PROMPT_COMMAND"
#unset PROMPT_COMMAND
#export PROMPT_COMMAND="history -a"


# set up local environment
# do it last to override everything
if [ -f $HOME/.bashrc_local ]; then
        . $HOME/.bashrc_local
fi
