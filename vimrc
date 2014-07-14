" My vimrc
"
" Stuff that I liked was taken from other vimrc's, most notably Bram's
" vimrc_example.vim and Judd Vinet's vimrc.

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50      " keep 50 lines of command line history
set ruler           " show the cursor position all the time
set showcmd         " display incomplete commands
set incsearch       " do incremental searching
set laststatus=2    " Always show the filename
set timeoutlen=500  " Don't wait long for keymaps

" Line wrapping options
set linebreak       " enable line wrap
set nojoinspaces    " use single spaces between sentences
set showbreak=»\    " Lead-in char
set sidescroll=10   " When disabling wrap, show context of 10 chars

" When using tab completion for filenames, only complete as far
" as the match goes
set wildmode=longest,list
set wildmenu

" Default tabbing settings
set expandtab
set shiftwidth=4
set tabstop=4

" Always use Unix-style line-endings
if (&modifiable)
    set fileformat=unix
endif

" Don't use Ex mode, use Q for formatting
noremap Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Make CTRL-BS delete the previous word when in insert mode
inoremap <C-BS> <C-W>

" Shortcut to wrap a paragraph quickly
noremap <leader>w gwap

" Redraw
noremap <leader>r :redraw!<CR>

" Toggle visible tab characters
noremap <leader>l :set list!<CR>

" Toggle line numbers
noremap <leader>n :set number!<CR>

" Toggle paste mode
noremap <leader>p :setlocal paste!<CR>

" Easy movement between windows
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" Don't remove indentation when adding '#' comments
inoremap # X#

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    colorscheme torte
    set hlsearch
    nmap <leader>q :nohlsearch<CR>
endif

" GUI specific options
if has("gui_running")
    set guifont=Monospace\ 9
    "set guifont=Lucida_Console:h9:cANSI
    set guioptions-=T                       " Hide the toolbar
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    filetype plugin indent on

    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
    au!

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " Also don't do it when the mark is in the first line, that is the default
    " position when opening a file.
    autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif

    augroup END

    " Per-file options
    autocmd BufNewFile,BufRead *.md   setlocal spell tw=72

    " Cheap/simple spreadsheets in Vim
    autocmd BufNewFile,BufRead *.tsv  setlocal ts=16 noet number
    " Columnar movements
    autocmd BufNewFile,BufRead *.tsv  map L f	W
    autocmd BufNewFile,BufRead *.tsv  map H F	B

    " Show tabs and line numbers when coding
    autocmd BufNewFile,BufRead *.pl     setlocal number
    autocmd BufNewFile,BufRead *.pm     setlocal number
    autocmd BufNewFile,BufRead *.py     setlocal number
    autocmd BufNewFile,BufRead *.php    setlocal number
    autocmd BufNewFile,BufRead *.js     setlocal number
    autocmd BufNewFile,BufRead *.c      setlocal number
    autocmd BufNewFile,BufRead *.h      setlocal number
    autocmd BufNewFile,BufRead *.cpp    setlocal number
    autocmd BufNewFile,BufRead *.hpp    setlocal number
    autocmd BufNewFile,BufRead *.lua    setlocal number
    autocmd BufNewFile,BufRead *.html   setlocal number
    autocmd BufNewFile,BufRead *.css    setlocal number
    autocmd BufNewFile,BufRead *.coffee setlocal number

else

    set autoindent        " always set autoindenting on

endif " has("autocmd")

" Enable folding if it is available
if has("folding")
    let g:tex_fold_enabled=0
    let perl_fold=1
    let sh_fold_enabled=1
    let perl_extended_vars=1
    let perl_sync_dist=250
    set foldmethod=syntax
endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif

" Toggle on diff mode for the current buffer.
noremap <leader>d :call DiffToggle()<CR>
function! DiffToggle()
    if &diff
        diffoff
    else
        diffthis
    end
endfunction
