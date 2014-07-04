syn match goFunc  /\(\w\+\)\ze(/
syn match  goNum  "\<\([0-9]\+\)\>"
syn match  goNum  "\<0[xX]\([0-9abcdefABCDEF]\+\)\>"
" C math operators 
syn match      goOperator  display "[-+\*%=]"
"" C pointer operators 
syn match       goOperator display "->\|\.\|\:\:"
" C logical   operators - boolean results 
syn match       goOperator display "[!<>]=\="
syn match   goOperator     display "==\|:="
" C bit operators 
syn match       goOperator display "\(&\||\|\^\|<<\|>>\)=\="
syn match      goOperator  display "\~"
" More C logical operators - highlight in preference to binary 
syn match      goOperator  display "&&\|||"

syn match hsString display "(\|)\|[\|]\|{\|}"


hi goFunc cterm=bold ctermfg=33
hi goNum cterm=bold ctermfg=1
hi goOperator cterm=bold ctermfg=green




