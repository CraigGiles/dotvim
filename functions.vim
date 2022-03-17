" NOTE(craig): for function debugging
" See `:scriptnames` for a list of all scripts, in evaluation order.

"
" RemoveTrailingWhitespace
" Removing all trailing whitespace from the file
"
function! RemoveTrailingWhitespaces()
  :%s/\s\+$//e
endfunction
command! RemoveTrailingWhitespace call RemoveTrailingWhitespaces()

function! MakeWithoutAsking()
  " save all unsaved files
  :wa

  " Setup the build commands from the ft plugin. If the commands do not exist
  " provide sensible defaults
  echo "g:build_parameters: " . g:build_parameters
  echo "g:build_file_name : " . g:build_file_name

  let s:build_parameters = get(g:, 'build_parameters', "")
  let s:build_file_name = get(g:, 'build_file_name', "%")
  let s:compile_command = get(g:, 'compile_command', "make")

  " find the build file in the project by searching up the directory structure
  let s:current_directory = expand("%:p") 
  let s:build_file_full_path = findfile(g:build_file_name, ".;~")
  let s:build_file_directory = fnamemodify(s:build_file_full_path, ':p:h')

  " CD into the working directory and issue the compile command
  " TODO: maybe don't CD, but instead just execute the command based on the
  " directory
  let s:working_directory = getcwd()
  exec 'cd' s:build_file_directory
  let s:compile_string = 'make ' . s:build_parameters . ' ' . s:build_file_name
  exec s:compile_string
  OpenQuickfixInOtherWindow
endfunction
command! MakeWithoutAsking call MakeWithoutAsking()

function! SearchCodebase(query)
  let l:number_of_windows = winnr('$') 
  if l:number_of_windows == 1
      execute "Ag " . a:query
      RotateSplits
  else
      let initial = winnr()
      execute "Ag " . a:query
      :cclose
      execute initial . "wincmd w"
      OtherWindowVertical
      call OpenQuickfixHere()
  endif
endfunction

function! FullScreenHelp(query)
    OtherWindowVertical
    execute "help " . a:query
    wincmd _
endfunction
command! -nargs=1 Help call FullScreenHelp(<f-args>)

" vim:set sw=2 sts=2 foldmethod=marker foldlevel=0:
