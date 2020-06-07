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
endfunction

function! GetQuickfixWindowNumber()
    let qf_number = filter(range(1, winnr('$')), 'getwinvar(v:val, "&ft") == "qf"')
    let result = get(qf_number, 0, bufnr("%"))
    return result
endfunction
command! QuickfixWindowNumber call GetQuickfixWindowNumber()

function! MakeWithoutAsking()
    :wa
    :AsyncRun -program=make

    let l:number_of_windows = winnr('$') 
    let l:quickfix_window_number = GetQuickfixWindowNumber()

    if l:number_of_windows == 1
        :vs
        :call OpenQuickfixHere()
    else
        " 
        " If one of the windows is a quickfix window, do nothing.. it will
        " auto refresh.
        "
        " If neither window is quickfix, goto 'OtherWindow' and open there.
        "
        if l:quickfix_window_number == bufnr("%")
            echo "OPening quickfix in toher window"
            OtherWindowVertical
            call OpenQuickfixHere()
            OtherWindowVertical
        endif

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

function GuiVimRunFullscreen()
    " TODO store the previous columns and lines, restore later
    if has('gui_macvim')
        set columns=1000
        set lines=1000
    endif
endfunction
command! RunFullScreen call GuiVimRunFullscreen()


" vim:set sw=2 sts=2 foldmethod=marker foldlevel=0:
