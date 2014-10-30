
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
" git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" :BundleInstall
"
set rtp+=~/.vim/vundle.git
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'chase/vim-ansible-yaml'

Bundle 'clones/vim-l9'
Bundle 'FuzzyFinder'
Bundle 'Shougo/neocomplcache'
Bundle 'thinca/vim-quickrun'

"ruby
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-cucumber'

"js
Bundle 'JavaScript-syntax'
Bundle 'itspriddle/vim-javascript-indent'

"php
"Bundle 'cakephp.vim'

if has('vim_starting')
  " bundle directory setup
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  " import neobundle
  " mkdir -p ~/.vim/bundle
  " git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

" manage neobundle
NeoBundleFetch 'Shougo/neobundle.vim'

" plugins
NeoBundle 'Flake8-vim'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'hynek/vim-python-pep8-indent'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdtree'

" neobundle close
call neobundle#end()

filetype indent plugin on

NeoBundleCheck

let g:PyFlakeOnWrite = 1
let g:PyFlakeCheckers = 'pep8.mccabe.pyflakes'
let g:PyFlakeDefaultComplexity=10

let g:syntastic_python_chekers  = ['pyflakes','pep8']



