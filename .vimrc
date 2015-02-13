" determine compatibility with vi
set nocompatible

" special command to clear search buffer
:command C let @/=""

" Manage your 'runtimepath' with ease. In practical terms, pathogen.vim makes
" it super easy to install plugins and runtime files in their own private
" directories.
" include plugins under the ~/.vim/bundle directory
if exists("g:loaded_pathogen")
    execute pathogen#infect()
endif
syntax on
filetype plugin indent on

set history=1000
set undolevels=1000
set visualbell
set noerrorbells
set tabstop=4
set expandtab
set autoindent
set textwidth=80
set backspace=1
set term=builtin_ansi
set nohlsearch
set vb
" set title " change the terminal's title

" Auto-complete uses the built-in Omni completion plugin
"set omnifunc=syntaxcomplete#Complete



" Settings for local vimrc plugin
let g:localvimrc_ask=0



" Set up style for different file types
so $HOME/.vim/color.vim
" File-type detection to load appropiate style file
" only do this part when compiled w/ support for autocommands
if has("autocmd")

augroup cprog
" remove all cprog autocommands
au!

au BufNewFile,BufRead *.tex so $HOME/.vim/tex.vim set noautoindent
au BufNewFile,BufRead snd.*,.letter,.followup,.article,.article.[0-9]\+,pico.[0-9]\+,mutt*[0-9] so $HOME/.vim/mail.vim
au BufNewFile,BufRead *.java so $HOME/.vim/java.vim
"au BufNewFile, BufRead *.scm so $HOME/.vim/scheme.vim
au BufNewFile,BufRead *.cpp,*.H,*.C,*.pc so $HOME/.vim/cpp.vim
au BufNewFile,BufRead *.h so $HOME/.vim/header.vim
au BufNewFile,BufRead Makefile so $HOME/.vim/make.vim
"au BufLeave Makefile so $HOME/.vim/make-exit.vim
au BufNewFile,BufRead *.ml so $HOME/.vim/ml.vim
au BufNewFile,BufRead *.mal,*.sal so $HOME/.vim/spim.vim
au BufNewFile,BufRead *.nqc so $HOME/.vim/nqc.vim
au BufNewFile,BufRead *.perl,*.pl,*.cgi so $HOME/.vim/perl.vim
au BufNewFile,BufRead *.py so $HOME/.vim/python.vim
au BufNewFile,BufRead *.sh so $HOME/.vim/sh.vim

"when starting to edit a file:
" for c & c++ files set formatting of comments and set c-indenting on.
" for other files switch it off.
" don't change the order; it's important that the line with * comes first.
autocmd FileType * set formatoptions=tcql nocindent comments&
autocmd FileType c,cpp  set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://
augroup END

au FileType java so $HOME/.vim/java.vim
au FileType scheme so $HOME/.vim/scheme.vim
au FileType c,cpp so $HOME/.vim/cpp.vim
au FileType make so $HOME/.vim/make.vim
au FileType tex so $HOME/.vim/tex.vim
au FileType nqc so $HOME/.vim/nqc.vim
au FileType nc so $HOME/.vim/cpp.vim
au FileType html so $HOME/.vim/html.vim
au FileType perl so $HOME/.vim/perl.vim
au FileType python so $HOME/.vim/python.vim
au FileType sh,bash so $HOME/.vim/sh.vim

endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" hex editing
"" ex command for toggling hex mode - define mapping if desired
"command -bar Hexmode call ToggleHex()
"
"" helper function to toggle hex mode
"function ToggleHex()
"  " hex mode should be considered a read-only operation
"  " save values for modified and read-only for restoration later,
"  " and clear the read-only flag for now
"  let l:modified=&mod
"  let l:oldreadonly=&readonly
"  let &readonly=0
"  let l:oldmodifiable=&modifiable
"  let &modifiable=1
"  if !exists("b:editHex") || !b:editHex
"    " save old options
"    let b:oldft=&ft
"    let b:oldbin=&bin
"    " set new options
"    setlocal binary " make sure it overrides any textwidth, etc.
"    let &ft="xxd"
"    " set status
"    let b:editHex=1
"    " switch to hex editor
"    %!xxd
"  else
"    " restore old options
"    let &ft=b:oldft
"    if !b:oldbin
"      setlocal nobinary
"    endif
"    " set status
"    let b:editHex=0
"    " return to normal editing
"    %!xxd -r
"  endif
"  " restore values for modified and read only state
"  let &mod=l:modified
"  let &readonly=l:oldreadonly
"  let &modifiable=l:oldmodifiable
"endfunction
"
"augroup Binary
"  au!
"  au BufReadPre  *.bin let &bin=1
"  au BufReadPost *.bin if &bin | %!xxd
"  au BufReadPost *.bin set ft=xxd | endif
"  au BufWritePre *.bin if &bin | %!xxd -r
"  au BufWritePre *.bin endif
"  au BufWritePost *.bin if &bin | %!xxd
"  au BufWritePost *.bin set nomod | endif
"augroup END
"
"" autocmds to automatically enter hex mode and handle file writes properly
"if has("autocmd")
"  " vim -b : edit binary using xxd-format!
"  augroup Binary
"    au!
"
"    " set binary option for all binary files before reading them
"    au BufReadPre *.bin,*.hex setlocal binary
"
"    " if on a fresh read the buffer variable is already set, it's wrong
"    au BufReadPost *
"          \ if exists('b:editHex') && b:editHex |
"          \   let b:editHex = 0 |
"          \ endif
"
"    " convert to hex on startup for binary files automatically
"    au BufReadPost *
"          \ if &binary | Hexmode | endif
"
"    " When the text is freed, the next time the buffer is made active it will
"    " re-read the text and thus not match the correct mode, we will need to
"    " convert it again if the buffer is again loaded.
"    au BufUnload *
"          \ if getbufvar(expand("<afile>"), 'editHex') == 1 |
"          \   call setbufvar(expand("<afile>"), 'editHex', 0) |
"          \ endif
"
"    " before writing a file when editing in hex mode, convert back to non-hex
"    au BufWritePre *
"          \ if exists("b:editHex") && b:editHex && &binary |
"          \  let oldro=&ro | let &ro=0 |
"          \  let oldma=&ma | let &ma=1 |
"          \  silent exe "%!xxd -r" |
"          \  let &ma=oldma | let &ro=oldro |
"          \  unlet oldma | unlet oldro |
"          \ endif
"
"    " after writing a binary file, if we're in hex mode, restore hex mode
"    au BufWritePost *
"          \ if exists("b:editHex") && b:editHex && &binary |
"          \  let oldro=&ro | let &ro=0 |
"          \  let oldma=&ma | let &ma=1 |
"          \  silent exe "%!xxd" |
"          \  exe "set nomod" |
"          \  let &ma=oldma | let &ro=oldro |
"          \  unlet oldma | unlet oldro |
"          \ endif
"  augroup END
"endif
"" end hex editing
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
