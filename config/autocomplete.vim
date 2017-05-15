if has('nvim')
    let g:deoplete#enable_at_startup = 1

    " Index 1: omnicompletion for "foo.*"
    " Index 2: omnicompletion for ":*" ",*" "(*" and "[*"
    " Index 3: omnicompletion for imports
    " let g:deoplete#omni#input_patterns.scala = [
    "   \ '[^. *\t]\.\w*',
    "   \ '[:\[,] ?\w*',
    "   \ '^import .*'
    "   \]
else
    let g:deoplete#enable_at_startup = 0
endif
