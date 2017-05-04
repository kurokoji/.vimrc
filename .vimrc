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
call dein#add('davidhalter/jedi-vim')
call dein#add('kana/vim-smartinput')
call dein#add('itchyny/lightline.vim')
call dein#add('Yggdroot/indentLine')
call dein#add('justmao945/vim-clang')
call dein#add('airblade/vim-gitgutter')
call dein#add('tpope/vim-fugitive')
call dein#add('scrooloose/nerdtree')
call dein#add('jelera/vim-javascript-syntax')
call dein#add('mattn/sonictemplate-vim')

" colorscheme
call dein#add('altercation/vim-colors-solarized')
call dein#add('itchyny/landscape.vim')
call dein#add('tomasr/molokai')

call dein#end()
"}}}

" 'kana/vim-smartinput' {{{

call smartinput#map_to_trigger('i', '<Plug>(smartinput_CR)', '<Enter>', '<Enter>')
call smartinput#map_to_trigger('i', '<Plug>(smartinput_C-h)', '<BS>', '<C-h>')
call smartinput#map_to_trigger('i', '<Plug>(smartinput_BS)', '<BS>', '<BS>')

" }}}
" 'Shougo/neocomplete' {{{
let g:neocomplete#force_overwrite_completefunc = 1
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {} 
endif
let g:neocomplete#force_omni_input_patterns.c =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:neocomplete#force_omni_input_patterns.cpp =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'


augroup cpp-path
    autocmd!
    autocmd FileType cpp setlocal path=.,/usr/local/Cellar/gcc/6.3.0_1/include/c++/6.3.0/x86_64-apple-darwin16.3.0,/usr/local/Cellar/gcc/6.3.0_1/include/c++/6.3.0,/usr/local/cellar/boost/1.63.0/include
augroup END

" include-path
let g:neocomplete#include_paths = {
  \ 'cpp' : '.',
  \ }

let g:neocomplete#include_patterns = {
  \ 'cpp' : '^\s*#\s*include',
  \}

imap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
imap <expr><CR>  pumvisible() ? neocomplete#close_popup() : "\<Plug>(smartinput_CR)"
imap <expr><C-h> neocomplete#smart_close_popup()
"imap <expr><BS> pumvisible() ? neocomplete#smart_close_popup() : "\<Plug>(smartinput_BS)"

" }}}
" 'Shougo/neosnippet' {{{ 
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
 
" SuperTab like snippets behavior.
"imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)"
"\: pumvisible() ? "\<C-n>" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)"
"\: "\<TAB>"
 
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

let g:neosnippet#snippets_directory='~/.vim/dein/repos/github.com/Shougo/neosnippet-snippets/snippets/'

"}}}
" 'davidhalter/jedi-vim' {{{
autocmd FileType python setlocal omnifunc=jedi#completions
autocmd FileType python setlocal completeopt-=preview
let g:jedi#force_py_version=3
let g:jedi#auto_vim_configuration = 1
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
" }}}
" 'airblade/vim-gitgutter' {{{
"let g:gitgutter_sign_added = '✚'
"let g:gitgutter_sign_modified = '➜'
"let g:gitgutter_sign_removed = '✘'

