"---------------------------------------------------------------------------
"author:francisco
"email:linshibo3456@gmail.com
"add to   .vimrc
"source ~/.vim/comm.vim
"---------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')
" 代码源在 github 上的
" 
Plug 'ludovicchabant/vim-gutentags'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'"
Plug 'mbbill/fencview'
Plug 'majutsushi/tagbar'
Plug 'garbas/vim-snipmate'
Plug 'rking/ag.vim'
Plug 'godlygeek/tabular'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Lokaltog/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'bootleq/vim-cycle'
Plug 'kana/vim-smartword'
Plug 'altercation/vim-colors-solarized'
Plug 'terryma/vim-multiple-cursors'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'scrooloose/nerdtree'
Plug 'klen/python-mode'
Plug 'Rip-Rip/clang_complete'
Plug 'gregsexton/matchtag'
Plug 'rhysd/vim-clang-format'
Plug 'shougo/unite.vim'
Plug 'mindriot101/vim-yapf'
Plug 'funorpain/vim-cpplint'
Plug 'Shougo/echodoc.vim'

call plug#end()

"---------------------------------------------------------------------------
"GENERAL SET
"---------------------------------------------------------------------------

"Sets how many lines of history VIM har to remember
set history=400

"map leader key ","
let mapleader ="\<Space>"

set colorcolumn=80

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

set nu

"Get out of VI's compatible mode..
set nocompatible
"disable alt
set winaltkeys=no
"tags 位置
set tags+=.tags

"折叠
set foldmethod=syntax
""默认情况下不折叠
set foldlevel=99
"set for gf
""set path+=/usr/include/c++/4.6/


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

set scrolloff=5 " 距离垂直边界 n 行就开始滚动
set sidescroll=1 " 水平滚动列数
set sidescrolloff=10 " 距离水平边界 n 行就开始滚动

"Favorite filetypes
set fileformats=unix,mac
let g:os=substitute(system('uname'), '\n', '', '')

"主题 solarized 的配置必须在 colorscheme 之前
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_hitrail = 0
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
set tabstop=2 " 设置Tab宽度为4个字符
set softtabstop=2 " 软缩进宽度
set shiftwidth=2 " 设置移动代码块宽度
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

" highlight last inserted text
nnoremap gV `[v`]

nnoremap gr gT

nnoremap \s :vsplit<CR>
nnoremap \h :split<CR>

" }}} 跨 Vim 剪貼 {{{2
" http://vim.wikia.com/wiki/Transfer_text_between_two_Vim_instances
nmap \p :r $HOME/.vimxfer<CR>
vmap \y :w! $HOME/.vimxfer<CR>

nnoremap <Leader>q <Esc>:q!<CR>
nnoremap <Leader>w :w!<CR>:nohl<CR>

" sudo write this
nnoremap <Leader>W <Esc>:w !sudo tee % >/dev/null<CR>
nnoremap <Leader>e <Esc>:e 
nnoremap <Leader>E <Esc>:e %:p:h/
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
nnoremap <Leader>g :Ag  <C-R>=expand('<cword>') ." --". &filetype. " ."<CR><CR>
vnoremap <Leader>g :call VisualSelection('gv')<CR>
nnoremap <Leader>r <Esc>:call GEN_TAGS()<CR>
nnoremap <Leader>m <Esc>:call Make()<CR>
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
"Switch to current dir
nnoremap <Leader>c <ESC>:cd %:p:h<cr>

"选择区移动
vnoremap < <gv
vnoremap > >gv
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

"quick fix toggle
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

"---------------------------------------------------------------------------

"yapf
let g:yapf_style = "google"

"Tabular{{{
vmap \\=  :Tabularize \=<CR>
nmap \\:  :Tabularize \:<CR>
"}}}

"vim-clang-format{{{
let g:clang_format#style_options = {"Standard" : "C++11"}
"}}}

"vim-gutentagsa{{{
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'
" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
    silent! call mkdir(s:vim_tags, 'p')
endif
"}}}

"unite{{{
nmap <Leader>b <ESC>:Unite buffer file<CR>
"}}}

"fzf{{{
nmap <Leader>f <ESC>:FZF<CR>
"}}}

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
if g:os == 'Linux'
  if matchstr(system('uname -a'),'12.04') == "12.04"
    let g:clang_library_path = "/usr/lib/llvm-3.4/lib"
  elseif matchstr(system('uname -a'),'14.04') == "14.04"
    let g:clang_library_path = "/usr/lib/llvm-3.9/lib"
  endif
elseif g:os == 'Darwin' || g:os == 'Mac'
    let g:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'
endif
let g:clang_user_options = "-I/usr/include/c++/4.8.4 -I/usr/include/c++/4.6.3 -I~/workspace/media_server_build/media_server_library -I~/workspace/media_server_build/media_server_protocol -std=c++0x -DDEBUG"
"}}}

"Nerdtree{{{
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
nmap <C-e> :NERDTreeToggle<CR>
"}}}

"vim-smartword{{{
nmap w  <Plug>(smartword-w)
nmap b  <Plug>(smartword-b)
nmap e  <Plug>(smartword-e)
"}}}


"a.vim {{{
au filetype cpp nnoremap <Leader>a <Esc>:A<CR>
"}}}
"

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
let g:yankring_history_dir = '$VIM'
let g:yankring_history_file='.yankring_history_file'
nnoremap <silent> <C-Y> :YRShow<CR>
"}}}

"
"airline{{{
let g:airline_theme='cool'
set laststatus=2
"}}}

" Tagbar setting{{{
nnoremap <Leader>t <Esc>:TagbarToggle<cr>
let g:tagbar_width = 30
let g:tagbar_expand = 0
let g:tagbar_autofocus = 1
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
\ [['16', '32', '64']],
\ [['uint16_t', 'uint32_t', 'uint64_t']],
\ [['int16_t', 'int32_t', 'int64_t']],
\ [['to', 'from']],
\ [['read', 'write']],
\ [['exclude', 'include']],
\ [['width', 'height']],
\ [['asc', 'desc']],
\ [['start', 'end']],
\ [['east', 'west']],
\ [['south', 'north']],
\ [['prefix', 'suffix']],
\ [['decode', 'encode']],
\ [['short', 'long']],
\ [['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday',
\ 'Friday', 'Saturday'], ['hard_case', {'name': 'Days'}]],
\ [['{:}', '[:]', '(:)'], 'sub_pairs'],
\ ]
"}}}

"----------------------------------------------------------------------------
" FileType related
"----------------------------------------------------------------------------
""""""""""""
"c c++
""""""""""""
autocmd BufEnter *.cpp,*.c,*.h set path+=~/workspace/media_server_library/,~/workspace/media_server_protocol/
autocmd BufEnter *.c  set filetype=cpp
autocmd BufEnter *.h  set filetype=cpp
autocmd FileType cpp nmap <buffer> \\f :ClangFormat<CR>
autocmd FileType cpp nmap <buffer> \\l :call Cpplint()<CR>

""""""""""""
"python
""""""""""""
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd BufRead,BufNewFile *.py set ai
autocmd FileType python setlocal et sta sw=4 sts=4
autocmd FileType python setlocal foldmethod=indent
au BufNewFile,BufRead *.py,*.pyw set filetype=python
"au FileType python noremap \\f <Esc>:PymodeLintAuto<CR>
au FileType python noremap \\f <Esc>:call Yapf()<CR>

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
        exec "Ag " . l:pattern ." --". my_filetype
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
        execute "make"
        execute "copen"
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


"重新生成c语言 ctag
function! GEN_C_TAGS()
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
