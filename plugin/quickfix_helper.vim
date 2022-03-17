" Maintainer:	Craig Giles
" License:	This file is placed in the public domain.

" If already loaded, we're done...
if exists("quickfix_helper")
    finish
endif
let quickfix_helper = 1

" Preserve external compatibility options, then enable full vim compatibility...
let s:save_cpo = &cpo
set cpo&vim

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

function! OpenQuickFixList()
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

