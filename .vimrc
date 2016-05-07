map ^[OA <Up>
imap ^[OB <Down>
imap ^[OC <Right>
imap ^[OD <Left>
set backspace=indent,eol,start "Backspaceを調整

"** 代わりにする **
imap <C-j> <esc>

"** ペーストするときにインデントさせない **
imap <F5> <nop>
set pastetoggle=<F5>

"** 括弧補完 **
inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>

"inoremap ( ()<ESC>i
"inoremap (<Enter> ()<Left><CR><ESC><S-o>

"** システム設定 **
set nocompatible
set noswapfile                      "swpの作成無効化
set nobackup                        "~の作成無効化
set writebackup                     "上書き成功時に~を削除
set clipboard+=unnamed,autoselect   "クリップボードを共有
 
"** 文字コード **
set encoding=utf-8                  "vim
set fileencodings=utf-8,iso-2022-jp,cp932,sjis,euc-jp "保存するファイル
set fencs=utf-8,iso-2022-jp,enc-jp,cp932  "開くファイル

"** 表示 **
syntax enable                       "ハイライト表示
set title                           "タイトル
set number                          "行番号
set cursorline                      "カーソルラインの表示
set cursorcolumn

"** カラースキーマ **
set t_Co=256
"colorscheme molokai
"colorscheme solarized
colorscheme hybrid
"let g:molokai_original=1
set background=dark

set tabstop=2                       "タブ文字幅
set shiftwidth=2                    "インデント幅
"set noexpandtab                     "挿入モードでタブ文字有効
set expandtab                       "タブにスペースを使う
set cindent
"set smarttab

"** ファイル別設定 **
filetype on
autocmd BufNewFile *.cpp 0r $HOME/.vim/template/cpp.cpp
autocmd FileType c,cpp,perl,html set cindent

