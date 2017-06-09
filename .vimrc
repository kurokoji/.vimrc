" dein.vim{{{
if &compatible
  set nocompatible
endif
set runtimepath^=~/.vim/dein/repos/github.com/Shougo/dein.vim

let s:dein_dir = '~/.vim/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

let s:toml_dir = s:dein_dir . '/../toml'

let &runtimepath = s:dein_repo_dir . ',' . &runtimepath

let s:toml_file = s:toml_dir . '/dein.toml'
let s:lazy_file = s:toml_dir . '/dein_lazy.toml'

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(s:toml_file, {'lazy': 0})
  call dein#load_toml(s:lazy_file, {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
  call dein#install()
endif

"}}}

set backspace=indent,eol,start "Backspaceを調整

inoremap <C-j> <esc>
noremap <C-j> <esc>
"inoremap <silent> jj <esc>

"** ペーストするときにインデントさせない **
inoremap <F5> <nop>
set pastetoggle=<F5>

"** システム設定 **
set nocompatible
set writebackup
set infercase
set autoread
set nowrap

"** 折りたたみ **
set foldmethod=marker

"** 文字コード設定 **
set encoding=utf-8
scriptencoding utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,sjis,euc-jp
set fencs=utf-8,iso-2022-jp,enc-jp,cp932

"** 表示設定 **
syntax enable
set title
set number
set cursorline
set cursorcolumn
set list
set listchars=tab:»-,eol:¬,extends:»,precedes:«,nbsp:%
set showmatch
set matchtime=3
set matchpairs& matchpairs+=<:>
set laststatus=2
set completeopt=menuone,noinsert,noselect
set wildmenu

"** カラースキーマ設定 **
set t_Co=256
colorscheme solarized

set tabstop=2 "タブ文字幅
set shiftwidth=2 "インデント幅
set expandtab
set smarttab
set smartindent
set viminfo='20,\"1000
let g:python_highlight_all = 1
language en_US.UTF-8

"** ファイル別設定 **
filetype on
filetype plugin indent on
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab
autocmd FileType python set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType c,cpp set cindent cinoptions+=:0,g0
autocmd Filetype html setlocal indentexpr="" smartindent
