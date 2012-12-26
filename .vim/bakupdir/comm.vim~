"===========================
let g:Author="francisco"
let g:Email="francisco@taomee.com"
let g:Company="TAOMEE"
"===========================

"---------------------------------------------------------------------------
"GENERAL SET
"---------------------------------------------------------------------------
" Enable filetype plugins
filetype plugin on
filetype indent on
"语法
syntax enable
syntax on

"Sets how many lines of history VIM har to remember
set history=400

set smarttab
"显示命令
set showcmd
"Get out of VI's compatible mode..
set nocp
"tags 位置
set tags=~/.vim/tags,~/.vim/tags_cpp,tags; 

set laststatus=2
set guifont=Bitstream\ Vera\ Sans\ Mono\ 11 
colorscheme desert

"------------------------------------------------
"let g:solarized_termcolors=   256
"let g:solarized_termtrans =   1
"let g:solarized_contrast  =   "hight"
"let g:solarized_visibility=   "normal"
"let g:solarized_hitrail   =   0 
"colorscheme solarized
"set background=dark
"------------------------------------------------

"Include search
set incsearch
"no highlight search
set nohlsearch

"set num
"powerline{ 状态栏
set guifont=PowerlineSymbols\ for\ Powerline
set t_Co=256
"let g:Powerline_symbols = 'fancy'
"}
"
"鼠标和剪贴板
set mouse=v
set clipboard=unnamed
"备份
set backup
set backupdir=~/.vim/bakupdir
set noswapfile
" Height of the command bar
set cmdheight=2
" Cool tab completion stuff
set wildmenu
set wildmode=list:longest,full
" Ignore compiled files
set wildignore=*.o,*~,*.pyc
"Always show current position
set ruler
" enables automatic C program indenting
set autoindent
set smartindent 
set cindent 
set shiftwidth=4
set tabstop=4
" autoread when a file is changed from the outside
set autoread
" write buffer when leaving
set autowrite
" Don't redraw while executing macros (good performance config)
set lazyredraw
"Bbackspace and cursor keys wrap to
"退格键能删除
set backspace=indent,eol,start
set whichwrap+=<,>
"折叠
set foldmethod=syntax
""默认情况下不折叠
set foldlevel=99
"nnoremap <Space> za
"
"When .vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH

set path += "/usr/include/dbser/"
"/usr/include/libtaomee/","/usr/include/libtaomee++/","/usr/local/include/async_serv/"
""
"---------------------------------------------------------------------------
" ENCODING SETTINGS
"---------------------------------------------------------------------------
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gb2312,big5,euc-jp,euc-kr,latin1

"---------------------------------------------------------------------------
"进行Tlist的设置
"TlistUpdate可以更新tags
"---------------------------------------------------------------------------
"map <F2> :silent! Tlist<CR>
"let Tlist_Ctags_Cmd='ctags' "因为我们放在环境变量里，所以可以直接执行
"let Tlist_Use_Right_Window=0 "让窗口显示在右边，0的话就是显示在左边
"let Tlist_Show_One_File=0 "让taglist可以同时展示多个文件的函数列表，如果想只有1个，设置为1
"let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏
"let Tlist_Exit_OnlyWindow=1 "当taglist是最后一个分割窗口时，自动推出vim
"let Tlist_Process_File_Always=0 "是否一直处理tags.1:处理;0:不处理。不是一直实时更新tags，因为没有必要
"let Tlist_Inc_Winwidth=0
"---------------------------------------------------------------------------

"---------------------------------------------------------------------------
" Visual mode related
"---------------------------------------------------------------------------
function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif
    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

"---------------------------------------------------------------------------
"Doxygen插件
"---------------------------------------------------------------------------
let g:DoxygenToolkit_briefTag_pre="@brief  " 
let g:DoxygenToolkit_paramTag_pre="@param  " 
let g:DoxygenToolkit_returnTag="@return  " 
let g:DoxygenToolkit_blockHeader="----------------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------" 
let g:DoxygenToolkit_authorName="francisco" 
map \f :Dox<CR>
map \a :DoxAuthor<CR>
"map \b :DoxBlock<CR>
"
"-------------------------------------------------------------------------
"rainbow_parenthsis_options.vimbow 
"---------------------------------------------------------------------------
let g:rainbow_active = 1
let g:rainbow_operators = 1

