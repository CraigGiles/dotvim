" -------------------------------------------------
" Status Line
" =================================================
let g:currentmode={
    \ 'n'  : 'Normal',
    \ 'no' : 'N·Operator Pending ',
    \ 'v'  : 'Visual',
    \ 'V'  : 'V·Line ',
    \ '^V' : 'V·Block ',
    \ 's'  : 'Select ',
    \ 'S'  : 'S·Line ',
    \ '^S' : 'S·Block ',
    \ 'i'  : 'Insert',
    \ 'R'  : 'R ',
    \ 'Rv' : 'V·Replace ',
    \ 'c'  : 'Command ',
    \ 'cv' : 'Vim Ex ',
    \ 'ce' : 'Ex ',
    \ 'r'  : 'Prompt ',
    \ 'rm' : 'More ',
    \ 'r?' : 'Confirm ',
    \ '!'  : 'Shell ',
    \ 't'  : 'Terminal '
    \}

function! ModeCurrent() abort
    let l:modecurrent = mode()
    " use get() -> fails safely, since ^V doesn't seem to register
    " 3rd arg is used when return of mode() == 0, which is case with ^V
    " thus, ^V fails -> returns 0 -> replaced with 'V Block'
    let l:modelist = toupper(get(g:currentmode, l:modecurrent, 'V·Block '))
    let l:current_status_mode = l:modelist
    return l:current_status_mode
endfunction

set laststatus=2

set statusline=
set statusline+=[-%{ModeCurrent()}-]          "current mode
set statusline+=[%t]                          "tail of the filename
set statusline+=[%{&ff}]                      "file format

set statusline+=%h                            "help file flag
set statusline+=%y                            "filetype
set statusline+=%{fugitive#statusline()}      " Git branch

set statusline+=%#warningmsg#
" set statusline+=%{ALEGetStatusLine()}
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Right side
set statusline+=%=                            "left/right separator

set statusline+=%m                            "modified flag
set statusline+=%r                            "read only flag
set statusline+=\                             " blank space
set statusline+=\[                            "  separator
set statusline+=Buffer                    " buffer number
set statusline+=\:                            " colon separator
set statusline+=%{winnr()}                    " buffer number
set statusline+=\]                            " separator
set statusline+=\                             " blank space
set statusline+=%c,                           "cursor column
set statusline+=%l/%L                         "cursor line/total lines
set statusline+=\ %P                          "percent through file



" set statusline+=\                             " blank space
" set statusline+=\/                            " slash separator
" set statusline+=\:                            " colon separator

" set statusline+=%#warningmsg#                 " Syntastic error flag
" set statusline+=%{SyntasticStatuslineFlag()}  " Syntastic error flag
" set statusline+=%*                            " Syntastic error flag

" vim:set sw=2 sts=2 foldmethod=marker foldlevel=0:

