" vim-scala
let g:scala_use_default_keymappings = 0

" scalapackage.vim
let g:scala_package_flat_package = 0

augroup ScalaAutoCommmands
    autocmd!
    autocmd BufWritePost *.scala RemoveTrailingWhitespace
augroup END

" We want to keep comments within an 80 column limit, but not code.
" These two options give us that
setlocal formatoptions=crq
setlocal textwidth=80
setlocal commentstring=//\ %s
