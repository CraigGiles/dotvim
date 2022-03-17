
" TODO: blank line navigation in vim is done via { and } ... change these
function! GetPreviousBlankLineNumber() " @Deprecated
    let l:cursor_line_number = line('.') - 1

    while l:cursor_line_number > 0
        let l:line_value = getline(l:cursor_line_number)
        let l:trimmed_value = trim(l:line_value)

        if len(l:trimmed_value) == 0
            return l:cursor_line_number
        endif

        let l:cursor_line_number -= 1
    endwhile
    
    return 0
endfunction

function! SetCursorToPreviousBlankLine() " @Deprecated
    let line_number = GetPreviousBlankLineNumber()
    echo printf("Setting cursor to %i", line_number)
    let mylist = [bufnr(), line_number, 1, 0]
    call setpos('.', mylist)
endfunction
command! SetCursorToPreviousBlankLine call SetCursorToPreviousBlankLine()

function! GetNextBlankLineNumber()
    let l:cursor_line_number = line('.') + 1
    let l:max_lines = line('$')

    while l:cursor_line_number < l:max_lines
        let l:line_value = getline(l:cursor_line_number)
        let l:trimmed_value = trim(l:line_value)

        if len(l:trimmed_value) == 0
            return l:cursor_line_number
        endif

        let l:cursor_line_number += 1
    endwhile
    
    return l:max_lines
endfunction

function! SetCursorToNextBlankLine()
    let line_number = GetNextBlankLineNumber()
    echo printf("Setting cursor to %i", line_number)
    let mylist = [bufnr(), line_number, 1, 0]
    call setpos('.', mylist)
endfunction
command! SetCursorToNextBlankLine call SetCursorToNextBlankLine()

function! IsLeftSplit()
   let s:current_window = winnr()
   wincmd h
   if winnr() == s:current_window
     return 1
   else
     wincmd l
     return 0
   endif
endfunction
command! IsLeftSplit call IsLeftSplit()


"
" RotateSplits
" This function takes two veritcal splits and rotates them to be two
" horizontal splits and vice versa.
"
function! RotateSplits()
   " save the original position, jump to the first window
   let initial = winnr()
   exe 1 . "wincmd w"

   wincmd l
   if winnr() != 1
      " succeeded moving to the right window
      wincmd J " make it the bot window
   else
      " cannot move to the right, so we are at the top
      wincmd H " make it the left window
   endif

   " restore cursor to the initial window
   exe initial . "wincmd w"
endfunction
com! RotateSplits call RotateSplits()

"
" AskQuit
" Add a confirmation for quitting rather than just exiting the program.
" Mainly used in the flow for custom functions and NOT hooked into already
" existing functions like :q
"
function! AskQuit(msg, options, quit_option)
    if confirm(a:msg, a:options) == a:quit_option
        exit
    endif
endfunction

"
" EnsureDirExists
" When creating a file in a path that doesn't exist, this function will
" be called alerting you to the fact that the path isn't valid and you 
" will be unable to save the file. If the system is able to create the 
" directory then it will, otherwise it will ask you if you want to quit.
"
" https://sharats.me/posts/automating-the-vim-workplace/#ensure-directory-exists-before-saving
"
function! EnsureDirExists()
    let required_dir = expand("%:h")
    if !isdirectory(required_dir)
        call AskQuit("Parent directory '" . required_dir . "' doesn't exist.",
             \       "&Create it\nor &Quit?", 2)

        try
            call mkdir( required_dir, 'p' )
        catch
            call AskQuit("Can't create '" . required_dir . "'",
            \            "&Quit\nor &Continue anyway?", 1)
        endtry
    endif
endfunction
