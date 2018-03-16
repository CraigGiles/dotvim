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
