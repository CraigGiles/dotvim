" Order matters when sourcing these
source ~/.vim/config/plugins.vim
source ~/.vim/config/settings.vim
source ~/.vim/config/functions.vim
source ~/.vim/config/statusline.vim
source ~/.vim/config/key-bindings.vim
source ~/.vim/config/neovim-settings.vim

" au! BufRead,BufNewFile *.gd setfiletype gd
au! BufRead,BufNewFile *.gd setfiletype gdscript3

" When you save the vimrc, auto-reload it
augroup VimReload
    autocmd!
    autocmd BufWritePost  $MYVIMRC  source $MYVIMRC
augroup END

" undo all the things
if has('persistent_undo')
    set undolevels=5000
    set undodir=$HOME/.VIM_UNDO_FILES
    set undofile
endif

" Allow for per-machine overrides in ~/.vim/vimrc.local.
let s:vimrc_local = $HOME . '/.vim/vimrc.local'
if filereadable(s:vimrc_local)
  execute 'source ' . s:vimrc_local
endif

" ================================================
" Testing These Settings
" ================================================
nnoremap <leader><leader> <C-^>
" set guicursor=
set guifont=Liberation\ Mono:h14
nnoremap <leader>t :CtrlPTag<CR>
nnoremap <leader>p :CtrlPTag<CR>
nnoremap <leader>f :CtrlP<CR>

" open current buffer in new tab
nmap tt :vs<CR><C-w>T

"Max out the height of the current split
" ctrl + w _

"Max out the width of the current split
" ctrl + w |

"Normalize all split sizes, which is very handy when resizing terminal
" ctrl + w =

" ==================================================
" Functions
" ==================================================
"======[ Magically build interim directories if necessary ]===================

function! AskQuit(msg, options, quit_option)
    if confirm(a:msg, a:options) == a:quit_option
        exit
    endif
endfunction

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

augroup AutoMkdir
    autocmd!
    autocmd  BufNewFile  *  :call EnsureDirExists()
augroup END

" function! ScalaInsertDatabaseMigration(name)
"     " silent! execute <C-R>=strftime("%Y%m%d%H%M")a:name.sql<CR>
"     let a:ts = strftime("%Y%m%d%H%M")
"     let a:myval = tolower(a:name)
"     let a:noHyphs = substitute(a:myval, " ", "-", "g")
"     let a:noSpaces = substitute(a:noHyphs, "\"", "", "g")
"     let a:filename = "V1_" . a:ts . "__" . a:noSpaces . ".sql"
"     echo a:filename
"     echo getcwd()."/flyway/src/main/resources/db/migration/".a:filename
" endfunction

" command! -nargs=1 Smigration call ScalaInsertDatabaseMigration(<q-args>)

" function! ScalaExtractFunction(name)
"     " silent! execute <C-R>=strftime("%Y%m%d%H%M")a:name.sql<CR>
"     :'<,'>x
"     silent! normal i"a:name"
" endfunction

" command! -nargs=1 Sextract call ScalaExtractFunction(<q-args>)
"

" See `:scriptnames` for a list of all scripts, in evaluation order.
" Launch Vim with `vim --startuptime vim.log` for profiling info.
"
" To see all leader mappings, including those from plug-ins:

" vim:set sw=2 sts=2 foldmethod=marker foldlevel=0:
