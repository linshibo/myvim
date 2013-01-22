"---------------------------------------------------------------------------
"add to   .vimrc
"source ~/.vim/comm.vim
"---------------------------------------------------------------------------

"enable pathogen , 必须在最上方 
try
	runtime bundle/vim-pathogen/autoload/pathogen.vim
	call pathogen#infect()
	call pathogen#helptags()
catch
endtry

"---------------------------------------------------------------------------
"GENERAL SET
"---------------------------------------------------------------------------

"escalt 允许终端中绑定alt键{
let g:loaded_escalt = 1
"}

"Sets how many lines of history VIM har to remember
set history=400

let mapleader =","

" Enable filetype plugins
filetype plugin on
filetype indent on
"语法
syntax enable
syntax on
"备份
set backup
set backupdir=~/.vim/bakupdir
set noswapfile

"Get out of VI's compatible mode..
set nocp
"disable alt
set winaltkeys=no
"tags 位置
set tags=~/.vim/bundle/myfix/comm_tags,tags; 
 
"折叠
set foldmethod=syntax
""默认情况下不折叠
set foldlevel=99
"nnoremap <Space> za

" => Vim grep
let Grep_Skip_Dirs = 'tags RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH

"重新打开时自动定位到原来的位置
autocmd BufReadPost *
	\ if line("'\"") > 0 && line ("'\"") <= line("$") |
	\   exe "normal! g'\"" |
	\ endif
"转换paste
autocmd InsertLeave * if &paste == 1|set nopaste |endif

" ENCODING SETTINGS
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gb2312,big5,euc-jp,euc-kr,latin1

"自动更新cpp修改时间
autocmd BufWritePre,FileWritePre *.cpp,*.c,*.h,*.hpp exec "normal ms"|call LastModified()|exec "normal `s"

"for cmake ':make' ,由于定位错误,中文会有问题，如下调整
if finddir("build") == "build"
    set makeprg=export\ LANG=zh_CN:en;make\ -C\ ./build
endif

set scrolloff=3 " 距离垂直边界 n 行就开始滚动
set sidescroll=1 " 水平滚动列数
set sidescrolloff=10 " 距离水平边界 n 行就开始滚动

"Favorite filetypes
set ffs=unix,mac

set guifont=Bitstream\ Vera\ Sans\ Mono\ 11 
colorscheme desert

"显示命令
set showcmd
"Include search
set incsearch
"no highlight search
set nohlsearch

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

"鼠标和剪贴板
set mouse=v
set clipboard=unnamed
" Height of the command bar
set cmdheight=2

" Wildmenu completion , Cool tab completion stuff{
set wildmenu
set wildmode=list:longest,full
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code
set wildignore+=migrations                       " Django migrations
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files
" Clojure/Leiningen
set wildignore+=classes
set wildignore+=lib
" Ignore compiled files
set wildignore=*.o,*~,*.pyc
" }

"Always show current position
set ruler
" enables automatic C program indenting
set autoindent
set smartindent 
set cindent 
set smarttab
set expandtab " 开启把Tab扩展为空格
set tabstop=4 " 设置Tab宽度为4个字符
set softtabstop=4 " 软缩进宽度
set shiftwidth=4 " 设置移动代码块宽度
set shiftround " 移动代码块时取整到缩进宽度
" autoread when a file is changed from the outside
set autoread
" write buffer when leaving
set autowrite
" Don't redraw while executing macros (good performance config)
set lazyredraw
"退格键能删除
set backspace=indent,eol,start
set whichwrap+=<,>
" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Highlight VCS conflict markers
syn match ErrorMsg '^\(<\|=\|>\)\{7}\([^=].\+\)\?$'

"----------------------------------------------------------------------------
"MAP BIND
"----------------------------------------------------------------------------
"use jj replace esc 
inoremap jj <Esc>
"A add num
"nnoremap A <C-A>
"X minus num
"nnoremap X <C-X>
"begin of line
nnoremap <C-a> ^
"end of line
nnoremap <C-e> $

nnoremap ,q <Esc>:q!<CR>
nnoremap ,w <Esc>:w!<CR>
" sudo write this
nnoremap ,W <Esc>:w !sudo tee % >/dev/null<CR>
nnoremap ,e <Esc>:e 
nnoremap ,x <Esc>:!