" }}}
" 'itchyny/lightline' {{{
let g:Powerline_symbols='fancy'
let g:lightline = {
  \ 'colorscheme': 'solarized',
  \ 'mode_map': {'c': 'NORMAL'},
  \ 'active': {
  \   'left': [
  \     ['mode', 'paste'],
  \     ['fugitive', 'gitgutter', 'filename'],
  \   ],
  \   'right': [
  \     ['lineinfo', 'syntastic'],
  \     ['percent'],
  \     ['charcode', 'fileformat', 'fileencoding', 'filetype'],
  \   ]
  \ },
  \ 'component_function': {
  \   'modified': 'MyModified',
  \   'readonly': 'MyReadonly',
  \   'fugitive': 'MyFugitive',
  \   'filename': 'MyFilename',
  \   'fileformat': 'MyFileformat',
  \   'filetype': 'MyFiletype',
  \   'fileencoding': 'MyFileencoding',
  \   'mode': 'MyMode',
  \   'syntastic': 'SyntasticStatuslineFlag',
  \   'charcode': 'MyCharCode',
  \   'gitgutter': 'MyGitGutter',
  \ },
  \ 'separator': {'left': "\u2b80", 'right': "\u2b82"},
  \ 'subseparator': {'left': "\u2b81", 'right': "\u2b83"}
  \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &ro ? "\u2b64" : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? substitute(b:vimshell.current_dir,expand('~'),'~','') :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      let _ = fugitive#head()
      return strlen(_) ? "\u2b60 "._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth('.') > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth('.') > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth('.') > 60 ? lightline#mode() : ''
endfunction

function! MyGitGutter()
  if ! exists('*GitGutterGetHunkSummary')
        \ || ! get(g:, 'gitgutter_enabled', 0)
        \ || winwidth('.') <= 90
    return ''
  endif
  let symbols = [
        \ g:gitgutter_sign_added . ' ',
        \ g:gitgutter_sign_modified . ' ',
        \ g:gitgutter_sign_removed . ' '
        \ ]
  let hunks = GitGutterGetHunkSummary()
  let ret = []
  for i in [0, 1, 2]
    if hunks[i] > 0
      call add(ret, symbols[i] . hunks[i])
    endif
  endfor
  return join(ret, ' ')
endfunction

" https://github.com/Lokaltog/vim-powerline/blob/develop/autoload/Powerline/Functions.vim
function! MyCharCode()
  if winwidth('.') <= 70
    return ''
  endif

  " Get the output of :ascii
  redir => ascii
  silent! ascii
  redir END

  if match(ascii, 'NUL') != -1
    return 'NUL'
  endif

  " Zero pad hex values
  let nrformat = '0x%02x'

  let encoding = (&fenc == '' ? &enc : &fenc)

  if encoding == 'utf-8'
    " Zero pad with 4 zeroes in unicode files
    let nrformat = '0x%04x'
  endif

  " Get the character and the numeric value from the return value of :ascii
  " This matches the two first pieces of the return value, e.g.
  " "<F>  70" => char: 'F', nr: '70'
  let [str, char, nr; rest] = matchlist(ascii, '\v\<(.{-1,})\>\s*([0-9]+)')

  " Format the numeric value
  let nr = printf(nrformat, nr)

  return "'". char ."' ". nr
endfunction

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
let g:clang_format_exec = 'clang-format'
let g:clang_c_options = '-std=c11'
"let g:clang_cpp_options = '-std=c++11 -I/usr/lib/gcc/x86_64-pc-cygwin/5.4.0/include/c++ -I/usr/lib/boost/../'
let g:clang_cpp_options = '-std=c++14 -stdlib=libc++ -I/usr/local/Cellar/gcc/6.3.0_1/include/c++/6.3.0/x86_64-apple-darwin16.3.0/ -I/usr/local/Cellar/gcc/6.3.0_1/include/c++/6.3.0 -I/usr/local/cellar/boost/1.63.0/include'
"setlocal path+=/usr/lib/boost/../

" }}}
" 'scrooloose/nerdtree' {{{
let g:NERDTreeShowBookmarks=1
let g:NERDTreeDirArrows = 1
"let g:NERDTreeDirArrowExpandable  = '>'
"let g:NERDTreeDirArrowCollapsible = '⇩'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" }}}
" 'mattn/sonictemplate-vim' {{{
let g:sonictemplate_vim_template_dir = [
      \ '~/.vim/template'
      \]

" }}}
" function {{{
" }}}

set backspace=indent,eol,start "Backspaceを調整

"** 代わりにする **
inoremap <C-j> <esc>
"inoremap <silent> jj <esc>

"** ペーストするときにインデントさせない **
inoremap <F5> <nop>
set pastetoggle=<F5>

"** システム設定 **
set nocompatible
set noswapfile                      "swpの作成無効化
set nobackup                        "~の作成無効化
set writebackup                     "上書き成功時に~を削除
"set clipboard=unnamed,autoselect  "クリップボードを共有
set infercase
set autoread
set nowrap                          "折り返ししない

"** 折りたたみ **
set foldmethod=marker

"** 文字コード設定 **
set encoding=utf-8                  "vim
set fileencodings=utf-8,iso-2022-jp,cp932,sjis,euc-jp "保存するファイル
set fencs=utf-8,iso-2022-jp,enc-jp,cp932  "開くファイル

"** 表示設定 **
syntax enable                       "ハイライト表示
scriptencoding utf-8
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
colorscheme solarized
"colorscheme molokai
"let g:molokai_original=1
set background=dark
"hi SpecialKey ctermfg=237 guifg=#3a3a3a
"hi NonText ctermfg=66 guifg=#5f8787

set tabstop=2                       "タブ文字幅
set shiftwidth=2                    "インデント幅
set expandtab                       "タブにスペースを使う
set smarttab
set smartindent
let g:python_highlight_all = 1
language en_US.UTF-8

"** ファイル別設定 **
filetype on
filetype plugin indent on
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab
autocmd FileType python set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType javascript setlocal smartindent omnifunc=tern#Complete
autocmd FileType c,cpp set cindent cinoptions+=:0,g0
autocmd Filetype html setlocal indentexpr="" smartindent
