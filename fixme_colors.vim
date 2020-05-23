"
"     --- Fixme Highlights---
" -----------------------------------------------------------------------
:highlight FixMeTodo      guibg=NONE guifg=#cd2626
:highlight FixMeNote      guibg=NONE guifg=#6495ed
:highlight FixMeImportant guibg=NONE guifg=#ffff00
:highlight FixMeCleanup   guibg=NONE guifg=#ffff00
:highlight FixMeSpeed     guibg=NONE guifg=#ffff00
:highlight FixMeNext      guibg=NONE guifg=#6495ed
:highlight FixMeProg      guibg=NONE guifg=#ffff00
:highlight FixMeHold      guibg=NONE guifg=#6495ed
:highlight FixMeDone      guibg=NONE guifg=#00ff00

:let _ = matchadd("FixMeTodo", "TODO")
:let _ = matchadd("FixMeNote", "NOTE")
:let _ = matchadd("FixMeImportant", "IMPORTANT")
:let _ = matchadd("FixMeCleanup", "CLEANUP")
:let _ = matchadd("FixMeSpeed", "SPEED")
:let _ = matchadd("FixMeNext", "NEXT")
:let _ = matchadd("FixMeProg", "PROG")
:let _ = matchadd("FixMeHold", "HOLD")
:let _ = matchadd("FixMeDone", "DONE")