"cmd model map
cnoremap <C-A> <HOME>
cnoremap <C-E> <END>
cnoremap <C-D> <DELETE>
cnoremap <C-B> <LEFT>
cnoremap <C-F> <RIGHT>
cnoremap <C-P> <UP>
cnoremap <C-N> <DOWN>

"tabedit
nnoremap ,te <Esc>:tabedit 
nnoremap <C-p> <C-PageUp>
nnoremap <C-n> <C-PageDown>

"查找当前光标下的单词
nnoremap ,g <Esc>:call P_grep_curword()<CR>
"nnoremap ,g <Esc>:grep 

nnoremap ,r <Esc>:call RESET_CTAG_CSCOPE()<CR>
nnoremap ,m <Esc>:make<CR><CR>
"map ,y    <Esc>:call OPT_RANGE("ya")<CR>
"map ,Y    <Esc>:call OPT_RANGE("yi")<CR>
"map ,d    <Esc>:call OPT_RANGE("da")<CR>
"map ,D    <Esc>:call OPT_RANGE("di")<CR>
"转换单词大小写
nnoremap ,u <Esc>:call SET_UAW()<CR>

"支持粘贴
inoremap kk <Esc>:set paste<CR>i
  
command! Wq wq
command! W w

"vimtips 
command! -nargs=0 VIMTIPS  :tabe | :r ! w3m -dump http://zzapper.co.uk/vimtips.html 

"括号相关
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap " ""<ESC>i
inoremap ' ''<ESC>i
autocmd Syntax html,vim inoremap < <lt>><ESC>i| inoremap > <c-r>=ClosePair('>')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=CloseBracket()<CR>
"inoremap <CR> <c-r>=Fix_cr()<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>
inoremap { <c-r>=SET_BIG_PAIR()<CR>

"窗口间移动
nnoremap \l  <Esc>[I
nnoremap \w <Esc><C-W><C-W>
nnoremap \h <Esc><C-W>h
nnoremap \l <Esc><C-W>l
nnoremap \j <Esc><C-W>j
nnoremap \k <Esc><C-W>k

"Fast reloading of the .vimrc
nnoremap \s <ESC>:source ~/.vimrc<cr>
"Fast editing of .vimrc
nnoremap \e <ESC>:e! ~/.vim/comm.vim<cr>

"Switch to current dir
nnoremap ,cd <ESC>:cd %:p:h<cr>

"在正常模式下的整块移动
if g:loaded_escalt == 0
	"大括号内向左移
	nnoremap <C-H> <Esc><i{
	"大括号内向右移
	nnoremap <C-L> <Esc>>i{
	"选择区移动
	vnoremap <C-L> <Esc>:call SET_BLOCK_MOVE_V(0) <CR>
	vnoremap <C-H> <Esc>:call SET_BLOCK_MOVE_V(1) <CR>
else
	"大括号内向左移
	noremap <A-h> <Esc><i{
	"大括号内向右移
	noremap <A-l> <Esc>>i{
	"选择区移动
	vnoremap <A-l> <Esc>:call SET_BLOCK_MOVE_V(0) <CR>
	vnoremap <A-h> <Esc>:call SET_BLOCK_MOVE_V(1) <CR>
endif
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

"quick fix toggle
nnoremap <F4> <Esc>:call ToggleQF()<CR>
nnoremap ,cn <Esc>:cn<CR>
nnoremap ,cp <Esc>:cp<CR>

"用于支持代码补全时，提示存在。
set complete=.,w,b,u,t
set completeopt=longest,menuone,preview
inoremap <expr> <CR> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"
inoremap <expr> <M-;> pumvisible() ? "\<c-n>" : "\<c-x>\<c-o>\<c-n>\<c-p>\<c-r>=pumvisible() ? \"\\<down>\" : \"\\<cr>\""
inoremap <expr> <C-U>  pumvisible()?"\<C-E>":"\<C-U>"
inoremap <C-]> <C-X><C-]>
inoremap <C-F> <C-X><C-F>
inoremap <C-D> <C-X><C-D>
inoremap <C-L> <C-X><C-L>
" 用于支持 . -> 代码补全
inoremap   <expr> <Backspace>  Ex_bspace() 
inoremap   <expr> <Space>  Ex_space("\<Space>") 

"---------------------------------------------------------------------------
"插件设置
"---------------------------------------------------------------------------

"a.vim {
nnoremap ,a <Esc>:A<CR>
"}

"FencView {
let g:fencview_autodetect = 1                      
nnoremap <F7> :FencView<CR>
"}

"NERD_tree{
" Open and close the NERD_tree.vim separately
nnoremap ,nt <ESC>:NERDTreeToggle<CR>
"}

"YankRing {
nnoremap <silent> ,p <Esc>:YRShow<CR> 
let g:yankring_replace_n_pkey = '<m-p>'
let g:yankring_replace_n_nkey = '<m-n>'
let g:yankring_history_dir = '~/.vim/'
"}

" lookupfile setting{
let g:LookupFile_MinPatLength = 2               "最少输入2个字符才开始查找
let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串
let g:LookupFile_PreservePatternHistory = 1     "保存查找历史
let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件
let g:LookupFile_LookupFunc = 'LookupFile_IgnoreCaseFunc' 
if filereadable("./tags")                "设置tag文件的名字
	let g:LookupFile_TagExpr = '"./tags"'
endif
nnoremap ,f <Esc>:LUTags<CR>
"nnoremap <silent> ,ll :LUBufs<cr>
"nnoremap <silent> <leader>lw :LUWalk<cr>
" }

" omnicppcomplete{
let OmniCpp_ShowScopeInAbbr = 1
"支持STL模板
let OmniCpp_DefaultNamespaces   = ["std", "_GLIBCXX_STD"]
let OmniCpp_MayCompleteScope =1
let OmniCpp_SelectFirstItem = 1
" }

" cscope setting {
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
"nnoremap ,s :cs find s <C-R>=expand("<cword>")<CR><CR>
nnoremap ,s :cs find s <C-R>=expand("<cword>")<CR><CR>
nnoremap ,S :cs find s 
" }

"powerline{ 状态栏
set guifont=PowerlineSymbols\ for\ Powerline
set laststatus=2
set t_Co=256
let g:Powerline_symbols = 'unicode'
"}

"Doxygen插件{
let g:DoxygenToolkit_briefTag_pre="@brief  " 
let g:DoxygenToolkit_paramTag_pre="@param  " 
let g:DoxygenToolkit_returnTag="@return  " 
"let g:DoxygenToolkit_blockHeader="----------------------------------------------------------------------------"
"let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------" 
let g:DoxygenToolkit_authorName="francisco" 
nnoremap \f :Dox<CR>
"map \a :DoxAuthor<CR>
"map \b :DoxBlock<CR>
"}

"rainbow_parenthsis_options.vimbow {
let g:rainbow_active = 1
let g:rainbow_operators = 1
"}

" markbrowser setting{
nnoremap <silent> <F6> <Esc>:MarksBrowser<cr>
nnoremap <silent> ,zz <Esc>:MarksBrowser<cr>
" }

" bufexplorer setting{
let g:bufExplorerDefaultHelp=1 " Do not show default help.
let g:bufExplorerShowRelativePath=1 " Show relative paths.
let g:bufExplorerSortBy='mru' " Sort by most recently used.
let g:bufExplorerSplitRight=0 " Split left.
let g:bufExplorerSplitVertical=1 " Split vertically.
let g:bufExplorerSplitVertSize = 35 " Split width
let g:bufExplorerUseCurrentWindow=1 " Open in new window.
let g:bufExplorerMaxHeight=25 " Max height
noremap <silent> <F2> <Esc>:BufExplorer<CR>
noremap <silent> ,b :BufExplorer<CR>
" }

" Tagbar setting{
let g:tagbar_width = 30 
let g:tagbar_expand = 0
nnoremap <silent> <F3> <Esc>:TagbarToggle<cr>
nnoremap <silent> ,tb <Esc>:TagbarToggle<cr>
" }

"xml.vim{
let xml_use_xhtml = 1
"let xml_no_auto_nesting = 1
let html_use_css = 1
let html_number_lines = 0
let use_xhtml = 1
"}

"----------------------------------------------------------------------------
" FileType related
"----------------------------------------------------------------------------

""""""""""""
"general
""""""""""""
autocmd BufEnter *  set tabstop=4 
" use syntax complete if nothing else available
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
              \ if &omnifunc == "" |
              \ setlocal omnifunc=syntaxcomplete#Complete |
              \ endif
endif

""""""""""""
"c c++
""""""""""""
"autocmd BufEnter *.cpp,*.c,*.h call s:SET_TAGS() 
"autocmd BufEnter *.php call s:SET_TAGS() 
autocmd BufEnter  *.cpp,*.c,*.h call s:SET_PATH("include") 
autocmd BufEnter /usr/include/c++/*  set tabstop=8  
autocmd BufEnter ~/.vim/cpp_src/*  set filetype=cpp
autocmd FileType c set omnifunc=ccomplete#Complete
".c  .h 文件设为 .cpp
autocmd BufEnter *.c  set filetype=cpp
autocmd BufEnter *.h  set filetype=cpp

""""""""""""
"php
""""""""""""
autocmd BufEnter  *.php call s:SET_PATH("pub") 

""""""""""""
"python
""""""""""""
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd BufRead,BufNewFile *.py set ai
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

""""""""""""
" HTML 
""""""""""""
au FileType html set ft=xml
au FileType html set syntax=html
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd BufRead *.mxml set filetype=mxml

""""""""""""
" Vim 
""""""""""""
autocmd FileType vim set nofen
autocmd FileType vim map <buffer> <leader><space> :w!<cr>:source %<cr>

""""""""""""
"others
""""""""""""
" Enable omni completion. (Ctrl-X Ctrl-O)
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType java set omnifunc=javacomplete#Complete
autocmd BufRead *.as set filetype=actionscript


"----------------------------------------------------------------------------
" FUNCTIONS
"----------------------------------------------------------------------------
" lookup file with ignore case
function! LookupFile_IgnoreCaseFunc(pattern)
    let _tags = &tags
    try
        let &tags = eval(g:LookupFile_TagExpr)
        let newpattern = '\c' . a:pattern
        let tags = taglist(newpattern)
    catch
        echohl ErrorMsg | echo "Exception: " . v:exception | echohl NONE
        return ""
    finally
        let &tags = _tags
    endtry

    " Show the matches for what is typed so far.
    let files = map(tags, 'v:val["filename"]')
    return files
endfunction

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

" Visual mode related
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

"自动更新 修改时间
function! LastModified()
    if search("\\/\\*LastModified: \\d\\{4}-\\d\\{2}-\\d\\{2} \\d\\{2}:\\d\\{2}:\\d\\{2}\\*\\/","","")>0
    "if search("\\/\\*LastModified: \\d\\{4}-\\d\\{2}-\\d\\{2} \\d\\{2}:\\d\\{2}:\\d\\{2}\\*\\/","",line("$"))>0
        exe "silent! $,$g/$/s/LastModified: .*/LastModified: " .
            \ strftime("%Y-%m-%d %H:%M:%S") . "\\*\\/"
    else
        exe "silent! $,$g/$/s/$/\r\\/\\*LastModified: " .
            \ strftime("%Y-%m-%d %H:%M:%S") . "\\*\\/"
    endif
endfunc

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

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
	exe "normal mz"
	%s/\s\+$//ge
	exe "normal `z"
endfunc

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
		set tags+=~/.vim/bundle/myfix/comm_tags
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

"upper case
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
	exec "Ack " . curword . "./"
endfunction

function! Do_CsTag()
    if(executable('cscope') && has("cscope") )
        silent! execute "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.hpp' > cscope.files"
        silent! execute "!cscope -bkq"
        if (filereadable("cscope.out"))
		    execute "cs reset"
        endif
    endif
endf

function! Do_Ctag() 
    if(executable('ctags'))
        silent! execute "!rm -f tags"
        silent! execute "!ctags -R  --languages=c,c++ --c++-kinds=+p --fields=+iaS --extra=+q ."
    endif
endfunction


function! RESET_CTAG_CSCOPE() 
	"!~/.vim/./bundle/myfix/mtags.sh 
    call Do_Ctag()
    call Do_CsTag()
    exec "redraw!"
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

"获取选择模式的内容
function! s:GetVisualSelection()
    let save_a = @a
    silent normal! gv"ay
    let v = @a
    let @a = save_a
    let var = escape(v, '\\/.$*')
    return var
endfunction

"set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s
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
