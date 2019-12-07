function! WordProcessorMode()
  Goyo 80
  setlocal formatoptions=1
  setlocal noexpandtab
  map j gj
  map k gk
  setlocal spell spelllang=en_us
  set thesaurus+= "$HOME/.vim/thesaurus/thesaurus.txt"
  set complete+=s
  set formatprg=par
  set nonu
  setlocal wrap
  setlocal linebreak
endfunction
com! WP call WordProcessorMode()
com! WordProcessor call WordProcessorMode()

function! RemoveTrailingWhitespaces()
  :%s/\s\+$//e
endfunction
command! RemoveTrailingWhitespace call RemoveTrailingWhitespaces()

" NOTE: for function debugging
" See `:scriptnames` for a list of all scripts, in evaluation order.
function! AskQuit(msg, options, quit_option)
    if confirm(a:msg, a:options) == a:quit_option
        exit
    endif
endfunction

function! EnsureDirExists()
    let required_dir = expand("%:h")
    if !isdirectory(required_dir)
        call AskQuit("Parent directory '" . required_dir . "' doesn't exist.",
             \       "&Create it\nor &Quit?", 2)

        try
            call mkdir( required_dir, 'p' )
        catch
            call AskQuit("Can't create '" . required_dir . "'",
            \            "&Quit\nor &Continue anyway?", 1)
        endtry
    endif
endfunction

augroup AutoMkdir
    autocmd!
    autocmd  BufNewFile  *  :call EnsureDirExists()
augroup END

" vim:set sw=2 sts=2 foldmethod=marker foldlevel=0:
