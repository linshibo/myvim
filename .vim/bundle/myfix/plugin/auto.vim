"---------------------------------------------------------------------------
"    Description:  Programming Automation
"    Author:       ywgx.ch@gmail.com
"    Created:      2011/11/22 00:33:31
"    License:      GPL v2.0
"    Version:      2.1
"---------------------------------------------------------------------------
set nocp exrc
set is cin smd wmnu magic
"imap ,, <ESC>
"imap ;; <ESC>
autocmd BufRead,BufNewFile *.html setf html
autocmd FileType python,ruby,sh :call Py()
autocmd FileType cpp,c,cc,h,html,perl :call Cc()
autocmd FileType c,cc,cpp,h,html,python :call Cp()
function Cp()
    inoreabbrev , ,<SPACE>
	inoreabbrev ; ;<SPACE>
	inoreabbrev <= <SPACE><=<SPACE>
	inoreabbrev *= <SPACE>*=<SPACE>
	inoreabbrev /= <SPACE>/=<SPACE>
	inoreabbrev >> <SPACE>>><SPACE>
	inoreabbrev << <SPACE><<<SPACE>
	inoreabbrev >= <SPACE>>=<SPACE>
	inoreabbrev == <SPACE>==<SPACE>
	inoreabbrev += <SPACE>+=<SPACE>
	inoreabbrev && <SPACE>&&<SPACE>
endf
function Py()
	nnoremap mm :call Ct()<CR>
	inoremap mm <ESC>$
	inoremap nn <ESC>o
	inoremap <F2> <ESC>
	if exists("$DISPLAY")
		nnoremap <F2> :call Cv()<CR>
	else
		nnoremap <F2> :call Ct()<CR>
	endif
endf
function Cc()
	no != <SPACE>!=<SPACE>
    inoremap mm <ESC>A;<ESC>
	inoremap nn <ESC>A;<ESC>o
	if exists("$DISPLAY")
		if &filetype == 'perl'
		   nnoremap mm :call Ct()<CR>
		   nnoremap<F2> :call Cv()<CR>
		   inoremap<F2> <ESC> :call Cv()<CR>
	    else
		   nnoremap mm :call Ct()<CR><CR>
		   nnoremap mm :call Ct()<CR><CR>
		   nnoremap<F2> :call Cv()<CR><CR>
		   inoremap<F2> <ESC> :call Cv()<CR><CR>
		endif
	else
		nnoremap<F2> :call Ct()<CR>
		inoremap<F2> <ESC> :call Ct()<CR>
		nnoremap mm :call Ct()<CR>
	endif
endf
function Cv()
	exe "w"
	if &filetype == 'c'
		exe "!gcc -Wall % -o %<"
		exe "!clear;./%< 2>/dev/null && rm -f %<"
	elseif &filetype == 'cpp'
		exe "!g++ -Wall % -o %<"
		exe "!clear;./%< 2>/dev/null && rm -f %<"
	elseif &filetype == 'python'
		exe "!clear;python %"
	elseif &filetype == 'ruby'
		exe "!clear;ruby  %"
	elseif &filetype == 'sh'
		exe "!clear;bash %"
	elseif &filetype == 'perl'
		exe "!clear;perl %"
	endif
endf
function Ct()
	exe "w"
	if &filetype == 'c'
		exe "!gcc -Wall % -o %<"
		exe "!./%< 2>/dev/null && rm -f %<"
	elseif &filetype == 'cpp'
		exe "!g++ -Wall % -o %<"
		exe "!./%< 2>/dev/null && rm -f %<"
	elseif &filetype == 'python'
		exe "!python %"
	elseif &filetype == 'ruby'
		exe "!ruby  %"
	elseif &filetype == 'sh'
		exe "!bash %"
	elseif &filetype == 'perl'
		exe "!perl %"
	elseif &filetype =='html'
		exe "!firefox %"
	endif
endf
autocmd FileType h,c,cc,cpp,sh,perl,python :call YWcode()
function YWcode()
	set ai si
	set sw=4 ts=4 sts=4
endf
autocmd FileType ruby :call YWruby()
function YWruby()
	set ai si
	set sw=2 ts=2 sts=2
endf
