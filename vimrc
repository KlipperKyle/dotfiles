set nocompatible

"" Defaults
""""""""""""""
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim

"" Indentation
"""""""""""""""""
set autoindent
set nocindent
set smartindent

set expandtab
set shiftwidth=4
set tabstop=4

set linebreak
"set showbreak=...\ 

"" GUI
"""""""""
set nonu
colorscheme torte
set guifont=Monospace\ 9
"set guifont=Lucida_Console:h9:cANSI

" Hide Toolbar
set guioptions-=T

set hlsearch
set noincsearch

set laststatus=2

"" Behavior
""""""""""""""
" File type overrides
au BufRead,BufNewFile *.md  set filetype=markdown

" Always use Unix-style line-endings
if (&modifiable)
    set fileformat=unix
endif

" Selection Behavior
set selectmode=
set mousemodel=extend
set keymodel=startsel
set selection=inclusive
set virtualedit=

" Make CTRL-A (Select All) use visual mode
noremap     <C-A>  ggVG
inoremap    <C-A>  <C-O>gg<C-O>VG
cnoremap    <C-A>  <C-C>ggVG
onoremap    <C-A>  <C-C>ggVG
snoremap    <C-A>  <C-C>ggVG
xnoremap    <C-A>  <C-C>ggVG

" Unmap some keys back to vim defaults
unmap <C-Y>
iunmap <C-Y>
iunmap <C-A>
iunmap <C-U>
vunmap <BS>
vunmap <C-Insert>
unmap <S-Insert>
cunmap <S-Insert>
iunmap <S-Insert>

" Make S-Insert work correctly
vnoremap    <S-Del>     "*x
vnoremap    <C-Insert>  "*y
map         <S-Insert>	"*gP
cmap        <S-Insert>  <C-R>*
imap        <S-Insert>  <C-R>*
vmap        <S-Insert>  <C-R>*

" Make window management easier
" Move the cursor
map     <C-A-L> <C-W>l
map     <C-A-H> <C-W>h
map     <C-A-J> <C-W>j
map     <C-A-K> <C-W>k
" Other
map     <C-A-E>     <C-W>=
map     <C-A-R>     <C-W>r
map     <C-A-S-R>   <C-W>R
map     <C-A-S>     <C-W>s
map     <C-A-V>     <C-W>v
map     <C-A-N>     <C-W>n
map     <C-A-Q>     <C-W>q
map     <C-A-C>     <C-W>c
map     <C-A-O>     <C-W>o

" Move more logically on wrapped lines
"noremap j   gj
"noremap k   gk
"noremap 0   g0
"noremap ^   g^
"noremap $   g$
"noremap gj  j
"noremap gk  k
"noremap g0  0
"noremap g^  ^
"noremap g$  $

" Make CTRL-BS delete the previous word when in insert mode
inoremap <C-BS> <C-W>

" Backup Files
set nobackup       "no backup files
"set nowritebackup  "only in case you don't want a backup file while editing
"set noswapfile     "no swap files
set noundofile
"set undodir=~/.vim/undo/
set hidden

set wildmode=longest,list
set whichwrap-=<,>,[,]
set nojoinspaces

let g:tex_fold_enabled=0
set foldmethod=syntax

noremap gp gwap

"" Backend
"""""""""""""
"set ttyfast
