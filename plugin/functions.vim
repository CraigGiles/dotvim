" NOTE(craig): for function debugging
" See `:scriptnames` for a list of all scripts, in evaluation order.

"
"     --- Fixme Highlights---
" -----------------------------------------------------------------------
function! FixmeModes()
    :highlight FixMeTodo      guibg=NONE guifg=#cd2626 gui=underline,BOLD
    :highlight FixMeNote      guibg=NONE guifg=#6495ed gui=underline,BOLD
    :highlight FixMeImportant guibg=NONE guifg=#ffff00 gui=underline,BOLD
    :highlight FixMeCleanup   guibg=NONE guifg=#ffff00 gui=underline,BOLD
    :highlight FixMeSpeed     guibg=NONE guifg=#ffff00 gui=underline,BOLD
    :highlight FixMeNext      guibg=NONE guifg=#6495ed gui=underline,BOLD
    :highlight FixMeProg      guibg=NONE guifg=#ffff00 gui=underline,BOLD
    :highlight FixMeHold      guibg=NONE guifg=#6495ed gui=underline,BOLD
    :highlight FixMeDone      guibg=NONE guifg=#00ff00 gui=underline,BOLD

    :let _ = matchadd("FixMeTodo", "TODO")
    :let _ = matchadd("FixMeNote", "NOTE")
    :let _ = matchadd("FixMeImportant", "IMPORTANT")
    :let _ = matchadd("FixMeCleanup", "CLEANUP")
    :let _ = matchadd("FixMeSpeed", "SPEED")
    :let _ = matchadd("FixMeNext", "NEXT")
    :let _ = matchadd("FixMeProg", "PROG")
    :let _ = matchadd("FixMeHold", "HOLD")
    :let _ = matchadd("FixMeDone", "DONE")
endfunction
command! FixmeModes call FixmeModes()

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

" " When the quickfix buffer is opened, make sure that we're on only one window.
" function! OpenQuickfixHere() abort
"   " Store the current buffer so we can re-claim it when we close
"     let g:old_bufn = bufnr('%')
"     let g:old_winn = winnr()

"     copen
"     let bufn = bufnr('%')
"     let winn = winnr()
"     wincmd p
"     execute 'b'.bufn
"     execute winn.'close'
" endfunction

" function OpenQuickFixList()
"     let l:number_of_windows = winnr('$') 

"     if l:number_of_windows == 1
"         :vs
"         call OpenQuickfixHere()
"         wincmd p
"     else
"         OtherWindowVertical
"         call OpenQuickfixHere()
"     endif
" endfunction

" function! GetQuickfixWindowNumber()
"     let qf_number = filter(range(1, winnr('$')), 'getwinvar(v:val, "&ft") == "qf"')
"     let result = get(qf_number, 0, bufnr("%"))
"     return result
" endfunction
" command! QuickfixWindowNumber call GetQuickfixWindowNumber()

function! TestMe(filename, path)
    " return true if file is found
    " return false if not
    " echo findfile("Makefile", ".;~")
    " execute "make ".findfile("Makefile", ".;~")
    " execute "!./".findfile("build.sh", ".;~")
    "
    " echo fnamemodify(findfile("Makefile", ".;~"), ':p')

    let s:current_directory = expand("%:p") 
    let s:makefile_directory = fnamemodify(findfile("Makefile", ".;~"), ':p')

    echo "Current Dir:".s:current_directory." -- Makefile Dir:". s:makefile_directory
    " cd fnamemodify(findfile("Makefile", ".;~"), ':p')

    "
    " echo "FileName:".a:filename . " -- Path:".a:path
    " let result = findfile(a:filename, a:path)
    " echo "Result: ".result
    " echo !empty(result)
    " echo !empty(findfile(a:filename, a:path.';'))
endfunction
command! Test call TestMe("Makefile", ".")

"function! OpenQuickfixInOtherWindow()
"    let l:number_of_windows = winnr('$') 
"    let l:quickfix_window_number = GetQuickfixWindowNumber()

"    if l:number_of_windows == 1
"        :vs
"        :call OpenQuickfixHere()
"        OtherWindowVertical
"    else
"        " 
"        " If one of the windows is a quickfix window, do nothing.. it will
"        " auto refresh.
"        "
"        " If neither window is quickfix, goto 'OtherWindow' and open there.
"        "
"        if l:quickfix_window_number == bufnr("%")
"            OtherWindowVertical
"            call OpenQuickfixHere()
"            OtherWindowVertical
"        endif

"    endif
"endfunction
"command! OpenQuickfixInOtherWindow call OpenQuickfixInOtherWindow()


function! MakeWithoutAsking()
    :wa
    :AsyncRun -cwd=<root> -program=make
    copen
    " OpenQuickfixInOtherWindow
endfunction
command! MakeWithoutAsking call MakeWithoutAsking()

function! SearchCodebase(query)
  let l:number_of_windows = winnr('$') 
  " if l:number_of_windows == 1
  "     execute "Ag " . a:query
  "     RotateSplits
  " else
      let initial = winnr()
      execute "Ag " . a:query
      " :cclose
      " execute initial . "wincmd w"
      " copen
      " OtherWindowVertical
      " call OpenQuickfixHere()
  " endif
endfunction

function! GuiVimRunFullscreen()
    " TODO store the previous columns and lines, restore later
    if has('gui_macvim')
        set columns=1000
        set lines=300
        wincmd =
    endif
endfunction
command! RunFullScreen call GuiVimRunFullscreen()

function! FullScreenHelp(query)
    OtherWindowVertical
    execute "help " . a:query
    wincmd _
endfunction
command! -nargs=1 Help call FullScreenHelp(<f-args>)

function! DeleteHiddenBuffers()
    let tpbl=[]
    let closed = 0
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        if getbufvar(buf, '&mod') == 0
            silent execute 'bwipeout' buf
            let closed += 1
        endif
    endfor
    echo "Closed ".closed." hidden buffers"
endfunction
command! DeleteHiddenBuffers call DeleteHiddenBuffers()
