augroup CPlusPlusAutoCommmands
    autocmd!
    autocmd BufWritePost *.cpp,*.h,*.hpp RemoveTrailingWhitespace
    autocmd FileType c,cpp,h,hpp setlocal commentstring=\/\/\ %s
    autocmd FileType make setlocal commentstring=#\ %s
augroup END

