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
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/neoinclude.vim')
call dein#add('Shougo/vimfiler')
call dein#add('Shougo/vimshell.vim')
call dein#add('kana/vim-smartinput')
call dein#add('davidhalter/jedi-vim')
call dein#add('itchyny/lightline.vim')
call dein#add('Yggdroot/indentLine')
call dein#add('justmao945/vim-clang')
call dein#add('vim-template')

call dein#end()
"}}}

" 'Shougo/neocomplete' {{{
let g:neocomplete#enable_at_startup = 1

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {} 
endif
let g:neocomplete#force_overwrite_completefunc = 1
let g:neocomplete#force_omni_input_patterns.c =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:neocomplete#force_omni_input_patterns.cpp =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

" }}}
" 'Shougo/neosnippet' {{{ 
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
 
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"
 
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

"}}}
" 'davidhalter/jedi-vim' {{{
autocmd FileType python setlocal omnifunc=jedi#completions
autocmd FileType python setlocal completeopt-=preview
let g:jedi#auto_vim_configuration = 0

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
" }}}
" 'itchyny/lightline' {{{
let g:lightline = {
  \ 'colorscheme': 'solarized'
  \ }

" }}}
" 'Yggdroot/indentLine' {{{

let g:indentLine_color_term = 239
let g:indentLine_char = '|'

"}}}
" 'Shougo/vimfiler' {{{
let g:vimfiler_as_default_explorer=1

" }}}
" 'justmao945/vim-clang' {{{

let g:clang_auto = 0
let g:clang_complete_auto = 0
let g:clang_auto_select = 0
let g:clang_use_library = 1
let g:clang_c_completeopt = 'menuone'
let g:clang_cpp_completeopt = 'menuone'
let g:clang_exec = 'clang'
let g:clang_cpp_options = '-std=c++11 -I/usr/include/c++/5.4.0'
" }}}

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

"** システム設定 **
set nocompatible
set noswapfile                      "swpの作成無効化
set nobackup                        "~の作成無効化
set writebackup                     "上書き成功時に~を削除
set clipboard+=unnamed,autoselect   "クリップボードを共有
set infercase
set autoread

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
set showmatch
set matchtime=3
set matchpairs& matchpairs+=<:>
set laststatus=2

"** カラースキーマ設定 **
set t_Co=256
"colorscheme molokai
"colorscheme hybrid
colorscheme solarized
"let g:molokai_original=1
set background=dark

set tabstop=2                       "タブ文字幅
set shiftwidth=2                    "インデント幅
set expandtab                       "タブにスペースを使う
set cindent
let g:python_highlight_all = 1

"** ファイル別設定 **
filetype on
autocmd BufNewFile *.cpp 0r $HOME/Dropbox/kurokoji/template/cpp.cpp
autocmd FileType c,cpp,perl,html,python set cindent
