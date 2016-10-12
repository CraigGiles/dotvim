function! ScalaInsertPackage()
    silent! execute "normal! gg0"
    r! echo %:p
    silent! s/.*src\/main\/scala//
    silent! s/.*src\/test\/scala//
    s/\.scala//
    s/\//./g
    silent! execute "normal! 0xipackage\<Space>\<esc>kdd"
    silent! execute "normal! $daw$xo\<ESC>"
endfunction

command! Spackage call ScalaInsertPackage()

