augroup local_ftplugin_help
    au!

    " Change the directory when entering a buffer
    " TODO: change this to launch Help in "other window" rather than the
    " current window
    au BufWinEnter,BufEnter *.txt wincmd _
augroup END
