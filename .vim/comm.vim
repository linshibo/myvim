"my vim tips
"if    if switch for class struct main while 
"hd    文件头部定义
"ff    ifndef –def –endif  .h 文件中使用
"in    #include  “”
"is    #include <>
"ih    #include <自身文件名.h>
"ihpp  #include <自身文件名.hpp>
"xt    当前时间
"-------------------------------------------------
"surround.vim tips
"Normal mode
"ds  - delete a surrounding
"cs  - change a surrounding
"ys  - add a surrounding
"yS  - add a surrounding and place the surrounded text on a new line + indent it
"yss - add a surrounding to the whole line
"ySs - add a surrounding to the whole line, place it on a new line + indent it
"ySS - same as ySs
"Visual mode
"s   - in visual mode, add a surrounding
"S   - in visual mode, add a surrounding but place text on new line + indent it
"Insert mode
"<CTRL-s> - in insert mode, add a surrounding
"<CTRL-s><CTRL-s> - in insert mode, add a new line + surrounding + indent
"<CTRL-g>s - same as <CTRL-s>
"<CTRL-g>S - same as <CTRL-s><CTRL-s>
"-------------------------------------------------
	
set mouse=v
set clipboard=unnamed

command! -nargs=0 RENEW  :source ~/.vim/comm.vim

"===========================
let g:Author="francisco"
let g:Email="francisco@taomee.com"
let g:Company="TAOMEE"
"===========================

"vimtips 
command! -nargs=0 VIMTIPS  :tabe | :r ! w3m -dump http://zzapper.co.uk/vimtips.html 

" Open and close the NERD_tree.vim separately
nmap <F3> <ESC>:NERDTreeToggle<RETURN>

filetype plugin on
syntax enable
syntax on
set smarttab
colorscheme desert
"退格键能删除
set backspace=indent,eol,start
set showcmd
"---------------------------------------------------------------------------
"进行Tlist的设置
"TlistUpdate可以更新tags
map <F2> :silent! Tlist<CR>
let Tlist_Ctags_Cmd='ctags' "因为我们放在环境变量里，所以可以直接执行
let Tlist_Use_Right_Window=0 "让窗口显示在右边，0的话就是显示在左边
let Tlist_Show_One_File=0 "让taglist可以同时展示多个文件的函数列表，如果想只有1个，设置为1
let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏
let Tlist_Exit_OnlyWindow=1 "当taglist是最后一个分割窗口时，自动推出vim
let Tlist_Process_File_Always=0 "是否一直处理tags.1:处理;0:不处理。不是一直实时更新tags，因为没有必要
let Tlist_Inc_Winwidth=0
"---------------------------------------------------------------------------
"autocmd QuickFixCmdPost [^l]* nested cwindow
"autocmd QuickFixCmdPost    l* nested lwindow

"---------------------------------------------------------------------------
"Doxygen插件
let g:DoxygenToolkit_briefTag_pre="@brief  " 
let g:DoxygenToolkit_paramTag_pre="@param  " 
let g:DoxygenToolkit_returnTag="@return  " 
let g:DoxygenToolkit_blockHeader="----------------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------" 
let g:DoxygenToolkit_authorName="francisco" 
map \f :Dox<CR>
map \a :DoxAuthor<CR>
map \b :DoxBlock<CR>
"---------------------------------------------------------------------------

"折叠
set foldmethod=syntax
""默认情况下不折叠
set foldlevel=99
nnoremap <Space> za

"-------------------------------------------------------------------------
"quickfix 开关 
function! ToggleQF()
    if !exists("g:fx_toggle")
        let g:fx_toggle = 0
    endif
    if g:fx_toggle == 0
        let g:fx_toggle = 1
        copen
    else
        let g:fx_toggle = 0
        cclose
    endif
endfunc
map <F4> <Esc>:call ToggleQF()<CR>
nmap <C-N> <Esc>:cn<CR>
nmap <C-P> <Esc>:cp<CR>
"----------------------------------------------------------------------------

"查找当前光标下的单词
map ,f <Esc>:call P_grep_curword()<CR>
map ,q <Esc>:q!<CR> 
map ,w <Esc>:w!<CR>
map ,e <Esc>:e 
map ,x <Esc>:!

