source ~/.vim/fixme_colors.vim

nmap <buffer> <C-b> :GoDef<CR>

if has('gui_macvim')
    nmap <buffer> <D-m> :GoBuild<CR>:OpenQuickfixInOtherWindow<CR>
endif

" nmap <buffer> <C-m> :GoBuild<CR>
nmap <buffer> <C-m> :GoBuild<CR>:OpenQuickfixInOtherWindow<CR>


" Debug
nmap <buffer> <F5> :GoDebugStart<CR>
nmap <buffer> <F9> :GoDebugBreakpoint<CR>
nmap <buffer> <F10> :GoDebugNext<CR>
nmap <buffer> <F11> :GoDebugStep<CR>
nmap <buffer> <F12> :GoDebugStepOut<CR>

" We want to keep comments within an 80 column limit, but not code.
" These two options give us that
setlocal formatoptions=crq
setlocal textwidth=80
setlocal commentstring=//\ %s
setlocal noexpandtab
setlocal tabstop=4
setlocal shiftwidth=4
