" vim-scala
let g:scala_use_default_keymappings = 0

" scalapackage.vim
let g:scala_package_flat_package = 0

augroup ScalaAutoCommmands
    autocmd!
    autocmd BufWritePost *.scala RemoveTrailingWhitespace
    " code completion
    autocmd FileType scala setlocal commentstring=//\ %s
    autocmd FileType sbt setlocal commentstring=#\ %s
augroup END

