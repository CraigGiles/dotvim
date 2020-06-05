" NOTE(craig): for function debugging
" See `:scriptnames` for a list of all scripts, in evaluation order.

function! GetPreviousBlankLineNumber()
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

function! SetCursorToPreviousBlankLine()
    let line_number = GetPreviousBlankLineNumber()
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

"
" OtherWindowVerticalSplit
" When operating in a two split space (which is my norm) calling :OtherWindow
" will move the cursor to the inactive vertical split.
"
function! OtherWindowVerticalSplit()
   let s:current_window = winnr()
   wincmd h
   if winnr() == s:current_window
       wincmd l
   endif
endfunction
command! OtherWindowVertical call OtherWindowVerticalSplit()

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
" RemoveTrailingWhitespace
" Removing all trailing whitespace from the file
"
function! RemoveTrailingWhitespaces()
  :%s/\s\+$//e
endfunction
command! RemoveTrailingWhitespace call RemoveTrailingWhitespaces()

function! AskQuit(msg, options, quit_option)
    if confirm(a:msg, a:options) == a:quit_option
        exit
    endif
endfunction

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

" When the quickfix buffer is opened, make sure that we're on only one window.
function! OpenQuickfixHere() abort
  copen
  let bufn = bufnr('%')
  let winn = winnr()
  wincmd p
  execute 'b'.bufn
  execute winn.'close'
endfunction

function OpenQuickFixList()
    let l:number_of_windows = winnr('$') 

    if l:number_of_windows == 1
        :vs
        call OpenQuickfixHere()
        wincmd p
    else
        OtherWindowVertical
        call OpenQuickfixHere()
    endif

    " if l:number_of_windows == 1
    "     " vert call OpenQuickfixHere()
    "     wincmd o
    "     vert cwindow
    "     wincmd p
    "     wincmd =
    " else
    "     OtherWindowVertical
    "     call OpenQuickfixHere()
    " endif

endfunction

function! MakeWithoutAsking()
    :wa
    :cclose
    :AsyncRun -program=make

    let l:number_of_windows = winnr('$') 

    if l:number_of_windows == 1
        :vs
        call OpenQuickfixHere()
        :OtherWindowVertical
    else
        OtherWindowVertical
        call OpenQuickfixHere()
        :OtherWindowVertical
    endif
endfunction
command! MakeWithoutAsking call MakeWithoutAsking()

function! SearchCodebase()
    let l:number_of_windows = winnr('$') 
    if l:number_of_windows == 1
        :Ag
        :RotateSplits
    else
        let initial = winnr()
        :Ag
        :cclose
        exe initial . "wincmd w"
        OtherWindowVertical
        call OpenQuickfixHere()
    endif
endfunction

" vim:set sw=2 sts=2 foldmethod=marker foldlevel=0:
