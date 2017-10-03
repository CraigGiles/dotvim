if has('nvim')
    let g:python2_host_prog = '/usr/local/bin/python'
    let g:python3_host_prog = '/usr/local/bin/python3'

    " Echodoc (shows function parameters in bottom bar)
    let g:echodoc#enable_at_startup = 1

    " Deoplete Settings for Scala
        "Line 1: omnicompletion for "foo.*"
        "Line 2: omnicompletion for ":*" ",*" "(*" and "[*"
        "Line 3: omnicompletion for imports
    let g:deoplete#omni#input_patterns = {}
    let g:deoplete#omni#input_patterns.scala = [
        \ '[^. *\t]\.\w*',
        \ '[:\[,] ?\w*',
        \ '^import .*'
        \]

    let g:deoplete#enable_at_startup = 1
    let g:deoplete#enable_at_startup = 1

endif