"-------------------------------------------------------------------------
"quickfix 开关 
"---------------------------------------------------------------------------
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
nmap ,n <Esc>:cn<CR>
nmap ,p <Esc>:cp<CR>

"----------------------------------------------------------------------------
"map
"----------------------------------------------------------------------------
"查找当前光标下的单词
map ,f <Esc>:call P_grep_curword()<CR>
map ,q <Esc>:q!<CR>
map ,w <Esc>:w!<CR>
" sudo write this
map ,W <Esc>:w !sudo tee % >/dev/null<CR>
map ,e <Esc>:e 
map ,x <Esc>:!

cmap <C-A> <HOME>
cmap <C-E> <END>
cnoremap <C-D> <DELETE>
cnoremap <C-B> <LEFT>
cnoremap <C-F> <RIGHT>
cnoremap <C-P> <UP>
cnoremap <C-N> <DOWN>

"tabedit
nmap ,t <Esc>:tabedit 
nmap <C-P> <C-PageUp>
nmap <C-N> <C-PageDown>

"Smart way to move btw. windows
nmap <C-j> <Esc><C-W>j
nmap <C-k> <Esc><C-W>k
"nmap <C-h> <Esc><C-W>h
"nmap <C-l> <Esc><C-W>l

map ,a <Esc>:A<CR>
map ,g <Esc>:grep 
map ,r <Esc>:call RESET_TAG() <CR> <CR>
map ,m <Esc>:make<CR><CR>
map ,y    <Esc>:call OPT_RANGE("ya")<CR>
map ,Y    <Esc>:call OPT_RANGE("yi")<CR>
map ,d    <Esc>:call OPT_RANGE("da")<CR>
map ,D    <Esc>:call OPT_RANGE("di")<CR>
"转换单词大小写
nmap ,u <Esc>:call SET_UAW()<CR>
"支持粘贴
map <F9> <Esc>:set paste<CR>i

command! Wq wq
command! W w

"vimtips 
command! -nargs=0 VIMTIPS  :tabe | :r ! w3m -dump http://zzapper.co.uk/vimtips.html 

" Open and close the NERD_tree.vim separately
nmap <F5> <ESC>:NERDTreeToggle<RETURN>

":RENEW
"command! -nargs=0 RENEW  :source ~/.vim/comm.vim

"括号相关
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

