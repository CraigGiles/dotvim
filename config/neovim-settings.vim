if has('nvim')
    let g:python2_host_prog = '/usr/local/bin/python'
    let g:python3_host_prog = '/usr/local/bin/python3'

    " Echodoc (shows function parameters in bottom bar)
    let g:echodoc#enable_at_startup = 1

    " Deoplete Settings for Scala
    let g:deoplete#enable_at_startup = 1 

    " Less spam 
    let g:deoplete#auto_complete_start_length = 2 

    " Use smartcase
    let g:deoplete#enable_smart_case = 1

    " Setup completion sources
    let g:deoplete#sources = {}

    let g:deoplete#sources.java = [
                \ 'jc', 
                \ 'javacomplete2',
                \ 'file',
                \ 'buffer']

    let g:deoplete#sources.scala = [
                \ 'omnifunc',
                \ 'javacomplete2',
                \ 'file',
                \ 'buffer']

    "Line 1: omnicompletion for "foo.*"
    "Line 2: omnicompletion for ":*" ",*" "(*" and "[*"
    "Line 3: omnicompletion for imports
    let g:deoplete#omni#input_patterns = {}
    let g:deoplete#omni#input_patterns.scala = [
                \ '[^. *\t]\.\w*',
                \ '[:\[,] ?\w*',
                \ '^import .*'
                \]

    ""use TAB as the mapping
    inoremap <silent><expr> <TAB>
                \ pumvisible() ?  "\<C-n>" :
                \ <SID>check_back_space() ? "\<TAB>" :
                \ deoplete#mappings#manual_complete()
    function! s:check_back_space() abort "" {{{
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~ '\s'
    endfunction "" }}}
endif
