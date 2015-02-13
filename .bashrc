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

# Put your fun stuff here.
alias ls="ls -Fa"
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias h="history"
alias cd..="cd .."
alias grep="grep -n"
alias ssh="ssh -X"

# load other aliases
if [ -f $HOME/.aliases ]; then
	. $HOME/.aliases
fi


# store history every command
shopt -s histappend

# environment variables
export EDITOR=vim
export SVN_EDITOR=vim
export CVS_RSH=ssh

export SCRIPTNODE=natthompson@hadoopnn-009.sjc1.sendgrid.net

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


PS1='\[\033[01m\][\h]\w \$\[\033[00m\] '
if ${use_color} ; then
	if [[ ${EUID} == 0 ]]; then
		PS1='\[\033[01;31m\][\h]\[\033[00m\]\[\033[01m\]\w \$\[\033[00m\] '
	else
		PS1='\[\033[01;32m\][\h]\[\033[00m\]\[\033[01m\]\w \$\[\033[00m\] '
	fi
fi
#echo "$PROMPT_COMMAND"
unset PROMPT_COMMAND
export PROMPT_COMMAND="history -a"