nmap \l  <Esc>[I
nmap \w <Esc><C-W><C-W>
nmap ,h <Esc><C-W>h
nmap ,l <Esc><C-W>l
nmap ,j <Esc><C-W>j
nmap ,k <Esc><C-W>k

"Fast reloading of the .vimrc
nmap \s <ESC>:source ~/.vimrc<cr>
"Fast editing of .vimrc
nmap \e <ESC>:e! ~/.vimrc<cr>

"Switch to current dir
nmap ,cd <ESC>:cd %:p:h<cr>

""""""""""""""""""""""""""""""
" markbrowser setting
""""""""""""""""""""""""""""""
nmap <silent> <F6> <Esc>:MarksBrowser<cr>

""""""""""""""""""""""""""""""
" showmarks setting
""""""""""""""""""""""""""""""
" Enable ShowMarks
let showmarks_enable = 1
" Show which marks
let showmarks_include = "abcdefghilnpqrsuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
" Ignore help, quickfix, non-modifiable buffers
let showmarks_ignore_type = "hqm"
" Hilight lower & upper marks
let showmarks_hlline_lower = 1
let showmarks_hlline_upper = 1
let g:showmarks_ignore_type=""
let g:showmarks_textlower="\t"
let g:showmarks_textupper="\t"
let g:showmarks_textother="\t"
let g:showmarks_auto_toggle = 0
nnoremap <silent> mo :ShowMarksOn<CR>
nnoremap <silent> mt <ESc>:ShowMarksToggle<CR>

""""""""""""""""""""""""""""""
" wokmark setting
""""""""""""""""""""""""""""""
let g:wokmarks_do_maps = 0
let g:wokmarks_pool = "abcdefghijklmnopqrstuvwxyz"
map mm <Plug>ToggleMarkWok
map mj <Plug>NextMarkWok
map mk <Plug>PrevMarkWok
map <M-Left> <Plug>SetMarkWok
map <M-Right> <Plug>ToggleMarkWok
map <M-Up> <Plug>PrevMarkWok
map <M-Down> <Plug>NextMarkWok
autocmd User WokmarksChange :ShowMarksOn

""""""""""""""""""""""""""""""
" bufexplorer setting
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=1 " Do not show default help.
let g:bufExplorerShowRelativePath=1 " Show relative paths.
let g:bufExplorerSortBy='mru' " Sort by most recently used.
let g:bufExplorerSplitRight=0 " Split left.
let g:bufExplorerSplitVertical=1 " Split vertically.
let g:bufExplorerSplitVertSize = 35 " Split width
let g:bufExplorerUseCurrentWindow=1 " Open in new window.
let g:bufExplorerMaxHeight=25 " Max height
noremap <silent> <F2> <Esc>:BufExplorer<CR>

"""""""""""""""""""""""""""""
" Tagbar setting
""""""""""""""""""""""""""""""
let g:tagbar_width = 30 
let g:tagbar_expand = 0
nmap <silent> <F3> <Esc>:TagbarToggle<cr>

"------------------------------------------------------------------------------
"获取当前路径的上一级的路径
"---------------------------------------------------------------------------
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

"---------------------------------------------------------------------------
"设置相关tags
"---------------------------------------------------------------------------
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


"---------------------------------------------------------------------------
"设置相关 include , for cmd : gf 
"---------------------------------------------------------------------------
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

"---------------------------------------------------------------------------
"用于支持代码补全时，提示存在。
"---------------------------------------------------------------------------
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"
inoremap <expr> <M-;> pumvisible() ? "\<c-n>" : "\<c-x>\<c-o>\<c-n>\<c-p>\<c-r>=pumvisible() ? \"\\<down>\" : \"\\<cr>\""
inoremap <expr> <C-U>      pumvisible()?"\<C-E>":"\<C-U>"
inoremap <C-]> <C-X><C-]>
inoremap <C-F> <C-X><C-F>
inoremap <C-D> <C-X><C-D>
inoremap <C-L> <C-X><C-L>

" Enable omni completion. (Ctrl-X Ctrl-O)
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType java set omnifunc=javacomplete#Complete


func! DeleteTrailingWS()
exe "normal mz"
%s/\s\+$//ge
exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

" use syntax complete if nothing else available
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
              \ if &omnifunc == "" |
              \ setlocal omnifunc=syntaxcomplete#Complete |
              \ endif
endif

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
autocmd BufRead,BufNewFile *.py set ai
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufRead *.as set filetype=actionscript
autocmd BufRead *.mxml set filetype=mxml

"""""""""""""""""""""""""""""
" HTML related
""""""""""""""""""""""""""""""
" HTML entities - used by xml edit plugin
let xml_use_xhtml = 1
"let xml_no_auto_nesting = 1
"To HTML
let html_use_css = 1
let html_number_lines = 0
let use_xhtml = 1

"""""""""""""""""""""""""""""""
" Vim section
"""""""""""""""""""""""""""""""
autocmd FileType vim set nofen
autocmd FileType vim map <buffer> <leader><space> :w!<cr>:source %<cr>

""""""""""""""""""""""""""""""
" HTML
"""""""""""""""""""""""""""""""
au FileType html set ft=xml
au FileType html set syntax=html


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
	"copen
	"let g:fx_toggle=1
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

autocmd InsertLeave * if &paste == 1|set nopaste |endif


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


"----------------------------------------------------------------------------
"定位到原来的位置
"----------------------------------------------------------------------------
autocmd BufReadPost *
	\ if line("'\"") > 0 && line ("'\"") <= line("$") |
	\   exe "normal! g'\"" |
	\ endif

"支持STL模板
let OmniCpp_DefaultNamespaces   = ["std", "_GLIBCXX_STD"]
let OmniCpp_SelectFirstItem = 2

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
"set cscopequickfix=s+
nmap ,s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap ,S :cs find s 
"for cmake ':make' ,由于定位错误,中文会有问题，如下调整
if finddir("build") == "build"
    set makeprg=export\ LANG=zh_CN:en;make\ -C\ ./build
endif

