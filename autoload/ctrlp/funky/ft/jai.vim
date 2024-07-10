function! ctrlp#funky#ft#jai#filters()
    " Adds functions
    let filters = [
                \ { 'pattern': '^\w.*\s*\w\_[\t ]*::[\t ]*(',
                \   'formatter': ['\m\C^[\t ]*', '', ''] }
                \ ]

    " Adds structs / enums / types / etc
    call extend(filters, [
          \ { 'pattern': '^\w.*\s*\w\_[\t ]*::[\t ][struct|enum|#type|#run]',
          \   'formatter': ['\m\C^[\t ]*', '', '']  }]
    \ )

    return filters
endfunction
