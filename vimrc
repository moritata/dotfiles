
" 各種設定
set encoding=utf8 tabstop=2 shiftwidth=2 expandtab autoindent nocompatible nomodeline autoread
" 文字コードの自動認識
set fileencodings=utf8,euc-jp,sjis,iso-2022-jp
" 改行コードの自動認識
set fileformats=unix,dos,mac
" 括弧入力時の対応する括弧を表示
set laststatus=2
" ステータスラインの表示フォーマット
set statusline=%y%{GetStatusEx()}%F%m%r%=<%c:%l>
" ステータスラインの色
highlight Statusline term=NONE cterm=NONE ctermfg=black ctermbg=white
set tags+=tags;
" 行番号の表示
"set number

" シンタックスハイライトを有効
syntax on
" 検索結果文字列のハイライトを有効にする
set hlsearch
" コメント文の色を変更
highlight Comment ctermfg=DarkCyan
" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

" オートコマンド
if has("autocmd")
  " ファイルタイプ別インデント、プラグインを有効
  filetype on
  filetype indent on
  filetype plugin on
endif

function! GetStatusEx()
  let str = ''
  let str = str . '' . &fileformat . ']'
  if has('multi_byte') && &fileencoding != ''
    let str = '[' . &fileencoding . ':' . str
  endif
  return str
endfunction

filetype off

" Vundle setup
" git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/Vundle.vim
" :BundleInstall
" Ref. : https://github.com/VundleVim/Vundle.vim
" git clone https://github.com/VundleVim/Vundle.vim.git \
" ~/.vim/bundle/Vundle.vim
" :PluginInstall
" 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
"Plugin 'gmarik/Vundle.vim'
Plugin 'chase/vim-ansible-yaml'

Plugin 'clones/vim-l9'
Plugin 'FuzzyFinder'
Plugin 'Shougo/neocomplcache'
Plugin 'thinca/vim-quickrun'

"ruby
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-cucumber'

"js
Plugin 'JavaScript-syntax'
Plugin 'itspriddle/vim-javascript-indent'

"php
"Bundle 'cakephp.vim'

" reStructured
Plugin 'Rykka/riv.vim'

call vundle#end()

if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(expand('~/.vim/dein'))
  call dein#begin(expand('~/.vim/dein'))

  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/vimproc.vim')
  call dein#add('Shougo/neocompile.vim')
  call dein#add('Shougo/neomru.vim')
  call dein#add('Shougo/neosnippet')
  call dein#add('Flake8-vim')
  call dein#add('davidhalter/jedi-vim')
  call dein#add('hynek/vim-python-pep8-indent')
  call dein#add('Townk/vim-autoclose')
  call dein#add('scrooloose/syntastic')
  call dein#add('scrooloose/nerdtree')
  call dein#add('thinca/vim-quickrun')
  call dein#add('grep.vim')
  call dein#add('vim-erlang/vim-erlang-runtime')
  call dein#add('vim-erlang/vim-erlang-omnicomplete')
  call dein#add('Rikka/InstantRst')
endif

filetype plugin indent on
syntax enable

let g:PyFlakeOnWrite = 1
let g:PyFlakeCheckers = 'pep8.mccabe.pyflakes'
let g:PyFlakeDefaultComplexity=10

let g:syntastic_python_chekers  = ['pyflakes','pep8']

"""" erlang setting """"
au BufNewFile,BufRead *.erl setf erlang
au FileType erlang setlocal makeprg=erlc\ %
au FileType erlang setlocal errorformat=%f:%l:\ %m


