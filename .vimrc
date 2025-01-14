"                              ___           ___           ___
"     ___        ___          /__/\         /  /\         /  /\
"    /__/\      /  /\        |  |::\       /  /::\       /  /:/
"    \  \:\    /  /:/        |  |:|:\     /  /:/\:\     /  /:/
"     \  \:\  /__/::\      __|__|:|\:\   /  /:/~/:/    /  /:/  ___
" ___  \__\:\ \__\/\:\__  /__/::::| \:\ /__/:/ /:/___ /__/:/  /  /\
"/__/\ |  |:|    \  \:\/\ \  \:\~~\__\/ \  \:\/:::::/ \  \:\ /  /:/
"\  \:\|  |:|     \__\::/  \  \:\        \  \::/~~~~   \  \:\  /:/
" \  \:\__|:|     /__/:/    \  \:\        \  \:\        \  \:\/:/
"  \__\::::/      \__\/      \  \:\        \  \:\        \  \::/
"      ~~~~                   \__\/         \__\/         \__\/
"
"maintainer:	Lucca Augusto

"============================
"      Basic Settings
"============================
	execute pathogen#infect()
	execute pathogen#helptags()
	filetype plugin indent on
	syntax on
	set smartindent
	set breakindent
	set encoding=utf-8

	colorscheme wal

	"get rid of trailling spaces
	autocmd BufWritePre * %s/\s\+$//e

	"Split panels in a more natural way
	set splitbelow
	set splitright

	"Configure tab size
	set tabstop=4
	set shiftwidth=4
	"set expandtab "indent with spaces

	"Custom indentation rules
	autocmd FileType html setlocal shiftwidth=4 tabstop=4 expandtab
	autocmd FileType php setlocal shiftwidth=4 tabstop=4 expandtab

	"Get trailing characters on tab to view indents more easily
	"set list
	"set listchars=tab:\.\

	"Some more personal settings

	"center line when entering insert mode
	"autocmd InsertEnter * norm zz

	set number
	set relativenumber    "sets the line numbers relative to the current line
	set nocompatible	  "no behaving like vi
	set autoindent        "auto indentation when enter is pressed
	set showmode          "shows vim current mode
	set wildmenu          "auto completion when ctrl+n is pressed
	set wildmode=longest,list,full
	set incsearch         "searches as you type each letter
	"set lazyredraw        "only redraws the screen when really needed
	set foldenable        "allows code folding when zf is pressed. zd to unfold
	"set noundofile       "do not save an undo file
	set undofile
	set undodir=/tmp      "Save undo files in tmp directory
	"set nobackup         "do not save a backup file
	set backup
	set backupdir=/tmp    "Save backup files in tmp directory
	set hlsearch
	set ignorecase "search is case insensitive
	set smartcase "case sensitive search in case the is an uppercase character in search
	"set cursorline
	"set cursorcolumn
	highlight CursorLine cterm=underline gui=underline ctermbg=none ctermfg=none

	"Remap j and k so i can navigate on lines that break
	nnoremap j gj
	nnoremap k gk
	vnoremap j gj
	vnoremap k gk

"==============================
"        StatusLine
"=============================
set laststatus=2
set statusline=
set statusline+=%8*\ [%n]                 " buffernr
set statusline+=%8*\ %<%F\ %m\ %r\ %w\ 	  " File+path
set statusline+=%#warningmsg#
set statusline+=%*
set statusline+=%9*\ %=                   " Space
set statusline+=%8*\ %y\                  " FileType
set statusline+=%8*\ %-3(%{FileSize()}%)  " File size
set statusline +=%1*%=%5l%*				  "current line
set statusline +=%2*/%L%*				  "total lines

hi User1 ctermfg=007 ctermbg=003
hi User2 ctermfg=007 ctermbg=003
hi User3 ctermfg=007 ctermbg=003
hi User4 ctermfg=007 ctermbg=003
hi User5 ctermfg=007 ctermbg=003
hi User7 ctermfg=007 ctermbg=003
hi User8 ctermfg=007 ctermbg=003
hi User9 ctermfg=007 ctermbg=003


"===============================
"Mappings to make things quicker
"===============================
	map <C-s> :w<CR>
	nmap <C-s> :w<CR>
	nmap <leader>w :wq<CR>
	nnoremap <leader>c :close<CR>
	nnoremap <leader>o :q<CR>
	nnoremap <leader>L :30Lex<CR>

	"Spell checking
	nnoremap <leader>p :set spell spelllang=pt_br<CR>
	nnoremap <leader>e :set spell spelllang=en_us<CR>

	"Splits
	nnoremap <leader>v :vsplit<space>
	nnoremap <leader>s :split<space>

	"Tabs
	nnoremap <leader>t :tabedit<space>
	"Move faster between tabs
	nnoremap <leader>j :tabnext<CR>
	nnoremap <leader>k :tabprevious<CR>

	nnoremap <leader>f :filetype detect<CR>

	"Allow to copy and paste from the system register
	vnoremap <C-y> "*y :let @+=@*<CR>
	nnoremap <C-p> "+p

	"Save a key press on changing windows
	nnoremap <C-h> <C-w>h
	nnoremap <C-j> <C-w>j
	nnoremap <C-k> <C-w>k
	nnoremap <C-l> <C-w>l

	"Faster resizing
	nnoremap <leader>A 5<C-w>>
	nnoremap <leader>S 5<C-w><


