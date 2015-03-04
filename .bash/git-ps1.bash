#  Customize BASH PS1 prompt to show current GIT repository and branch.
#  by Mike Stewart - http://MediaDoneRight.com

#  SETUP CONSTANTS
#  Bunch-o-predefined colors.  Makes reading code easier than escape sequences.
#  I don't remember where I found this.  o_O

. $HOME/.bash/colors.bash

# Various variables you might want for your PS1 prompt instead
Time12h="\T"
Time12a="\@"
PathShort="\w"
PathFull="\W"
NewLine="\n"
Jobs="\j"


# This PS1 snippet was adopted from code for MAC/BSD I saw from: http://allancraig.net/index.php?option=com_content&view=article&id=108:ps1-export-command-for-git&catid=45:general&Itemid=96
# I tweaked it to work on UBUNTU 11.04 & 11.10 plus made it mo' better

__git_branch () {
    __git_ps1 "%s"
}

git_directory () {
    if [ $(__is_git()) ]; then
        echo "git!!"
    else
        echo "normal!!"
    fi
}

git_status () {
    cdup=`git rev-parse --show-cdup 2> /dev/null`
    if [ $? == 0 ]; then
        untracked=""
        space=""
        if [ "X$(git stash list | head -n 1)" != "X" ]; then
            untracked="${BYellow}\$${Color_Off}"
            space=" "
        fi
        if [ "X$(git status | grep Untracked)" != "X" ]; then
            untracked="${untracked}${BRed}%${Color_Off}"
            space=" "
        fi
        export GIT_PROMPT_STATUS="${Blue}("'$(__git_ps1 "%s")'")${space}${untracked}${Color_Off}"
    else
        export GIT_PROMPT_STATUS=
    fi
}

git_prompt () {
    cdup=`git rev-parse --show-cdup 2> /dev/null`
    if [ $? == 0 ]; then
        dir=$(cd "$cdup"; pwd)
        pdir=`pwd`

        git_status=`git status 2> /dev/null`
        match=`echo ${git_status} | grep "not staged for commit"`
        if [ $? == 0 ]; then
            color="${Red}"
        else
            color="${Green}"
        fi
        retract=${dir/$HOME/\~}
        working="${pdir/$dir/}/"

        GIT_PROMPT_DIR=${BWhite}${retract}${color}${working}${Color_Off}
    else
        GIT_PROMPT_DIR=
    fi
}

git_weird () {
GITPS1=$IBlack$Time12h$Color_Off'$(git branch &>/dev/null;\
if [ $? -eq 0 ]; then \
  echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
  if [ "$?" -eq "0" ]; then \
    # @4 - Clean repository - nothing to commit
    echo "'$Green'"$(__git_ps1 " (%s)"); \
  else \
    # @5 - Changes to working tree
    echo "'$IRed'"$(__git_ps1 " {%s}"); \
  fi) '$BYellow$PathShort$Color_Off'\$ "; \
else \
  # @2 - Prompt when not in GIT repo
  echo " '$Yellow$PathShort$Color_Off'\$ "; \
fi)'
echo $GITPS1
}

git_test () {
    echo "GIT TEST!!!"
}

export GIT_PROMPT_FUNCTIONS="git_prompt_functions"
