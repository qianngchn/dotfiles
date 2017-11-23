" ======vundle设置======
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'terryma/vim-expand-region'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rip-rip/clang_complete'
call vundle#end()
filetype plugin indent on

" ======netrw设置======
let g:netrw_dirhistmax=0

" ======minibufexpl设置======
let g:miniBufExplHideWhenDiff=1
let g:miniBufExplCycleArround=1
let g:miniBufExplUseSingleClick=1

" ======vim-expand-region设置======
vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)

" ======ctrlp设置======
let g:ctrlp_cmd='CtrlPMixed'
let g:ctrlp_regexp=1
let g:ctrlp_use_caching=0
let g:ctrlp_user_command=['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
nnoremap <silent> <C-N> :CtrlPQuickfix<CR>
nnoremap <silent> <C-M> :CtrlPLine<CR>

" ======clang_complete设置======
let g:clang_library_path="/usr/lib/x86_64-linux-gnu"
let g:clang_jumpto_declaration_key="<C-J>"
let g:clang_jumpto_back_key="<C-K>"
let g:clang_jumpto_declaration_in_preview_key="<C-L>"

" ======基本设置======
set autoindent " 自动缩进
set smartindent " 智能缩进
set cindent " C/C++样式缩进
set tabstop=4 " Tab键宽度
set softtabstop=4 " 软Tab键宽度
set shiftwidth=4 " 缩进宽度
set expandtab " 用空格代替制表符
set nobackup " 禁止备份
set noswapfile " 禁止使用临时文件
set ignorecase " 搜索时忽略大小写
set smartcase " 搜索时有大写字母就不忽略大小写
set hlsearch " 高亮搜索
set incsearch " 智能搜索
set showmatch " 高亮显示匹配的括号
set wildmenu " 命令模式Tab菜单
set backspace=2 " 允许删除键处理缩进和开头结尾
set whichwrap=<,>,b,s,h,l " 允许左右方向键和移动键跨行
set history=100 " 历史记录数
set number " 显示行号
set report=0 " 显示文件修改提示
set iskeyword=~,!,@,#,$,%,&,*,_,.,-,> " 带有这些符号的单词不被换行分割
set autoread " 文件被改动时自动载入
set showcmd " 显示输入命令
set scrolloff=2 " 光标移动到顶部和底部时保持2行距离
set laststatus=2 " 总是显示状态行
set statusline=%<%F\ [%n%Y%R%M]\ [0x%B]%=%{&fileformat}\ <\ %{&fileencoding!=''?&fileencoding:&encoding}\ <\ %l,%c,%P,%L " 状态栏显示信息
set foldmethod=syntax " 根据语法进行折叠
set foldlevel=1 " 设置折叠层数
set completeopt=longest,menu " 设置自动补全
set previewheight=3 " 设置预览窗口高度
set list " 显示隐藏字符
set listchars=tab:>-,trail:-,eol:$,extends:>,precedes:<,nbsp:% " 设置隐藏字符的显示效果
set mouse=n " Normal模式可以使用鼠标
set selection=exclusive " 设置选取方式

" ======高级设置======
syntax enable " 语法高亮
colorscheme desert " 主题配置
" 状态栏高亮
highlight StatusLine ctermfg=black ctermbg=white
highlight StatusLineNC ctermfg=black ctermbg=cyan
" 自动跳转到上次打开位置
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" 自动跳转到粘贴文本最后
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
" Tab自动补全
function! s:whitespace()
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~? '\s'
endfunction
inoremap <expr> <buffer> <silent> <TAB> pumvisible()?"\<C-N>":(<SID>whitespace()?"\<TAB>":(len(&completefunc)?"\<C-X>\<C-U>":"\<C-N>"))
inoremap <expr> <buffer> <silent> <S-TAB> pumvisible()?"\<C-P>":"\<TAB>"

" ======键盘设置======
" 快捷键Leader
let mapleader="m"
" 快速保存
nnoremap <silent> <Leader>w :w<CR>
" 快速退出
nnoremap <silent> <Leader>q :q!<CR>
nnoremap <silent> <Leader>e :qa!<CR>
" 快速make
nnoremap <silent> <Leader>k :make<CR>
" 快速grep
nnoremap <silent> <Leader>g :vimgrep <C-R>="/" . expand("<cword>") . "/ **"<CR><CR>
" 水平窗口打开文件
nnoremap <silent> <Leader>s :split <C-R>=expand("<cfile>")<CR><CR>
" 垂直窗口打开文件
nnoremap <silent> <Leader>v :vsplit <C-R>=expand("<cfile>")<CR><CR>
" 返回上一个窗口
nnoremap <silent> <Leader>p :wincmd p<CR>
" 查看所有marks
nnoremap <silent> <Leader>m :marks<CR>
" 删除所有marks
nnoremap <silent> <Leader>d :delmarks!<CR>
" 切换16进制显示
nnoremap <silent> <Leader>xx :%!xxd<CR>
nnoremap <silent> <Leader>xd :%!xxd -r<CR>
" 切换paste模式
nnoremap <silent> <Leader>; :set paste!<BAR>set paste?<CR>
