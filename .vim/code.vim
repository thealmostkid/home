"coding environment
:set tabstop=2 wrapmargin=0 textwidth=0 backspace=1
:set nodigraph
:set shiftwidth=2
" (0 fixes the placement of function parameters if they span lines
" :0 doesn't indent the labels for case statements.
" g0 fixes the placement of public, private, and protected.
" t0 left justifies the return type declaration.
" c2 Should fix the problem with block comments
:set cinoptions=(0:0g0t0c0
:set cindent
":set smartindent
":set noinfercase
:set infercase
":set ruler
:set showmatch
:inoremap { {<C-m>}O
":map g d$a{p}O

"This should highlight cpp stuff
"I think this is broken
"syn region cComment matchgroup=cPreCondit start="^#if[ \t]*0" end="^#endif" end="^#else" keepend 


":so $HOME/.vim/c-op.vim
