source ~/.vim/fixme_colors.vim

augroup local_ftplugin_cpp
    au!
    " Change the directory when entering a buffer
    au BufWinEnter,BufEnter *.h,*.cpp :lcd %:h

    au BufEnter *.cpp let b:fswitchdst = 'hpp,h' | let b:fswitchlocs = '.'
    au BufEnter *.h let b:fswitchdst = 'cpp,c' | let b:fswitchlocs = '.'
augroup END

function! FSOtherWindow()
    let number_of_windows = winnr('$') 
    if number_of_windows == 1
        FSHere
    else
        OtherWindowVertical
        FSHere
        OtherWindowVertical
    endif
endfunction

nmap <F12> :FSHere<CR>
if has('gui_macvim')
    nmap <D-F12> :call FSOtherWindow()<CR>
else
    nmap <C-F12> :call FSOtherWindow()<CR>
endif

" We want to keep comments within an 80 column limit, but not code.
" These two options give us that
setlocal formatoptions=crq
setlocal textwidth=80

" This makes doxygen comments work the same as regular comments
setlocal comments-=://
setlocal comments+=:///,://

" Indents are 4 spaces
setlocal shiftwidth=4
setlocal tabstop=4
setlocal softtabstop=4

" And they really are spaces, *not* tabs
setlocal expandtab

" Setup for indending
setlocal nosmartindent
setlocal autoindent
setlocal cinkeys-=0#
setlocal cinoptions+=^
setlocal cinoptions+=g0
setlocal cinoptions+=:0
setlocal cinoptions+=(0

" Set the local comments

" Highlight strings inside C comments
let c_comment_strings=1

" Load up the doxygen syntax
let g:load_doxygen_syntax=1

" Fix up indent issues - I can't stand wasting an indent because I'm in a
" namespace.  If you don't like this then just comment this line out.
setlocal indentexpr=GetCppIndentNoNamespace(v:lnum)

"
" Helper functions for the Indent code below
"
function! IsBlockComment(lnum)
    if getline(a:lnum) =~ '^\s*/\*'
        return 1
    else
        return 0
    endif
endfunction

function! IsBlockEndComment(lnum)
    if getline(a:lnum) =~ '^\s*\*/'
        return 1
    else
        return 0
    endif
endfunction

function! IsLineComment(lnum)
    if getline(a:lnum) =~ '^\s*//'
        return 1
    else
        return 0
    endif
endfunction

function! IsBrace(lnum)
    if getline(a:lnum) =~ '^\s*{'
        return 1
    else
        return 0
    endif
endfunction

function! IsCode(lnum)
    if !IsBrace(a:lnum) && getline(a:lnum) =~ '^\s*\S'
        return 1
    else
        return 0
    endif
endfunction

"
" GetCppIndentNoNamespace()
"
" This little function calculates the indent level for C++ and treats the
" namespace differently than usual - we ignore it.  The indent level is the for
" a given line is the same as it would be were the namespace not event there.
"
function! GetCppIndentNoNamespace(lnum)
    let nsLineNum = search('^\s*\<namespace\>\s\+\S\+', 'bnW')
    if nsLineNum == 0
        return cindent(a:lnum)
    else
        let inBlockComment = 0
        let inLineComment = 0
        let inCode = 0
        for n in range(nsLineNum + 1, a:lnum - 1)
            if IsBlockComment(n)
                let inBlockComment = 1
            elseif IsBlockEndComment(n)
                let inBlockComment = 0
            elseif IsLineComment(n) && inBlockComment == 0
                let inLineComment = 1
            elseif IsCode(n) && inBlockComment == 0
                let inCode = 1
                break
            endif
        endfor
        if inCode == 1
            if IsBrace(a:lnum) && GetCppIndentNoNamespace(a:lnum - 1) == 0
                return 0
            else
                return cindent(a:lnum)
            endif
        elseif inBlockComment
            return cindent(a:lnum)
        elseif inLineComment
            if IsCode(a:lnum)
                return cindent(nsLineNum)
            else
                return cindent(a:ln
            endif
        elseif inBlockComment == 0 && inLineComment == 0 && inCode == 0
            return cindent(nsLineNum)
        endif
    endif
endfunction
