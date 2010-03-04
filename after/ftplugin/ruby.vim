if (exists("b:folded"))
  finish
endif
let b:folded = 1
call Foldsearch("")
normal zR
"map <buffer> <F5> :!ruby %<cr>