"update bindings when sxhkd config is updated
	autocmd BufWritePost sxhkdrc killall sxhkd; setsid sxhkd &
"recompile suckless programs after editing
	autocmd BufWritePost dwm.c !sudo make clean; sudo make; sudo make install
	"autocmd BufWritePost config.def.h !sudo make clean;sudo make; sudo make install
	autocmd BufWritePost st.c !sudo make clean; sudo make; sudo make install

"toogle hl CursorLine
	nnoremap <leader>hl :set cursorline<CR>
	nnoremap <leader>nhl :set nocursorline<CR>

"===============================
"SNIPPETS
"===============================

	"insert tags like this <++> for faster navigation
	"when inserting brackets, etc.
	"Snippets
	nnoremap <space><space> :nohlsearch<CR>
	"inoremap <leader><Space> <Esc>/<++><CR>"_c4l
	inoremap jf <Esc>/<++><CR>"_c4l
	inoremap { {<++>}<++><Esc>3h?<++><CR>4xi
	inoremap {<CR> {<CR><++><CR>}<++><Esc>4h?<++><CR>4xa
	inoremap ( (<++>)<++><Esc>3h?<++><CR>4xi
	inoremap () ()
	inoremap [ [<++>]<++><Esc>3h?<++><CR>4xi
	"inoremap " "<++>"<++><Esc>3h?<++><CR>4xi
	"inoremap ' '<++>'<++><Esc>3h?<++><CR>4xi
	au FileType sh inoremap [ [ <++> ]<++><Esc>3h?<++><CR>4xi
	au FileType c inoremap /* /*<++> */<++><Esc>3h?<++><CR>4xi
	au FileType c inoremap /*<CR> /*<CR><++><CR> */<++><Esc>4h?<++><CR>4xa
	au FileType h inoremap /* /*<++> */<++><Esc>3h?<++><CR>4xi
	au FileType h inoremap /*<CR> /*<CR><++><CR> */<++><Esc>4h?<++><CR>4xa
	au FileType tex nnoremap <leader>li o<CR>\begin{figure}[ht]<CR>\centering<CR>\includegraphics[width=.5\textwidth]{<++>}<CR>\caption{<++>}<CR>\label{<++>}<CR>\end{figure}<Esc>4k/<++><CR>"_c4l

	"Some compile commands for these file types
	au FileType tex map <buffer> <F10> :w<CR>:!pdflatex<Space>%<CR>
	au FileType java map <buffer> <F10> :w<CR>:!javac<Space>%<CR>
	au FileType java map <buffer> <F7> :!java<Space>'%:t:r'<CR>
	au FileType c map <buffer> <F10> :w<CR>:!gcc<Space>-o<Space>expand('%:t:r').out<Space>expand('%:t')<CR>

"====================================
"			Functions
"===================================
function! BeginC()
	normal! i#include <stdlib.h>
	normal! o#include <stdio.h>
	normal! o
	normal! oint main()
	normal! o{
	normal! o
	normal! oreturn 0;
	normal! o}
	normal! 2k
endfunction

function! BeginJ()
	normal! ipublic class <++> {
	normal! o
	normal! opublic static void main(String[] args) {
	normal! o
	normal! o}
	normal! o}
endfunction

function! BeginMS()
	normal! i.TL
	normal! o<++>
	normal! o.AU
	normal! oLucca Augusto (lucca@luccaaugusto.xyz)
endfunction

function! BeginTex()
	normal! i\documentclass[12pt]{article}
	normal! o\usepackage[utf8]{inputenc}
	normal! o\usepackage{graphicx,url}
	normal! o\title{<++>}
	normal! o\author{Lucca Augusto\\(lucca@luccaaugusto.xyz)}
	normal! o\date{} %empty date so it doesn't show
	normal! o\begin{document}
	normal! o\maketitle
	normal! o
	normal! o\end{document}
	normal! 6k
	normal! $ci{
endfunction

" Find out current buffer's size and output it.
function! FileSize()
  let bytes = getfsize(expand('%:p'))
  if (bytes >= 1024)
    let kbytes = bytes / 1024
  endif
  if (exists('kbytes') && kbytes >= 1000)
    let mbytes = kbytes / 1000
  endif
  if bytes <= 0
    return '0'
  endif
  if (exists('mbytes'))
    return mbytes . 'MB '
  elseif (exists('kbytes'))
    return kbytes . 'KB '
  else
    return bytes . 'B '
  endif
endfunction