cmap <C-A> <HOME>
cmap <C-E> <END>
cnoremap <C-D> <DELETE>
cnoremap <C-B> <LEFT>
cnoremap <C-F> <RIGHT>
cnoremap <C-U> <UP>
cnoremap <C-N> <DOWN>

map ,t <Esc>:tabedit 
map <C-J> <C-PageUp>
map <C-K> <C-PageDown>

"---------------------------------------------------------------------------
"" 状态栏各个状态
let statusHead         ="%-.50f\ %h%m%r"
let statusBreakPoint   ="%<"
let statusSeparator      ="|"
let statusFileType      ="%{((&ft\ ==\ \"help\"\ \|\|\ &ft\ ==\ \"\")?\"\":\"[\".&ft.\"]\")}"
let statusFileFormat    ="[%{(&ff\ ==\ \"unix\")?\"u\":\"d\"}]"
let statusAscii         ="\{%b:0x%B\}"
let statusCwd         ="%-.50{getcwd()}"
let statusBody         =statusFileType.statusFileFormat.statusSeparator.statusAscii.statusSeparator."\ ".statusBreakPoint.statusCwd
let statusEncoding      ="[%{(&fenc\ ==\ \"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]"
let statusBlank         ="%="
let statusKeymap      ="%k"
let statusRuler         ="%-12.(%lL,%c%VC%)\ %P"
let statusTime         ="%{strftime(\"%y-%m-%d\",getftime(expand(\"%\")))}"
let statusEnd=statusKeymap."\ ".statusEncoding.statusRuler."\ ".statusTime
"" 最终状态栏的模式字符串
let statusString=statusHead.statusBody.statusBlank.statusEnd
set statusline=%!statusString
"---------------------------------------------------------------------------

"autocmd Filetype cpp,c,java,cs set omnifunc=cppcomplete#Complete
"ab P printf("%s,%s,%d:%s\n",__FILE__,__FUNCTION__,__LINE__,"" ); 
"
set nocp
set tags=~/.vim/tags,~/.vim/tags_cpp,tags; 
set laststatus=2

"------------------------------------------------------------------------------
"获取当前路径的上一级的路径
function! GET_UP_PATH(dir)
	let pos=len(a:dir)-1
	while pos>0 
		if (a:dir[pos]=="/" )
			return 	strpart(a:dir,0,pos)
		endif
		let pos=pos-1 
	endwhile
	return  ""  
endfunction

"设置相关tags
function! s:SET_TAGS()
    "let dir = expand("%:p:h") "获得源文件路径
    let dir =getcwd()  "获得源文件路径
	set tags=
	"在路径上递归向上查找tags文件 
	while dir!=""
		if findfile("tags",dir ) !=""
			"找到了就加入到tags
			exec "set tags+=" . dir . "/tags"
		endif
		"得到上级路径
		let dir=GET_UP_PATH(dir)
	endwhile
	if ( &filetype =="cpp" )
		set tags+=~/.vim/tags
		set tags+=~/.vim/tags_cpp
		set tags+=~/.vim/tags_qt

	endif
endfunction


"设置相关 include , for cmd : gf 
function! s:SET_PATH( find_dir )
    let dir = expand("%:p:h") "获得源文件路径
	let dir_relative=''
	let g:alternateSearchPath = ''
	"let g:alternateSearchPath = 'sfr:../source,sfr:../src,sfr:../include,sfr:../inc,sfr:.'
	"在路径上递归向上查找tags文件 
	while dir!=""
		if finddir(a:find_dir ,dir ) !=""
			"找到了就加入到tags
			exec "set path+=" . dir . "/". a:find_dir
			let g:alternateSearchPath = g:alternateSearchPath.'sfr:'.dir_relative.a:find_dir."," 
		endif
		"得到上级路径
		let dir_relative=dir_relative . "../"
		let dir=GET_UP_PATH(dir)
	endwhile
endfunction

"autocmd BufEnter *.cpp,*.c,*.h call s:SET_TAGS() 
"autocmd BufEnter *.php call s:SET_TAGS() 

autocmd BufEnter  *.cpp,*.c,*.h call s:SET_PATH("include") 
autocmd BufEnter  *.php call s:SET_PATH("pub") 

