" ======vundle======
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

" ======netrw======
let g:netrw_dirhistmax=0

" ======minibufexpl======
let g:miniBufExplHideWhenDiff=1
let g:miniBufExplCycleArround=1
let g:miniBufExplUseSingleClick=1

" ======vim-expand-region======
vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)

" ======ctrlp======
let g:ctrlp_cmd='CtrlPMixed'
let g:ctrlp_regexp=1
let g:ctrlp_use_caching=0
let g:ctrlp_user_command=['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
nnoremap <silent> <C-N> :CtrlPQuickfix<CR>
nnoremap <silent> <C-M> :CtrlPLine<CR>

" ======clang_complete======
let g:clang_library_path="/usr/lib/x86_64-linux-gnu"
let g:clang_jumpto_declaration_key="<C-J>"
let g:clang_jumpto_back_key="<C-K>"
let g:clang_jumpto_declaration_in_preview_key="<C-L>"

" ======Basic======
set autoindent " Auto indent
set smartindent " Smart indent
set cindent " C/C++ style indent
set tabstop=4 " Tab width
set softtabstop=4 " Soft tab width
set shiftwidth=4 " Shift width
set expandtab " Replace tab with space
set nobackup " No backup file
set noswapfile " No swap file
set ignorecase " Ignore upper and lower while searching
set smartcase " Smart ignore upper and lower while searching
set hlsearch " Highlight search results
set incsearch " Smart show search results
set showmatch " Show matched brackets
set wildmenu " Show wild menu for command-line completion
set backspace=2 " Set backspace method
set whichwrap=<,>,b,s,h,l " Set characters to wrap line
set history=100 " Set history number
set number " Show line number
set report=0 " Report number of lines changed
set iskeyword=~,!,@,#,$,%,&,*,_,.,-,> " Set keywords
set autoread " Auto read changed file
set showcmd " Show input command
set scrolloff=2 " Minimal number of screen lines to keep above and below the cursor
set laststatus=2 " Always show status line
set statusline=%<%F\ [%n%Y%R%M]\ [0x%B]%=%{&fileformat}\ <\ %{&fileencoding!=''?&fileencoding:&encoding}\ <\ %l,%c,%P,%L " Status line
set foldmethod=syntax " Set fold method
set foldlevel=2 " Set fold level
set completeopt=longest,menu " Set completion option
set previewheight=3 " Set height of preview window
set list " Show hidden characters
set listchars=tab:>-,trail:-,eol:$,extends:>,precedes:<,nbsp:% " Replace hidden characters with specified characters
set mouse=n " Use mouse in normal mode
set selection=exclusive " Set selection method

" ======Advanced======
syntax enable " Syntax highlighting
colorscheme desert " Set color scheme
" Status line highlighting
highlight StatusLine ctermfg=black ctermbg=white
highlight StatusLineNC ctermfg=black ctermbg=cyan
" Auto remember last visited line
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" Auto follow pasted text
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
" Auto completion
function! s:whitespace()
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~? '\s'
endfunction
inoremap <expr> <buffer> <silent> <TAB> pumvisible()?"\<C-N>":(<SID>whitespace()?"\<TAB>":(len(&completefunc)?"\<C-X>\<C-U>":"\<C-N>"))
inoremap <expr> <buffer> <silent> <S-TAB> pumvisible()?"\<C-P>":"\<TAB>"

" ======Keyboard======
" Leader key
let mapleader="m"
" Quick save
nnoremap <silent> <Leader>w :w<CR>
" Quick exit
nnoremap <silent> <Leader>q :q!<CR>
nnoremap <silent> <Leader>e :qa!<CR>
" Quick make
nnoremap <silent> <Leader>k :make<CR>
" Quick grep
nnoremap <silent> <Leader>g :vimgrep <C-R>="/" . expand("<cword>") . "/ **"<CR><CR>
" Open file in split window
nnoremap <silent> <Leader>s :split <C-R>=expand("<cfile>")<CR><CR>
nnoremap <silent> <Leader>v :vsplit <C-R>=expand("<cfile>")<CR><CR>
" Back to last window
nnoremap <silent> <Leader>p :wincmd p<CR>
" View all marks
nnoremap <silent> <Leader>m :marks<CR>
" Delete all marks
nnoremap <silent> <Leader>d :delmarks!<CR>
" Toggle hex mode
nnoremap <silent> <Leader>xx :%!xxd<CR>
nnoremap <silent> <Leader>xd :%!xxd -r<CR>
" Toggle paste mode
nnoremap <silent> <Leader>; :set paste!<BAR>set paste?<CR>
