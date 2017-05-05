" ==================================================
" Status Line
" ==================================================
set laststatus=2

set statusline+=%m                            "modified flag
set statusline+=%r                            "read only flag
set statusline=[%t]                           "tail of the filename
set statusline+=[%{&ff}]                      "file format

set statusline+=%h                            "help file flag
set statusline+=%y                            "filetype
set statusline+=%{fugitive#statusline()}      " Git branch

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Right side
set statusline+=%=                            "left/right separator
set statusline+=%c,                           "cursor column
set statusline+=%l/%L                         "cursor line/total lines
set statusline+=\ %P                          "percent through file
