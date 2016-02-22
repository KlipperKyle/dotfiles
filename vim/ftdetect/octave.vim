if has("autocmd")
    au BufRead,BufNewFile *.m               set filetype=octave
    au BufRead,BufNewFile *.oct             set filetype=octave
endif
