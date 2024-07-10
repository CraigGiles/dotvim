let g:ctrlp_funky_after_jump = {
            \ 'default' : 'zxzz',
            \ 'python'  : 'zO',
            \ 'cpp'     : 'zxzt',
            \ 'go'      : 'zz',
            \ 'vim'     : '',
            \ }

function! ctrlp#funky#ft#jai#filters()
    let filters = [
                \ { 'pattern': '\m\C^[\t ]*\?.* :: [\t ]\+\S\+',
                \   'formatter': ['\m\C^[\t ]*', '', ''] }
                \ ]

    " You can highlight whatever in the |ctrlp|.vim window if you want
    call ctrlp#funky#highlight('^[\t ]*function[\t ]',
                \ 'CtrlPFunkyVimFunc', 'Function')

    return filters
endfunction