autocmd BufEnter *  set tabstop=4 
autocmd BufEnter /usr/include/c++/*  set tabstop=8  
autocmd BufEnter ~/.vim/cpp_src/*  set filetype=cpp

"autocmd BufEnter *    if ( &filetype == "php" )| map ,i <Esc>:e ~/DB/su/pub/| else | map ,i <Esc>:e ~/DB/include/| endif

"用于支持代码补全时，提示存在。
"set completeopt=menuone,longest  
"set completeopt=menuone
inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"
inoremap <expr> <m-;> pumvisible() ? "\<c-n>" : "\<c-x>\<c-o>\<c-n>\<c-p>\<c-r>=pumvisible() ? \"\\<down>\" : \"\\<cr>\""

"改变扫描标签的规则 防止假死
"vim缺省的补全顺序是 ".,w,b,u,t,i"，
"它意味着扫描: 1. 当前缓冲区 .  2. 其它窗口的缓冲区 window?  3. 其它载入的缓冲区 b  
"set cpt=.,w,b

" 用于支持 . -> 代码补全
imap   <expr> <Backspace>  Ex_bspace() 
imap   <expr> <Space>  Ex_space("\<Space>") 
function! Ex_space ( char )
	if (&filetype == "cpp" || &filetype == "c" )
		let pre_str= strpart(getline('.'),0,col('.')-1)
		if pumvisible() != 0  
			"in completing , complete it    
			return "\<CR>"	
  		elseif pre_str  =~ "[.][\s\t]*$" || pre_str  =~ "->[\s\t]*$"   
			return "\<C-X>\<C-O>"	
		endif 
	endif

	if (&filetype == "python" ||&filetype == "html"  ||&filetype == "php"     )
		let pre_str= strpart(getline('.'),0,col('.')-1)
		if pumvisible() != 0  
			"in completing , complete it    
			return "\<CR>"	
  		elseif pre_str  =~ "[.][\s\t]*$" || pre_str  =~ "->[\s\t]*$"   
			return "\<C-X>\<C-O>\<C-P>\<C-R>=pumvisible() ? \"\\<down>\" : \"\"\<cr>"	
		endif 
	
	endif
	"default
	return a:char 
endf

function! Ex_bspace()
	if (&filetype == "cpp" || &filetype == "c" )
		let pre_str= strpart(getline('.'),0,col('.')-2)
  		if pre_str  =~ "[.][ \t]*$" || pre_str  =~ "->[ \t]*$"   
			return "\<Backspace>\<C-X>\<C-O>"	
		endif 
	endif

	if (&filetype == "python"|| &filetype == "html"  || &filetype == "python"  )
		let pre_str= strpart(getline('.'),0,col('.')-2)
  		if pre_str  =~ "[.][ \t]*$"
			return "\<Backspace>\<C-X>\<C-O>\<C-P>\<C-R>=pumvisible() ? \"\\<down>\" : \"\"\<cr>"	
		endif 
	endif

	"default
	return "\<Backspace>"	
endf



".c  .h 文件设为 .cpp
autocmd BufEnter *.c  set filetype=cpp
autocmd BufEnter *.h  set filetype=cpp

"------------------------------------------------------------------------------
set guifont=Bitstream\ Vera\ Sans\ Mono\ 11 


function! SET_UAW()
	let save_cursor = getpos(".")

	let line = getline('.')
	let col_num = col('.')
	if match("ABCDEFGHIJKLMNOPQRSTUVWXYZ",line[col_num-1])!= -1
		exec "normal! guaw"
	else
		exec "normal! gUaw"
	endif

	call setpos('.', save_cursor)
endfunction

set fileencodings=ucs-bom,utf-8,gb2312,big5,euc-jp,euc-kr,latin1

set tabstop=4
set incsearch
set nohlsearch 
set cindent shiftwidth=4
command! Wq wq
command! W w

"for grep cn 
function! Do_cn() 
	try
		exec "cn"
	catch /E553/
		exec "cc 1"
	endtry	
endfunction

function! P_grep_curword() 
	"得到光标下的单词
	let curword=expand("<cword>")
	exec "grep -r -s " . curword . " *.cpp *.h *.c *.hpp"
	copen
	let g:fx_toggle=1
endfunction


function! RESET_TAG() 
	!~/.vim/mtags.sh 
	if filereadable("cscope.out")
		cs reset 
	endif
endfunction

function! OPT_RANGE( opt_str ) 
  let cur_char=getline('.')[col('.') - 1] 
  if cur_char == "(" || cur_char == "<" || cur_char == "{" || cur_char == "[" || cur_char == "\"" || cur_char == "'" || cur_char == ")" || cur_char == ">" || cur_char == "}" || cur_char == "]" 
  	exec "normal! ".a:opt_str.cur_char
  endif
endfunction

function! OPT_RANGE_NEW( opt_str ) 
	echo "start"
  let cur_col=col('.') - 1
  let cur_line=line('.')
  let cur_char=''
  echo "start pos:" cur_line cur_col 
  while cur_line>0
	while cur_col>0
  		let cur_char=getline(cur_line)[cur_col]
		echo "pos:" cur_line cur_col  "cur:" cur_char 
  		if  cur_char == ")"  || cur_char == "}" || cur_char == "]" 
			let pair_char=nr2char(char2nr(cur_char)-1)
			let line=0
			let col=0
			let [line,col]= searchpairpos( pair_char , '', cur_char , 'bn') 
			echo "pair--" pair_char line col
			if col != 0 && line != 0
				let cur_col=col-1
				let cur_line=line-1
			else
				let cur_col=cur_col-1
			endif
		elseif cur_char == "(" || cur_char == "{" || cur_char == "["
  				exec "normal! ".a:opt_str.cur_char
				let cur_col=0
				let cur_line=0
		else
			let cur_col=cur_col-1
		endif
	endwhile 
	let cur_line=cur_line-1
	let cur_col=strlen(getline(cur_line))
  endwhile 
endfunction

"map ,n :n<CR>
"map ,N :N<CR>
map ,a :A<CR>
map ,g <Esc>:grep 
map ,r <Esc>:call RESET_TAG() <CR> <CR>
map ,m <Esc>:make<CR> 

map ,y    <Esc>:call OPT_RANGE("ya")<CR>
map ,Y    <Esc>:call OPT_RANGE("yi")<CR>
map ,d    <Esc>:call OPT_RANGE("da")<CR>
map ,D    <Esc>:call OPT_RANGE("di")<CR>
"map ,c    <Esc>:call OPT_RANGE("ca")<CR>
"map ,C    <Esc>:call OPT_RANGE("ci")<CR>

"转换单词大小写
map ,u <Esc>:call SET_UAW()<CR>

"支持粘贴
map <F5> <Esc>:set paste<CR>i

autocmd InsertLeave * if &paste == 1|set nopaste |endif

"切换窗口
"map ,w <Esc>:tabn<CR><C-W><C-W><CR>
"map <F3> <Esc>yyp^6l<C-A>4l<C-A><Esc>


" 在视图模式下的整块移动
function! SET_BLOCK_MOVE_V( move_type )
    if a:move_type==0
        exec "'<,'>s/^/	/"
    else
        exec "'<,'>s/^	//"
    endif

	let linecount = line("'>") - line("'<")
	let save_cursor_begin = getpos("'<")
	call setpos('.', save_cursor_begin)
	exec  "normal! v" . linecount . "j"	
endfunction

" 在正常模式下的整块移动
"大括号内向左移
:nmap <C-H> <Esc><i{
"大括号内向右移
:nmap <C-L> <Esc>>i{

"选择区移动
:vmap <C-L> <Esc>:call SET_BLOCK_MOVE_V(0) <CR>
:vmap <C-H> <Esc>:call SET_BLOCK_MOVE_V(1) <CR>


"定位到原来的位置
autocmd BufReadPost *
	\ if line("'\"") > 0 && line ("'\"") <= line("$") |
	\   exe "normal! g'\"" |
	\ endif

"支持STL模板
let OmniCpp_DefaultNamespaces   = ["std", "_GLIBCXX_STD"]
let OmniCpp_SelectFirstItem = 2

"----------------------------------------------------------
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap " ""<ESC>i
inoremap ' ''<ESC>i
autocmd Syntax html,vim inoremap < <lt>><ESC>i| inoremap > <c-r>=ClosePair('>')<CR>
imap ) <c-r>=ClosePair(')')<CR>
imap ] <c-r>=ClosePair(']')<CR>
imap } <c-r>=CloseBracket()<CR>
"imap <CR> <c-r>=Fix_cr()<CR>
imap " <c-r>=QuoteDelim('"')<CR>
imap ' <c-r>=QuoteDelim("'")<CR>
inoremap { <c-r>=SET_BIG_PAIR()<CR>

function! SET_BIG_PAIR()
  if (&filetype=="php" ||  &filetype=="sh"  )
	if match( getline('.'), '"' ) >= 0 || match( getline('.'), "'" ) >= 0 
  		return "{}\<ESC>i"
	endif
  elseif (&filetype=="python")
  		return "{}\<ESC>i"
  endif

  return "{\<CR>}\<ESC>O"
endf

function! ClosePair(char)
  if getline('.')[col('.') - 1] == a:char
    return "\<Right>"
  else
    return a:char
  endif
endf

function! Fix_cr()
 if pumvisible() == 0
  let line = getline('.')
  let col = col('.')
 	if line[col-1] == '"' ||  line[col-1] == "'"  || line[col-1] == "]"  ||line[col-1] == ")"    
    "Escaping out of the string
    	return "\<ESC>la"
	endif
 endif
 return "\<CR>"

endf

function! CloseBracket()
	if match(getline(line('.') + 1), '\s*}') < 0
		return "\<CR>}"
	else
		return "\<ESC>j0f}a"
	endif
endf


function! QuoteDelim(char)
  let line = getline('.')
  let col = col('.')

  if (&filetype == "vim")
    return a:char
  endif
	
  if line[col - 2] == "\\"
    "Inserting a quoted quotation mark into the string
    return a:char
  elseif line[col - 1] == a:char
    "Escaping out of the string
	return "\<Right>"
  else
    "Starting a string
    return a:char.a:char."\<ESC>i"
  endif
endf 
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s
"------------------------------------------------
"用于支持DB 协议查找 ：cmd<->function<->in<->out
function! Proto_find() 
	"得到光标下的单词
	let curword=expand("<cword>")
 	python get_proto_key(vim.eval("curword"),"find_word" )
	"设置搜索寄存器
	let  @/ = find_word 
	call histadd("/", find_word )
	"查找下一个..
	exec "normal! n"
endfunction


"得到光标下的单词
function! GetCurWord()
	return expand("<cword>")
endfunc

function! s:UserDefPython()
python << PYTHONEOF
import re
import sys 
import vim 
def get_proto_key(word,stroe_name):
	if (word.isupper()):
		word=word.lower();

	if  re.search ("_in$", word ): value= word[:-3] 
	elif  re.search ("_in_header$", word ): value=word[:-10] 
	elif  re.search ("_out_header$", word ): value=word[:-11] 
	elif  re.search ("_out$", word ): value=word[:-4] 
	elif  re.search ("_cmd$", word ): value=word[:-4].lower() 
	elif  re.search ("_out_item$", word ): value=word[:-9] 
	elif  re.search ("_in_item$", word ): value=word[:-8] 
	else: value=word 
	if value!= word: 
		key="\<%s_cmd\>\|\<%s_CMD\>\|\<%s\>\|\<%s_in\>\|\<%s_in_header\>\|\<%s_out_header\>\|\<%s_out\>\|\<%s_in_item\>\|\<%s_out_item\>"%(value,value.upper(), 
					 value,value,value,value,value,value,value)	
	else: key=word
	vim.command("silent let %s='%s'" % (stroe_name,key))
PYTHONEOF
endfunction

if has('python')
    call s:UserDefPython()
endif

autocmd BufRead,BufNewFile *.py set ai
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

autocmd BufRead *.as set filetype=actionscript
autocmd BufRead *.mxml set filetype=mxml


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
  set csprg=/usr/bin/cscope
  set csto=1
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
      cs add cscope.out
  endif
  set csverb
endif
"cscope 使用quickfix
set cscopequickfix=s+
nmap ,s :cs find s <C-R>=expand("<cword>")<CR><CR><Esc>:copen<CR>:let g:fx_toggle=1<CR>
nmap ,S :cs find s 
"for cmake ':make' ,由于定位错误,中文会有问题，如下调整
if finddir("build") == "build"
    set makeprg=export\ LANG=zh_CN:en;make\ -C\ ./build
endif


set backupdir=~/.vim/bakupdir
set backup

"set completeopt=menuone,preview,longest

