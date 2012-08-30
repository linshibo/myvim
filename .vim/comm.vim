"if    if switch for class struct main while 
"hd    文件头部定义
"ff    ifndef –def –endif  .h 文件中使用
"in    #include  “”
"is    #include <>
"ih    #include <自身文件名.h>
"ihpp  #include <自身文件名.hpp>
"xt    当前时间

"===========================
let g:Author="francisco"
let g:Email="francisco@taomee.com"
let g:Company="TAOMEE"
"===========================

filetype plugin on
syntax enable
syntax on
colorscheme desert
set backspace=indent,eol,start
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



"---------------------------------------------------------------------------
"Doxygen插件
let g:DoxygenToolkit_briefTag_pre="@brief  " 
let g:DoxygenToolkit_paramTag_pre="@param  " 
let g:DoxygenToolkit_returnTag="@return  " 
let g:DoxygenToolkit_blockHeader="----------------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------" 
let g:DoxygenToolkit_authorName="francisco" 
"let g:DoxygenToolkit_licenseTag="My own license" let g:doxygenToolkit_briefTag_funcName="yes" map <F3>f :Dox
map <F3>f :Dox<CR>
map <F3>a :DoxAuthor
map <F3>b :DoxBlock
"---------------------------------------------------------------------------


map ,w <Esc>:w!<CR> 
map ,q <Esc>:q!<CR> 
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

autocmd BufEnter *.php call s:SET_TAGS() 

autocmd BufEnter  *.cpp,*.c,*.h call s:SET_PATH("include") 
autocmd BufEnter  *.php call s:SET_PATH("pub") 

autocmd BufEnter *  set tabstop=4 
autocmd BufEnter /usr/include/c++/*  set tabstop=8  
autocmd BufEnter ~/.vim/cpp_src/*  set filetype=cpp

autocmd BufEnter *    if ( &filetype == "php" )| map ,i <Esc>:e ~/DB/su/pub/| else | map ,i <Esc>:e ~/DB/include/| endif

"用于支持代码补全时，提示存在。
"set completeopt=menuone,longest  
"set completeopt=menuone
inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"
inoremap <expr> <m-;> pumvisible() ? "\<c-n>" : "\<c-x>\<c-o>\<c-n>\<c-p>\<c-r>=pumvisible() ? \"\\<down>\" : \"\\<cr>\""

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


"功能说明:加入或删除注释//
"映射和绑定
"nmap <C-C> <Esc>:Setcomment<CR>
"imap <C-C> <Esc>:Setcomment<CR>
"vmap <C-C> <Esc>:SetcommentV<CR>
"command! -nargs=0 Setcomment call s:SET_COMMENT()
"command! -nargs=0 SetcommentV call s:SET_COMMENTV()
"
"非视图模式下所调用的函数
function! s:SET_COMMENT()
	let lindex=line(".")
	let str=getline(lindex)
	"查看当前是否为注释行
	let CommentMsg=s:IsComment(str)
	call s:SET_COMMENTV_LINE(lindex,CommentMsg[1],CommentMsg[0])
endfunction

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


function! MAKE_CUR_FILE()
	let cur_file= expand("%f")
	"split 

	exec "normal! gUaw"
endfunction



"视图模式下所调用的函数
function! s:SET_COMMENTV()
	let lbeginindex=line("'<") "得到视图中的第一行的行数
	let lendindex=line("'>") "得到视图中的最后一行的行数
	let str=getline(lbeginindex)
	"查看当前是否为注释行
	let CommentMsg=s:IsComment(str)
	"为各行设置
	let i=lbeginindex	
	while i<=lendindex
		call s:SET_COMMENTV_LINE(i,CommentMsg[1],CommentMsg[0])
		let i=i+1
	endwhile
endfunction

"设置注释 
"index:在第几行
"pos:在第几列
"comment_flag: 0:添加注释符 1:删除注释符
function! s:SET_COMMENTV_LINE( index,pos, comment_flag )
	let poscur = [0, 0,0, 0]
	let poscur[1]=a:index
	let poscur[2]=a:pos+1
	call setpos(".",poscur) "设置光标的位置

	if a:comment_flag==0 
		"插入//
		exec "normal! i//"
	else 
		"删除//
		exec "normal! xx" 
	endif 
endfunction

"查看当前是否为注释行并返回相关信息
"str:一行代码
function! s:IsComment(str)
	let ret= [0, 0] "第一项为是否为注释行（0,1）,第二项为要处理的列，
	let i=0
	let strlen=len(a:str)
	while i<strlen
		"空格和tab允许为"//"的前缀
		if !(a:str[i]==' ' ||	 a:str[i] == '	' )
			let ret[1]=i
			if a:str[i]=='/' && a:str[i+1]=='/'
				let ret[0]=1
			else 
				let ret[0]=0
			endif
			return ret
		endif
		let i=i+1
	endwhile
	return [0,0]  "空串处理
endfunction

set fileencodings=ucs-bom,utf-8,gb2312,big5,euc-jp,euc-kr,latin1

set tabstop=4
set incsearch
set nohlsearch 
set cindent shiftwidth=4
command! Wq wq
command! W w
map <F7> <Esc>:call Proto_find() <CR>
map <F6> <Esc>:call Proto_find() <CR>

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
	exec "grep " . curword . " *.cpp *.c *.h *.hpp " 
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


map ,n :n<CR>
map ,N :N<CR>
map ,a :A<CR>
map ,g <Esc>:grep 

map ,r <Esc>:call RESET_TAG() <CR> <CR>
map ,m <Esc>:make<CR> 

map ,y    <Esc>:call OPT_RANGE("ya")<CR>
map ,Y    <Esc>:call OPT_RANGE("yi")<CR>
map ,d    <Esc>:call OPT_RANGE("da")<CR>
map ,D    <Esc>:call OPT_RANGE("di")<CR>
map ,c    <Esc>:call OPT_RANGE("ca")<CR>
map ,C    <Esc>:call OPT_RANGE("ci")<CR>

"转换单词大小写
map ,u <Esc>:call SET_UAW()<CR>

"支持粘贴
map ,p <Esc>:set paste<CR>i

autocmd InsertLeave * if &paste == 1|set nopaste |endif

"切换窗口
"map ,w <Esc>:tabn<CR><C-W><C-W><CR>

"map <F3> <Esc>yyp^6l<C-A>4l<C-A><Esc>
"ap <C-F12> :!ctags -R  --languages=c++ --c++-kinds=+p --fields=+iaS --extra=+q .<CR>


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

set smarttab
"set paste 
syn on
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

set mouse=
"set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s
"------------------------------------------------
"source ~/.vim/borland.vim
"
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
    "let szLine = getline('.')
    "let startPos = getpos('.')[2]-1
    "let startPos = (startPos < 0)? 0 : startPos
    "if szLine[startPos] =~ '\w'
        "let startPos = searchpos('\<\w\+', 'cbn', line('.'))[1] - 1
    "endif

    "let startPos = (startPos < 0)? 0 : startPos
    "let szResult = matchstr(szLine, '\w\+', startPos)
    "return szResult
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

nmap ,s :cs find s <C-R>=expand("<cword>")<CR><CR>

"for cmake ':make' ,由于定位错误,中文会有问题，如下调整
if finddir("build") == "build"
    set makeprg=export\ LANG=zh_CN:en;make\ -C\ ./build
endif


set backupdir=~/.vim/bakupdir
set backup

"set completeopt=menuone,preview,longest

