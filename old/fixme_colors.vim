"
"     --- Fixme Highlights---
" -----------------------------------------------------------------------
:highlight FixMeTodo      guibg=NONE guifg=#cd2626 gui=underline,BOLD
:highlight FixMeNote      guibg=NONE guifg=#6495ed gui=underline,BOLD
:highlight FixMeImportant guibg=NONE guifg=#ffff00 gui=underline,BOLD
:highlight FixMeCleanup   guibg=NONE guifg=#ffff00 gui=underline,BOLD
:highlight FixMeSpeed     guibg=NONE guifg=#ffff00 gui=underline,BOLD
:highlight FixMeNext      guibg=NONE guifg=#6495ed gui=underline,BOLD
:highlight FixMeProg      guibg=NONE guifg=#ffff00 gui=underline,BOLD
:highlight FixMeHold      guibg=NONE guifg=#6495ed gui=underline,BOLD
:highlight FixMeDone      guibg=NONE guifg=#00ff00 gui=underline,BOLD

:let _ = matchadd("FixMeTodo", "TODO")
:let _ = matchadd("FixMeNote", "NOTE")
:let _ = matchadd("FixMeImportant", "IMPORTANT")
:let _ = matchadd("FixMeCleanup", "CLEANUP")
:let _ = matchadd("FixMeSpeed", "SPEED")
:let _ = matchadd("FixMeNext", "NEXT")
:let _ = matchadd("FixMeProg", "PROG")
:let _ = matchadd("FixMeHold", "HOLD")
:let _ = matchadd("FixMeDone", "DONE")


