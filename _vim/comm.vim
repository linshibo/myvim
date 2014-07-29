"---------------------------------------------------------------------------
"author:francisco 
"email:linshibo3456@gmail.com
"add to   .vimrc
"source ~/.vim/comm.vim
"---------------------------------------------------------------------------

"Brief help
":BundleList          - list configured bundles
":BundleInstall(!)    - install(update) bundles
":BundleSearch(!) foo - search(or refresh cache first) for foo
":BundleClean(!)      - confirm(or auto-approve) removal of unused bundles

"Vundle 管理
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" 让 Vundle 管理 Vundle
" 此条必须有
Bundle 'gmarik/vundle'

" 代码源在 github 上的
Bundle 'vim-scripts/DoxygenToolkit.vim'
Bundle 'vim-scripts/FencView.vim'
Bundle 'vim-scripts/OmniCppComplete'
Bundle 'vim-scripts/Tagbar'
Bundle 'vim-scripts/python.vim'
Bundle 'vim-scripts/xml.vim'
Bundle 'vim-scripts/matchit.zip'
Bundle 'vim-scripts/YankRing.vim'
Bundle 'vim-scripts/AutoClose'
"Bundle 'vim-scripts/Tabular'
Bundle 'vim-scripts/snipMate'
Bundle 'vim-scripts/a.vim'
Bundle 'vim-scripts/ack.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Shougo/unite.vim'

if has('lua') && version >= 703
    Bundle 'Shougo/neocomplete'
else
    Bundle 'Shougo/neocomplcache'
endif

Bundle 'tpope/vim-surround'
Bundle 'bootleq/vim-cycle'
Bundle 'kana/vim-smartword'
Bundle 'altercation/vim-colors-solarized'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'fatih/vim-go'
Bundle 'plasticboy/vim-markdown'


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
let mapleader =","

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
set tags=~/.vim/comm_tags,~/.vim/cpp_tags,.tags,.gosource.tags; 

"折叠
set foldmethod=syntax
""默认情况下不折叠
set foldlevel=99


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
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gb2312,big5,euc-jp,euc-kr,latin1
language messages POSIX

