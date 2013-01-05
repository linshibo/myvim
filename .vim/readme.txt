add to   .vimrc
source ~/.vim/comm.vim
tips:
"自动补全
if    if switch for class struct main while 
hd    文件头部定义
ff    ifndef –def –endif  .h 文件中使用
in    #include  “”
is    #include <>
ih    #include <自身文件名.h>
ihpp  #include <自身文件名.hpp>
xt    当前时间
loop

"surrund.vim
Normal mode
-----------
ds  - delete a surrounding
cs  - change a surrounding
ys  - add a surrounding
yS  - add a surrounding and place the surrounded text on a new line + indent it
yss - add a surrounding to the whole line
ySs - add a surrounding to the whole line, place it on a new line + indent it
ySS - same as ySs

Visual mode
-----------
s   - in visual mode, add a surrounding
S   - in visual mode, add a surrounding but place text on new line + indent it

Insert mode
-----------
<CTRL-s> - in insert mode, add a surrounding
<CTRL-s><CTRL-s> - in insert mode, add a new line + surrounding + indent
<CTRL-g>s - same as <CTRL-s>
<CTRL-g>S - same as <CTRL-s><CTRL-s>

<F2>  buffer explore 开关
<F3>  TagbarToggle 
<F4>  quickfix 开关
<F5>  NERDTreeToggle
<F6>  MarksBrowser 开关
<F9>  set paste 

"bufexplorer  相关
 \be (normal open)  or
 \bs (force horizontal split open)  or
 \bv (force vertical split open) 

" showmarks setting
nnoremap <silent> mo :ShowMarksOn<CR>
nnoremap <silent> mt :ShowMarksToggle<CR>

" wokmark setting
map mm <Plug>ToggleMarkWok
map mj <Plug>NextMarkWok
map mk <Plug>PrevMarkWok
map <M-Left> <Plug>SetMarkWok
map <M-Right> <Plug>ToggleMarkWok
map <M-Up> <Plug>PrevMarkWok
map <M-Down> <Plug>NextMarkWok
