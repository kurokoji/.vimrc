" dein.vim{{{
if &compatible
  set nocompatible
endif
set runtimepath^=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})

call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/unite.vim')
call dein#add('Townk/vim-autoclose')

call dein#end()
"}}}

imap ^[OA <Up>
imap ^[OB <Down>
imap ^[OC <Right>
imap ^[OD <Left>
set backspace=indent,eol,start "Backspaceを調整

"** 代わりにする **
inoremap <C-j> <esc>

"** ペーストするときにインデントさせない **
inoremap <F5> <nop>
set pastetoggle=<F5>

"** 括弧補完 **
inoremap {<Enter> {}<Left><CR><ESC><S-o>

"** システム設定 **
set nocompatible
set noswapfile                      "swpの作成無効化
set nobackup                        "~の作成無効化
set writebackup                     "上書き成功時に~を削除
set clipboard+=unnamed,autoselect   "クリップボードを共有

"** 折りたたみ **
set foldmethod=marker

"** 文字コード設定 **
set encoding=utf-8                  "vim
set fileencodings=utf-8,iso-2022-jp,cp932,sjis,euc-jp "保存するファイル
set fencs=utf-8,iso-2022-jp,enc-jp,cp932  "開くファイル

"** 表示設定 **
syntax enable                       "ハイライト表示
set title                           "タイトル
set number                          "行番号
set cursorline                      "カーソルラインの表示
set cursorcolumn
set list
set listchars=tab:»-,eol:¬,extends:»,precedes:«,nbsp:%

"** カラースキーマ設定 **
set t_Co=256
colorscheme molokai
"colorscheme hybrid
let g:molokai_original=1
set background=dark

set tabstop=2                       "タブ文字幅
set shiftwidth=2                    "インデント幅
set expandtab                       "タブにスペースを使う
set cindent

"** ファイル別設定 **
filetype on
autocmd BufNewFile *.cpp 0r $HOME/Dropbox/kurokoji/template/cpp.cpp
autocmd FileType c,cpp,perl,html set cindent