"自动更新cpp修改时间
"autocmd BufWritePre,FileWritePre *.cpp,*.c,*.h,*.hpp exec "normal ms"|call LastModified()|exec "normal `s"

"for cmake ':make' ,由于定位错误,中文会有问题，如下调整
if finddir("build") == "build"
    set makeprg=export\ LANG=zh_CN:en;make\ -C\ ./build
endif

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

nmap  <F1> :help <C-R>=expand('<cword>')<CR><CR>

" }}} 跨 Vim 剪貼 {{{2
" http://vim.wikia.com/wiki/Transfer_text_between_two_Vim_instances
nmap \p :r $HOME/.vimxfer<CR>
vmap \y :w! $HOME/.vimxfer<CR>

nnoremap ,q <Esc>:q!<CR>
nnoremap ,w :w!<CR>:nohl<CR>

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
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>

"tabedit
nnoremap ,t <Esc>:tabedit 

"查找当前光标下的单词
nnoremap ,g :Ack <C-R>=expand('<cword>')<CR><CR>
vnoremap ,g :call VisualSelection('gv')<CR>
nnoremap ,r <Esc>:call GEN_TAGS()<CR>
nnoremap ,m <Esc>:make<CR>:cc<CR>
"nnoremap ,y <Esc>:call OPT_RANGE("ya")<CR>
"nnoremap ,Y <Esc>:call OPT_RANGE("yi")<CR>
"nnoremap ,d <Esc>:call OPT_RANGE("da")<CR>
"nnoremap ,D <Esc>:call OPT_RANGE("di")<CR>
"转换单词大小写
nnoremap ,u <Esc>:call SET_UAW()<CR>

"Keep search pattern at the center of the screen."
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" Go to home and end using capitalized directions
noremap H ^
noremap L $
noremap Y y$

"支持粘贴
inoremap kk <Esc>:set paste<CR>i

""nnoremap \i  [I

"窗口间移动
nnoremap <C-H> <Esc><C-W>h
nnoremap <C-L> <Esc><C-W>l
nnoremap <C-J> <Esc><C-W>j
nnoremap <C-K> <Esc><C-W>k

"Fast reloading of the .vimrc
nnoremap \s <ESC>:source ~/.vim/comm.vim<cr>
"Fast editing of .vimrc
nnoremap \e <ESC>:e! ~/.vim/comm.vim<cr>
"Switch to current dir
nnoremap ,cd <ESC>:cd %:p:h<cr>

"在正常模式下的整块移动
"大括号内向左移
nmap <F7> <Esc><i{
"大括号内向右移
nmap <F8> <Esc>>i{
"选择区移动
vnoremap <F7> <gv
vnoremap <F8> >gv
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

"quick fix toggle
nnoremap <F4> <Esc>:call ToggleQF()<CR>
nnoremap ,cn <Esc>:cn<CR>
nnoremap ,cp <Esc>:cp<CR>

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
" 用于支持 退格后 . -> 代码补全
"inoremap   <expr> <Backspace>  Ex_bspace() 
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
"---------------------------------------------------------------------------

"ack.vim{
if g:os == 'Linux' 
    set grepprg=/user/bin/ack-grep
    let g:ackprg="/usr/local/bin/ack-grep -H --nocolor --nogroup --ignore-file *tags"
elseif g:os == 'Darwin' || g:os == 'Mac'
    let g:ackprg="/usr/local/bin/ack -H --nocolor --nogroup --ignore-file *tags"
endif
"}

"vim-smartword{{{
nmap w  <Plug>(smartword-w)
nmap b  <Plug>(smartword-b)
nmap e  <Plug>(smartword-e)
nmap ge  <Plug>(smartword-ge)
"}}}

"autoclose{{{
nmap <F2> <Plug>ToggleAutoCloseMappings
"}}}}

"a.vim {{{
nnoremap ,a <Esc>:A<CR>
"}}}
"

"unite{{{
nnoremap ,f :Unite file<CR>
nnoremap ,b :Unite buffer<CR>
"}}}

"tabular{{{
""nnoremap \= :call SetAlign()<CR>
"}}}

"vim-easymotion{{{
let g:EasyMotion_leader_key = '0'
""nnoremap \w <Esc>00w
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
nnoremap <silent> <C-Y> :YRShow<CR> 
let g:yankring_history_dir = '~/.vim/'
let g:yankring_history_file='.yankring_history_file'
"}}}

" omnicppcomplete{{{
let OmniCpp_ShowScopeInAbbr = 1
"支持STL模板
let OmniCpp_DefaultNamespaces   = ["std", "_GLIBCXX_STD"]
"不自动选择第一个
let OmniCpp_SelectFirstItem = 0
"使用本地搜索函数
let OmniCpp_LocalSearchDecl = 1
"::补全
let OmniCpp_MayCompleteScope =1
" }}}


" cscope setting {{{
if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("_cscope.out")
        silent cs add _cscope.out
    endif
    set csverb
endif
au filetype cpp nnoremap ,s :cs find s <C-R>=expand("<cword>")<CR><CR>
au filetype cpp vnoremap ,s :call  VisualSelection('cs')<CR>
"s: 查找C语言符号，即查找函数名、宏、枚举值等出现的地方
"g: 查找函数、宏、枚举等定义的位置，类似ctags所提供的功能
"d: 查找本函数调用的函数
"c: 查找调用本函数的函数
"t: 查找指定的字符串
"e: 查找egrep模式，相当于egrep功能，但查找速度快多了
"f: 查找并打开文件，类似vim的find功能
"i: 查找包含本文件的文
" }}}

"powerline{{{ 状态栏
let g:Powerline_colorscheme = 'solarized256'
set laststatus=2
set t_Co=256
"}}}

"Doxygen插件{{{
let g:DoxygenToolkit_briefTag_pre="@brief  " 
let g:DoxygenToolkit_paramTag_pre="@param  " 
let g:DoxygenToolkit_returnTag="@return  " 
let g:DoxygenToolkit_authorName="francisco" 
let g:DoxygenToolkit_undocTag="DOXIGEN_SKIP_BLOCK"
let g:DoxygenToolkit_briefTag_funcName = "no"
let g:DoxygenToolkit_maxFunctionProtoLines = 30
nnoremap \d :Dox<CR>
""nnoremap \da :DoxAuthor<CR>
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


if has('lua') && version >= 703
    "neocomplete{{{
    "Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplete.
    let g:neocomplete#enable_at_startup = 0
    " Use smartcase.
    let g:neocomplete#enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
    " Define dictionary.
    let g:neocomplete#sources#dictionary#dictionaries = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions'
            \ }
    " Define keyword.
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'
    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplete#undo_completion()
    inoremap <expr><C-l>     neocomplete#complete_common_string()
    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
    return neocomplete#close_popup() . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
    endfunction
    " <TAB>: completion.
    "inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y>  neocomplete#close_popup()
    inoremap <expr><C-e>  neocomplete#cancel_popup()
    " Close popup by <Space>.
    ""inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"
    " AutoComplPop like behavior.
    let g:neocomplete#enable_auto_select = 0

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    " Enable heavy omni completion.
    if !exists('g:neocomplete#sources#omni#input_patterns')
        let g:neocomplete#sources#omni#input_patterns = {}
    endif
    let g:neocomplete#sources#omni#input_patterns.go = '[^.[:digit:] *\t]\.'
    let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
    " For perlomni.vim setting.
    " https://github.com/c9s/perlomni.vim
    let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
    "}}}
else
    "neocomplcache{{{
    let g:neocomplcache_enable_quick_match = 1
    " Launches neocomplcache automatically on vim startup.
    let g:neocomplcache_enable_at_startup = 0
    " Use smartcase.
    let g:neocomplcache_enable_smart_case = 1
    " Use camel case completion.
    let g:neocomplcache_enable_camel_case_completion = 1
    " Use underscore completion.
    let g:neocomplcache_enable_underbar_completion = 1
    " Sets minimum char length of syntax keyword.
    let g:neocomplcache_min_syntax_length = 3
    let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
    let g:neocomplcache_enable_auto_select = 0
    " Define file-type dependent dictionaries.
    inoremap <expr><C-g>     neocomplcache#undo_completion()
    inoremap <expr><C-l>     neocomplcache#complete_common_string()
    nnoremap <F9> :NeoComplCacheToggle<CR>
    let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }
    let g:neocomplcache_omni_functions = {
        \ 'c' : 'ccomplete#Complete',
        \ 'python' : 'pythoncomplete#Complete',
        \ 'ruby' : 'rubycomplete#Complete',
        \ }
    " Define keyword, for minor languages
    if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
    endif
    if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
    endif
    inoremap <expr><C-g>  neocomplcache#undo_completion()
    inoremap <expr><C-l>  neocomplcache#complete_common_string()
    inoremap <expr><C-y>  neocomplcache#close_popup()
    inoremap <expr><C-e>  neocomplcache#cancel_popup()
    ""inoremap <expr><space> pumvisible() ? neocomplcache#close_popup() . "\<SPACE>" : "\<SPACE>"
    " Enable heavy omni completion, which require computational power and may stall the vim. 
    if !exists('g:neocomplcache_omni_patterns')
        let g:neocomplcache_omni_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
    ""let g:neocomplete#force_omni_input_patterns.go = '[^.[:digit:] *\t]\.'
    let g:neocomplcache_omni_patterns.go = '\h\w*\%.'
    let g:echodoc_enable_at_startup = 1
    let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
    if !exists('g:neocomplcache_force_omni_patterns')
        let g:neocomplcache_force_omni_patterns = {}
    endif
    let g:neocomplcache_force_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
    let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
    "}}}
endif

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
\ [['p_in', 'p_out']],
\ [['P_IN', 'P_OUT']],
\ [['in', 'out']],
\ [['left', 'right']],
\ [['Left', 'Right']],
\ [['up', 'down']],
\ [['min', 'max']],
\ [['get', 'set']],
\ [['add', 'remove']],
\ [['to', 'from']],
\ [['read', 'write']],
\ [['save', 'load', 'restore']],
\ [['next', 'previous', 'prev']],
\ [['only', 'except']],
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
let g:go_play_open_browser = 0
""By default vim-go shows errors for the fmt command, to disable it:
let g:go_fmt_fail_silently = 1
""Disable auto fmt on save:
let g:go_fmt_autosave = 0
""Disable goimports and use gofmt for the fmt command:
let g:go_fmt_command = "gofmt"
au FileType go nmap gd <Plug>(go-def)
au FileType go nmap <Leader>d <Plug>(go-doc)
au FileType go nmap <Leader>i <Plug>(go-info)
noremap \\f <Esc>:GoFmt<CR> 
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
autocmd BufEnter  *.cpp,*.c,*.h call s:SET_PATH("include") 
autocmd FileType c set omnifunc=ccomplete#Complete
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
autocmd FileType python set complete+=k~/.vim/bundle/Pydiction isk+=.,(
au BufNewFile,BufRead *.py,*.pyw set filetype=python

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
autocmd BufNewFile,BufRead *.json set ft=javascript

"----------------------------------------------------------------------------
" FUNCTIONS
"----------------------------------------------------------------------------


function! SetAlign()
    let ch=getline(line('.'))[col('.')-1]
    let next=getline(line('.'))[col('.')]
    if ( ch=='/' && next=='/' )
        let ch='\/\/'
    elseif ( ch=='+' && next=='=')
        let ch = ch . next
    elseif ch == next
        let ch = ch . next
    endif
    exec "Tabularize /" . ch
endfunc

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
        exec "Ack " . l:pattern ." --ignore-file *tags"
    elseif a:direction == 'replace'
        ""call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    elseif a:direction == 'cs'
        execute "cs find s " . l:pattern 
    elseif a:direction == 'oi'
        execute "!onlinei " . l:pattern 
    elseif a:direction == 'oo'
        execute "!onlineo " . l:pattern 
    endif
    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

"自动更新 修改时间
function! LastModified()
    if search("\\/\\*LastModified: \\d\\{4}-\\d\\{2}-\\d\\{2} \\d\\{2}:\\d\\{2}:\\d\\{2}\\*\\/","","")>0
        exe "silent! $,$g/$/s/LastModified: .*/LastModified: " .
            \ strftime("%Y-%m-%d %H:%M:%S") . "\\*\\/"
    else
        exe "silent! $,$g/$/s/$/\r\\/\\*LastModified: " .
            \ strftime("%Y-%m-%d %H:%M:%S") . "\\*\\/"
endif

"退格时自动补全
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
    if(executable('cscope') && has("cscope") )
        silent! execute "!find . -name '[^.]*.h' -o -name '[^.]*.c' -o -name '[^.]*.cpp' -o -name '[^.]*.hpp' > cscope.files"
        silent! execute "!cscope -bkq -f _cscope.out -i _cscope.files"
        if (filereadable("_cscope.out"))
            execute "cs reset"
        endif
    endif
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

function! OPT_RANGE( opt_str ) 
    let cur_char=getline('.')[col('.') - 1] 
    if cur_char == "(" || cur_char == "<" || cur_char == "{" || cur_char == "[" || cur_char == "\"" || cur_char == "'" || cur_char == ")" || cur_char == ">" || cur_char == "}" || cur_char == "]" 
        exec "normal! ".a:opt_str.cur_char
    endif
endfunction

