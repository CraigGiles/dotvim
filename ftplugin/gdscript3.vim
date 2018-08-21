setlocal tabstop=4
setlocal shiftwidth=4
setlocal autoindent
setlocal noexpandtab
setlocal formatoptions=croql

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.gd match BadWhitespace /^\t\+/

" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.gd match BadWhitespace /\s\+$/

au BufWrite *.gd RemoveTrailingWhitespace
