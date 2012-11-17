" 各種設定
set encoding=utf8 tabstop=2 shiftwidth=2 expandtab autoindent nocompatible nomodeline
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
