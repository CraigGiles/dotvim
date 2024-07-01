"source ~/.vim/fixme_colors.vim

augroup local_ftplugin_cpp
    au!
    " Change the directory when entering a buffer
    au! BufWinEnter,BufEnter *.h,*.cpp :lcd %:h

    " TODO:L set comment string
augroup END

nmap <F12> :FSHere<CR>

"function! FSOtherWindow()
"    let number_of_windows = winnr('$') 
"    if number_of_windows == 1
"        FSHere
"    else
"        " TODO: this doens't work like i had hoped.
"        " OtherWindowVertical
"        " FSHere
"        " OtherWindowVertical
"    endif
"endfunction

" if has('gui_macvim')
"     nmap <D-F12> :call FSOtherWindow()<CR>
" else
"     nmap <C-F12> :call FSOtherWindow()<CR>
" endif

" We want to keep comments within an 80 column limit, but not code.
" These two options give us that
setlocal formatoptions=crq
setlocal textwidth=80
setlocal commentstring=//\ %s

" This makes doxygen comments work the same as regular comments
setlocal comments-=://
setlocal comments+=:///,://

" Indents are 4 spaces
setlocal shiftwidth=4
setlocal tabstop=4
setlocal softtabstop=4

" And they really are spaces, *not* tabs
setlocal expandtab

" Setup for indending
setlocal nosmartindent
setlocal autoindent
setlocal cinkeys-=0#
setlocal cinoptions+=^
setlocal cinoptions+=g0
setlocal cinoptions+=:0
setlocal cinoptions+=(0
