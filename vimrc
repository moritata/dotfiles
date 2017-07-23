
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
" 自動改行オフ
set tw=0
set textwidth=0
set formatoptions=q

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

""
"" curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
"" sh ./installer.sh {specify the installation directory}
"" sh ./installer.sh ~/.vim/dein

"dein scripts---------------------------------------------------
if &compatible
  set nocompatible " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state(expand('~/.vim/dein'))
  call dein#begin(expand('~/.vim/dein'))

  " Let dein manage dein
  " Required:
  call dein#add('Shougo/dein.vim')

  " Add or Remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('editorconfig/editorconfig-vim')
  call dein#add('Shougo/vimproc.vim')
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('Shougo/neocomplcache')
  call dein#add('Shougo/neomru.vim')
  "call dein#add('Shougo/neosnippet')
  call dein#add('mattn/emmet-vim')
  call dein#add('itchyny/lightline.vim')
  call dein#add('andviro/flake8-vim')
  call dein#add('chase/vim-ansible-yaml')
  call dein#add('davidhalter/jedi-vim')
  call dein#add('hynek/vim-python-pep8-indent')
  call dein#add('Townk/vim-autoclose')
  call dein#add('thinca/vim-quickrun')
  call dein#add('clones/vim-l9')
  "call dein#add('scrooloose/syntastic')
  call dein#add('scrooloose/nerdtree')
  call dein#add('thinca/vim-quickrun')
  call dein#add('vim-ruby/vim-ruby')
  call dein#add('tpope/vim-rails')
  call dein#add('tpope/vim-cucumber')
  call dein#add('vim-scripts/grep.vim')
  call dein#add('vim-scripts/FuzzyFinder')
  call dein#add('vim-erlang/vim-erlang-runtime')
  call dein#add('vim-erlang/vim-erlang-omnicomplete')
  call dein#add('pangloss/vim-javascript')
  call dein#add('jelera/vim-javascript-syntax')
  call dein#add('Rykka/clickable.vim')
  call dein#add('Rykka/riv.vim')
  call dein#add('vim-syntastic/syntastic')
  call dein#add('Rykka/InstantRst')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell',{ 'rev': '378e5' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup
" if dein#check_install()
"   call dein#install()
" endif

" End dein Scripts----------------------------------------

let g:PyFlakeOnWrite = 1
let g:PyFlakeCheckers = 'pep8.mccabe.pyflakes'
let g:PyFlakeDefaultComplexity=10

let g:syntastic_python_chekers  = ['pyflakes','pep8']

"""" erlang setting """"
au BufNewFile,BufRead *.erl setf erlang
au FileType erlang setlocal makeprg=erlc\ %
au FileType erlang setlocal errorformat=%f:%l:\ %m

"--------------------------------
" status line setting
"--------------------------------
set t_Co=256
set laststatus=2
set showmode  "現在のモードを表示
set showcmd   "打ったコマンドをステータスラインの下に表示
set ruler     "ステータスラインの右側にカーソルの現在位置を表示

