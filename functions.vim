" NOTE(craig): for function debugging
" See `:scriptnames` for a list of all scripts, in evaluation order.

"
"     --- Fixme Highlights---
" -----------------------------------------------------------------------

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
  " Store the current buffer so we can re-claim it when we close
    let g:old_bufn = bufnr('%')
    let g:old_winn = winnr()

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

function! OpenQuickfixInOtherWindow()
    let l:number_of_windows = winnr('$') 
    let l:quickfix_window_number = GetQuickfixWindowNumber()

    if l:number_of_windows == 1
        :vs
        :call OpenQuickfixHere()
        OtherWindowVertical
    else
        " 
        " If one of the windows is a quickfix window, do nothing.. it will
        " auto refresh.
        "
        " If neither window is quickfix, goto 'OtherWindow' and open there.
        "
        if l:quickfix_window_number == bufnr("%")
            OtherWindowVertical
            call OpenQuickfixHere()
            OtherWindowVertical
        endif

    endif
endfunction
command! OpenQuickfixInOtherWindow call OpenQuickfixInOtherWindow()

let g:build_file_name = 'build.bat'
let g:compile_command = 'make'
function! MakeWithoutAsking()
    " find project directory
    let s:current_directory = expand("%:p") 
    let s:build_file_full_path = findfile(g:build_file_name, ".;~")
    let s:build_file_directory = fnamemodify(s:build_file_full_path, ':p:h')

    let s:working_directory = getcwd()
    exec 'cd' s:build_file_directory
    exec g:compile_command
    OpenQuickfixInOtherWindow

    " :wa
    " exec "Make"
    " OpenQuickfixInOtherWindow
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

function! GuiVimRunFullscreen()
    if exists('g:fullscreen') && g:fullscreen == 1
        call GuiWindowMaximized(0)
        let g:fullscreen = 0

    elseif has('gui_macvim')
        " TODO store the previous columns and lines, restore later
        set columns=1000
        set lines=300
        wincmd =

    elseif exists('g:GuiLoaded') && has('nvim') 
        echo "Fullscreen hoooo"
        call GuiWindowMaximized(1)
        let g:fullscreen = 1
    endif
endfunction
command! RunFullScreen call GuiVimRunFullscreen()

function! FullScreenHelp(query)
    OtherWindowVertical
    execute "help " . a:query
    wincmd _
endfunction
command! -nargs=1 Help call FullScreenHelp(<f-args>)




    "(with-system darwin
    "             (setq build-file-name "build.sh")
    "             (setq compile-command "./build.sh"))
    "(with-system windows-nt
    "             (setq build-file-name "build.bat")
    "             (setq compile-command "build.bat"))

    "(setq build-file-name "build.sh")
    "(setq compile-command "make")

";; Compile Settings
";; -------------------------------------------------------
";; split right if only one window exists
"(defun split-window-right-if-single-window ()
"  "Test something"
"  (interactive)
"  (if (= (length (window-list)) 1) (split-window-right) nil))
""
"(setq compilation-directory-locked nil)

"(defun find-project-directory-recursive ()
  ""Recursively search for a makefile."
  "(interactive)
  "(if (file-exists-p build-file-name) t
    "(cd "../")
    "(find-project-directory-recursive)))

"(defun lock-compilation-directory ()
  ""The compilation process should NOT hunt for a makefile"
  "(interactive)
  "(setq compilation-directory-locked t)
  "(message "Compilation directory is locked."))

"(defun unlock-compilation-directory ()
  ""The compilation process SHOULD hunt for a makefile"
  "(interactive)
  "(setq compilation-directory-locked nil)
  "(message "Compilation directory is roaming."))

"(defun find-project-directory ()
  ""Find the project directory."
  "(interactive)
  "(setq find-project-from-directory default-directory)
  "(switch-to-buffer-other-window "*compilation*")
  "(if compilation-directory-locked (cd last-compilation-directory)
    "(cd find-project-from-directory)
    "(find-project-directory-recursive)
    "(setq last-compilation-directory default-directory)))

"(defun make-without-asking ()
  ""Make the current build."
  "(interactive)
  "(split-window-right-if-single-window)
  "(save-buffers-without-asking)
  "(if (find-project-directory) (compile compile-command))
  "(other-window 1))

let g:compile_command = 'make'
function! TestMakeWithoutAsking()
    " split window right if single window
    :wa
    " find project directory
    let s:current_directory = expand("%:p") 
    let s:build_directory = fnamemodify(findfile("build.bat", ".;~"), ':p')

    echo "Current Dir:".s:current_directory." -- Build Dir:". s:build_directory

    " exec g:compile_command
    cd s:build_directory
    exec "make"
    OpenQuickfixInOtherWindow
endfunction
command! TestMakeWithoutAsking call TestMakeWithoutAsking()

" function! TestMe(filename, path)
function! TestMe()
    " find project directory
    let s:current_directory = expand("%:p") 
    let s:build_file_full_path = findfile(g:build_file_name, ".;~")
    let s:build_file_directory = fnamemodify(s:build_file_full_path, ':p:h')

    let s:working_directory = getcwd()
    exec 'cd' s:build_file_directory
    exec "make"
    OpenQuickfixInOtherWindow






    " OLD FROM HERE ON
    " --------------------------------------------------------------------------

    "" return true if file is found
    "" return false if not
    "" echo findfile("Makefile", ".;~")
    "" execute "make ".findfile("Makefile", ".;~")
    "" execute "!./".findfile("build.sh", ".;~")
    ""
    "" echo fnamemodify(findfile("Makefile", ".;~"), ':p')

    "let s:current_directory = expand("%:p") 
    "let s:build_directory = fnamemodify(findfile("build.bat", ".;~"), ':p')

    "echo "Current Dir:".s:current_directory." -- Build Dir:". s:build_directory
    "" cd fnamemodify(findfile("Makefile", ".;~"), ':p')

    ""
    "" echo "FileName:".a:filename . " -- Path:".a:path
    "" let result = findfile(a:filename, a:path)
    "" echo "Result: ".result
    "" echo !empty(result)
    "" echo !empty(findfile(a:filename, a:path.';'))
endfunction
" command! Test call TestMe("Makefile", ".")
command! Test call TestMe()



" vim:set sw=2 sts=2 foldmethod=marker foldlevel=0:
