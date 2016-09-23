"---------------------------------------------------------------------------
"author:francisco 
"email:linshibo3456@gmail.com
"add to   .vimrc
"source ~/.vim/comm.vim
"---------------------------------------------------------------------------
set nocompatible
filetype off

"Vundle 管理
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" 让 Vundle 管理 Vundle
" 此条必须有
Plugin 'gmarik/Vundle.vim'

" 代码源在 github 上的
Plugin 'vim-scripts/FencView.vim'
""Plugin 'vim-scripts/OmniCppComplete'
Plugin 'vim-scripts/Tagbar'
Plugin 'vim-scripts/matchit.zip'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'vim-scripts/snipMate'
Plugin 'vim-scripts/a.vim'
Plugin 'vim-scripts/ack.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Shougo/unite.vim'
Plugin 'tpope/vim-surround'
Plugin 'bootleq/vim-cycle'
Plugin 'kana/vim-smartword'
Plugin 'altercation/vim-colors-solarized'
Plugin 'terryma/vim-multiple-cursors'
"Plugin 'fatih/vim-go'
Plugin 'plasticboy/vim-markdown'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'elzr/vim-json'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'klen/python-mode'
Plugin 'jelera/vim-javascript-syntax'
""Plugin 'guileen/vim-node-dict'
""Plugin 'ahayman/vim-nodejs-complete'
Plugin 'moll/vim-node'
""Plugin 'marijnh/tern_for_vim'
""Plugin 'digitaltoad/vim-jade'
""Plugin 'tell-k/vim-autopep8'
Plugin 'Rip-Rip/clang_complete'


call vundle#end()


" 代码存放在 vim script 上
"Bundle 'FuzzyFinder'
" 代码存放在其他地方
"Bundle 'git://git.wincent.com/command-t.git'

"---------------------------------------------------------------------------
"GENERAL SET
"---------------------------------------------------------------------------

"Sets how many lines of history VIM har to remember
set history=400

"map leader key ","
let mapleader ="\<Space>"

" Enable filetype plugins
filetype plugin indent on
"语法
syntax enable on

"备份
set backup
"备份目录 
if !isdirectory($HOME."/.vim/backupdir")
    silent! execute "!mkdir ~/.vim/backupdir"
endif
set backupdir=~/.vim/backupdir
"不产生.swap文件
set noswapfile

"中文帮助
set helplang=cn

"Get out of VI's compatible mode..
set nocompatible
"disable alt
set winaltkeys=no
"tags 位置
set tags=~/.vim/comm_tags,~/.vim/stl_tags,.tags,.gosource.tags

"折叠
set foldmethod=syntax
""默认情况下不折叠
set foldlevel=99
"set for gf 
set path+=/usr/include/c++/4.6/


"重新打开时自动定位到原来的位置
autocmd BufReadPost *
	\ if line("'\"") > 0 && line ("'\"") <= line("$") |
	\   exe "normal! g'\"" |
	\ endif
"转换paste
autocmd InsertLeave * if &paste == 1|set nopaste |endif

" ENCODING SETTINGS
let &termencoding = &encoding
set encoding=utf-8
set termencoding=utf-8
set fileencodings=ucs-bom,utf-8,gb2312,big5,euc-jp,euc-kr,latin1
language messages POSIX

"自动更新cpp修改时间
"autocmd BufWritePre,FileWritePre *.cpp,*.c,*.h,*.hpp exec "normal ms"|call LastModified()|exec "normal `s"

"for cmake ':make' ,由于定位错误,中文会有问题，如下调整
""if finddir("build") == "build"
    ""set makeprg=export\ LANG=zh_CN:en;make\ -C\ ./build
""endif

set scrolloff=5 " 距离垂直边界 n 行就开始滚动
set sidescroll=1 " 水平滚动列数
set sidescrolloff=10 " 距离水平边界 n 行就开始滚动

"Favorite filetypes
set fileformats=unix,mac
let g:os=substitute(system('uname'), '\n', '', '')
if has('gui_running') 
    if g:os == 'Linux' 
        set guifont=Monospace\ 14
    elseif g:os == 'Darwin' || g:os == 'Mac'
        set guifont=Monaco\ 18
    endif
    set guioptions-=T
    set guioptions+=e
    set guioptions-=r
    set guioptions-=L
    set guitablabel=%M\ %t
    set showtabline=1
    set linespace=2
    set noimd
endif

"主题 solarized 的配置必须在 colorscheme 之前 
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_hitrail   =   0
colorscheme solarized
set background="dark"
set cursorline

"显示命令
set showcmd

"Include search
set incsearch
"highlight search
set hlsearch

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
set matchpairs+=<:>

"鼠标和剪贴板
set mouse=v
set clipboard+=unnamed
" Height of the command bar
set cmdheight=1

" Wildmenu completion , Cool tab completion stuff{
set wildmenu
set wildmode=list:longest,full
" Ignore compiled files
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
set wildignore+=classes
set wildignore+=lib
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
"backspace and cursor keys wrap to
set whichwrap+=<,>

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Highlight VCS conflict markers
syn match ErrorMsg '^\(<\|=\|>\)\{7}\([^=].\+\)\?$'

"vimtips 
command! -nargs=0 VIMTIPS  :tabe | :r ! w3m -dump http://zzapper.co.uk/vimtips.html 

"----------------------------------------------------------------------------
"MAP BIND
"----------------------------------------------------------------------------
"use jj replace esc 
inoremap jj <Esc>

nnoremap gr gT

nnoremap \s :vsplit<CR>
nnoremap \h :split<CR>

""nmap  <F1> :help <C-R>=expand('<cword>')<CR><CR>

" }}} 跨 Vim 剪貼 {{{2
" http://vim.wikia.com/wiki/Transfer_text_between_two_Vim_instances
nmap \p :r $HOME/.vimxfer<CR>
vmap \y :w! $HOME/.vimxfer<CR>

nnoremap <Leader>q <Esc>:q!<CR>
nnoremap <Leader>w :w!<CR>:nohl<CR>

" sudo write this
nnoremap <Leader>W <Esc>:w !sudo tee % >/dev/null<CR>
nnoremap <Leader>e <Esc>:e 
nnoremap <Leader>x <Esc>:!

"cmd model map
cnoremap <C-A> <HOME>
cnoremap <C-E> <END>
cnoremap <C-D> <DELETE>
cnoremap <C-B> <LEFT>
cnoremap <C-F> <RIGHT>
cnoremap <C-P> <UP>
cnoremap <C-N> <DOWN>
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>


"查找当前光标下的单词
""nnoremap ,g :Ack <C-R>=expand('<cword>')<CR><CR>
nnoremap <Leader>g :exec "Ack " . expand('<cword>') ." --". &filetype<CR>
vnoremap <Leader>g :call VisualSelection('gv')<CR>
nnoremap <Leader>r <Esc>:call GEN_TAGS()<CR>
nnoremap <Leader>m <Esc>:call Make()<CR>
"nnoremap ,y <Esc>:call OPT_RANGE("ya")<CR>
"nnoremap ,Y <Esc>:call OPT_RANGE("yi")<CR>
"nnoremap ,d <Esc>:call OPT_RANGE("da")<CR>
"nnoremap ,D <Esc>:call OPT_RANGE("di")<CR>
"转换单词大小写
nnoremap <Leader>u <Esc>:call SET_UAW()<CR>

"Keep search pattern at the center of the screen."
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

nnoremap j gj
nnoremap k gk

" Go to home and end using capitalized directions
noremap H ^
noremap L $

"支持粘贴
inoremap kk <Esc>:set paste<CR>i

inoremap [ []<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
inoremap ( ()<Esc>i
inoremap { {}<Esc>i

"窗口间移动
nnoremap <C-H> <Esc><C-W>h
nnoremap <C-L> <Esc><C-W>l
nnoremap <C-J> <Esc><C-W>j
nnoremap <C-K> <Esc><C-W>k

nnoremap \\j :call ConvertToJson()<CR>

"Fast reloading of the .vimrc
nnoremap \\s <ESC>:source ~/.vim/comm.vim<cr>
"Fast editing of .vimrc
nnoremap \\e <ESC>:e! ~/.vim/comm.vim<cr>
"Switch to current dir
nnoremap <Leader>cd <ESC>:cd %:p:h<cr>

"在正常模式下的整块移动
"大括号内向左移
""nmap <F7> <Esc><i{
"大括号内向右移
""nmap <F8> <Esc>>i{
"选择区移动
vnoremap < <gv
vnoremap > >gv
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

"quick fix toggle
nnoremap <C-q> <Esc>:call ToggleQF()<CR>
nnoremap <Leader>n <Esc>:cn<CR>
nnoremap <Leader>p <Esc>:cp<CR>

"根据标签补全
inoremap <C-]> <C-X><C-]> 
"补全文件名
inoremap <C-F> <C-X><C-F> 
"补全宏定义
inoremap <C-D> <C-X><C-D>
"整行补全
inoremap <C-L> <C-X><C-L>
"根据头文件内关键字补全
inoremap <C-I> <C-X><C-I> 
"用户自定义补全方式   
inoremap <C-U> <C-X><C-U> 
"全能补全
inoremap <C-O> <C-X><C-O>
"用于支持代码补全时，提示存在。
set complete=.,w,b,u,t
set completeopt=longest,menuone
"当离开INSERT模式时，Preview窗口会自动关闭
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif
inoremap <expr><CR> pumvisible() ?"\<C-Y>" : "\<c-g>u\<cr>"
inoremap <expr><C-U>  pumvisible()?"\<C-E>":"\<C-U>"

"---------------------------------------------------------------------------
"插件设置
"python-mode{{{
let g:pymode_python = 'python'
let g:pymode_rope_lookup_project = 0
let g:pymode_rope = 0
let g:pymode_rope_goto_definition_bind = 'gd'
" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
let g:pymode_rope_autoimport = 0
let g:pymode_motion = 1
let g:pymode_breakpoint = 0
"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pep8"
let g:pymode_lint_ignore = "W"
" Auto check on save
let g:pymode_lint_write = 0
let g:pymode_lint_unmodified = 0
" Support virtualenv
let g:pymode_virtualenv = 1
" Don't autofold code
let g:pymode_folding = 0
"}}}
"
"clang complete{{{
let g:clang_library_path = "/usr/lib/llvm-3.4/lib"
let g:clang_user_options = "-I/usr/include/c++/4.6.3 -std=c++11"
"}}}

" YCM settings {{{
let g:ycm_key_list_select_completion = ['', '']
let g:ycm_key_list_previous_completion = ['']
let g:ycm_confirm_extra_conf = 0
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
nnoremap <C-s> :YcmCompleter GoTo<CR>
nnoremap <C-d> :YcmCompleter GoToDefinition<CR>
"}}}

"Nerdtree{{{
""autocmd StdinReadPre * let s:std_in=1
""autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif""))
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
nmap <C-e> :NERDTreeToggle<CR>
"}}}

"ack.vim{
if g:os == 'Linux' 
    set grepprg=/user/bin/ack-grep
    let g:ackprg="/usr/bin/ack-grep -H --nocolor --nogroup"
elseif g:os == 'Darwin' || g:os == 'Mac'
    let g:ackprg="/usr/local/bin/ack -H --nocolor --nogroup"
endif
"}

"vim-smartword{{{
nmap w  <Plug>(smartword-w)
nmap b  <Plug>(smartword-b)
nmap e  <Plug>(smartword-e)
nmap ge  <Plug>(smartword-ge)
"}}}


"a.vim {{{
au filetype cpp nnoremap <Leader>a <Esc>:A<CR>
"}}}
"

"unite{{{
nnoremap <Leader>f :Unite file<CR>
nnoremap <Leader>b :Unite buffer<CR>
"}}}

"vim-easymotion{{{
let g:EasyMotion_leader_key = '\'
"}}}

"FencView {{{
let g:fencview_autodetect = 1                      
"}}}

"YankRing {{{
let g:yankring_enabled = 1  " Disables the yankring
let g:yankring_max_history = 10
let g:yankring_min_element_length = 3
let g:yankring_max_display = 50 
let g:yankring_persist = 0
let g:yankring_history_dir = '~/.vim/'
let g:yankring_history_file='.yankring_history_file'
nnoremap <silent> <C-Y> :YRShow<CR> 
"}}}

" omnicppcomplete{{{
""let OmniCpp_ShowScopeInAbbr = 1
"支持STL模板
""let OmniCpp_DefaultNamespaces   = ["std", "_GLIBCXX_STD"]
"不自动选择第一个
""let OmniCpp_SelectFirstItem = 0
"使用本地搜索函数
""let OmniCpp_LocalSearchDecl = 1
"::补全
""let OmniCpp_MayCompleteScope =1
" }}}

" cscope setting {{{
"if has("cscope")
    "set csprg=/usr/bin/cscope
    "set csto=0
    "set cst
    "set nocsverb
    "" add any database in current directory
    "if filereadable("_cscope.out")
        "silent cs add _cscope.out
    "endif
    "set csverb
"endif
"au filetype cpp nnoremap ,s :cs find s <C-R>=expand("<cword>")<CR><CR>
"au filetype cpp vnoremap ,s :call  VisualSelection('cs')<CR>
"}}}

"powerline{{{ 状态栏
let g:Powerline_colorscheme = 'solarized256'
set laststatus=2
set t_Co=256
"}}}


" Tagbar setting{{{
let g:tagbar_width = 30 
let g:tagbar_expand = 0
let g:tagbar_autofocus = 1
nnoremap <silent> <F3> <Esc>:TagbarToggle<cr>
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }
" }}}

"xml.vim{{{
let xml_use_xhtml = 1
let html_use_css = 1
let html_number_lines = 0
let use_xhtml = 1
"}}}

"cycle.vim{{{
let g:cycle_no_mappings = 1
let g:cycle_max_conflict = 7
let g:cycle_phased_search = 1
nmap <silent> \a <Plug>CycleNext
vmap <silent> \a <Plug>CycleNext
let g:cycle_default_groups = [
\ [['true', 'false']],
\ [['yes', 'no']],
\ [['||', '&&']],
\ [['on', 'off']],
\ [['+', '-']],
\ [['++', '--']],
\ [['>', '<']],
\ [['.', '->']],
\ [['"', "'"]],
\ [['==', '!=']],
\ [['and', 'or']],
\ [['in', 'out']],
\ [['left', 'right']],
\ [['Left', 'Right']],
\ [['up', 'down']],
\ [['min', 'max']],
\ [['get', 'set']],
\ [['int', 'uint']],
\ [['32', '64']],
\ [['add', 'remove']],
\ [['to', 'from']],
\ [['read', 'write']],
\ [['next', 'previous', 'prev']],
\ [['without', 'with']],
\ [['exclude', 'include']],
\ [['width', 'height']],
\ [['asc', 'desc']],
\ [['start', 'end']],
\ [['east', 'west']],
\ [['south', 'north']],
\ [['prefix', 'suffix']],
\ [['decode', 'encode']],
\ [['short', 'long']],
\ [['pop', 'shift']],
\ [['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday',
\ 'Friday', 'Saturday'], ['hard_case', {'name': 'Days'}]],
\ [['{:}', '[:]', '(:)'], 'sub_pairs'],
\ [['（:）', '「:」', '『:』'], 'sub_pairs'],
\ ]
"}}}


"vim-go{{{
""let g:go_play_open_browser = 0
""By default vim-go shows errors for the fmt command, to disable it:
""let g:go_fmt_fail_silently = 1
""Disable auto fmt on save:
""let g:go_fmt_autosave = 0
""Disable goimports and use gofmt for the fmt command:
""let g:go_fmt_command = "gofmt"
""au FileType go nmap gd <Plug>(go-def)
""au FileType go nmap <Leader>d <Plug>(go-doc)
""au FileType go nmap <Leader>i <Plug>(go-info)
""au FileType go noremap \\f <Esc>:GoFmt<CR> 
"}}}

"----------------------------------------------------------------------------
" FileType related
"----------------------------------------------------------------------------

""""""""""""
"general
""""""""""""
autocmd BufEnter *  set tabstop=4 

""""""""""""
"c c++
""""""""""""
""autocmd BufEnter  *.cpp,*.c,*.h call s:SET_PATH("include") 
""autocmd FileType c set omnifunc=ccomplete#Complete
".c  .h 文件设为 .cpp
autocmd BufEnter *.c  set filetype=cpp
autocmd BufEnter *.h  set filetype=cpp

""""""""""""
"python
""""""""""""
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd BufRead,BufNewFile *.py set ai
autocmd FileType python setlocal et sta sw=4 sts=4
autocmd FileType python setlocal foldmethod=indent
au BufNewFile,BufRead *.py,*.pyw set filetype=python
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
"au FileType python noremap \\f <Esc>:pyfmt -i %<CR> 
"au FileType python noremap \\f <Esc>:!autopep8 --in-place --aggressive %<CR> 
au FileType python noremap \\f <Esc>:PymodeLintAuto<CR> 
""""""""""""
"golang
""""""""""""
autocmd BufEnter *.go  set filetype=go
au Filetype go set makeprg=go\ build\ -race\ ./...

""""""""""""
" HTML 
""""""""""""
au FileType html set ft=xml
au FileType html set syntax=html
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd BufRead *.mxml set filetype=mxml
autocmd BufRead *.tmpl set filetype=html
autocmd BufRead *.html set filetype=html

""""""""""""
" javascript 
""""""""""""
autocmd BufRead *.js set filetype=javascript
au FileType javascript set dictionary+=$HOME/.vim/bundle/vim-node-dict/dict/node.dict
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

""""""""""""
" Vim 
""""""""""""
autocmd FileType vim set nofen
autocmd FileType vim map <buffer> <leader><space> :w!<cr>:source %<cr>

""""""""""""
"others
""""""""""""
" Enable omni completion. (Ctrl-X Ctrl-O)
au! BufRead *.json,*.cfg set filetype=json 

"----------------------------------------------------------------------------
" FUNCTIONS
"----------------------------------------------------------------------------
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
        let my_filetype = &filetype
        exec "Ack " . l:pattern ." --". my_filetype 
    elseif a:direction == 'replace'
        ""call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    elseif a:direction == 'cs'
        execute "cs find s " . l:pattern 
    endif
    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

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

"设置相关 include , for cmd : gf 
function! s:SET_PATH( find_dir )
    let dir = expand("%:p:h") "获得源文件路径
    let dir_relative=''
    let g:alternateSearchPath = ''
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

function! Make() 
    if ( &filetype == "go")
        exec "GoBuild" 
    endif
    if ( &filetype == "cpp" || &filetype == "c")
        exec "make"
    endif
    if ( &filetype == "python")
        exec "PymodeLint"
    endif
endfunction



function! GEN_TAGS() 
    if ( &filetype == "go")
        "silent! execute "! /usr/local/bin/ctags -f gosource.tags -R `pwd`"<CR>
        "go get -u github.com/jstemmer/gotags
        silent! execute "!gotags  -R=true `pwd`  >.gosource.tags"
        exec "redraw!"
    endif
    if ( &filetype == "cpp" || &filetype == "c")
        call GEN_C_TAGS()
    endif
endfunction

    
"重新生成c语言 ctag cscope
function! GEN_C_TAGS() 
    "if(executable('cscope') && has("cscope") )
        "silent! execute "!find . -name '[^.]*.h' -o -name '[^.]*.c' -o -name '[^.]*.cpp' -o -name '[^.]*.hpp' > _cscope.files"
        "silent! execute "!cscope -bkq -f _cscope.out -i _cscope.files"
        "if (filereadable("_cscope.out"))
            "execute "cs reset"
        "endif
    "endif
    if(executable('ctags'))
        silent! execute "!rm -f ./.tags"
        if g:os== 'Linux' 
            silent! execute "!ctags -R -f .tags  --languages=c,c++ --c++-kinds=+p --fields=+iaS --extra=+q ."
        elseif g:os == 'Darwin' || g:os == 'Mac'
            silent! execute "!/usr/local/bin/ctags -R -f .tags --languages=c,c++ --c++-kinds=+p --fields=+iaS --extra=+q ."
        endif
    endif
    exec "redraw!"
endfunction

function! ConvertToJson()
    if &filetype == "json" 
        exec "%!python -m json.tool"
    endif
endfunction

function! OPT_RANGE( opt_str ) 
    let cur_char=getline('.')[col('.') - 1] 
    if cur_char == "(" || cur_char == "<" || cur_char == "{" || cur_char == "[" || cur_char == "\"" || cur_char == "'" || cur_char == ")" || cur_char == ">" || cur_char == "}" || cur_char == "]" 
        exec "normal! ".a:opt_str.cur_char
    endif
endfunction
