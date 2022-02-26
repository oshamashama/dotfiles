set encoding=utf-8
" editor setting
set number
set splitbelow
set splitright
set wildmenu


" setting
set t_Co=256
set cursorline
set guifont=Cica
set autoindent
set smartindent
set ambiwidth=double
set fileencodings=utf-8

" swpファイル出力先
set directory=~/log-file-position/
" バックアップファイル出力先
set backupdir=~/log-file-position/
" undoファイル出力先
set undodir=~/log-file-position/

" status を常時表示
set laststatus=2
" set title

" set statusline^=%{coc#status()}


" https://qiita.com/nobu-maple/items/8f4e29ac40e8ac8cbe03
" 行頭行末の左右移動で行をまたぐ
set whichwrap=b,s,h,l,<,>,[,]

set scrolloff=4


" 保存されていないファイルがあるときは終了前に保存確認
set confirm
" 保存されていないファイルがあるときでも別のファイルを開くことが出来る
" set hidden
" 外部でファイルに変更がされた場合は読みなおす
set autoread
" ファイル保存時にバックアップファイルを作らない
set nobackup
" ファイル編集中にスワップファイルを作らない
set noswapfile

" 検索文字列をハイライトする
set hlsearch
" インクリメンタルサーチを行う
set incsearch
" 大文字と小文字を区別しない
set ignorecase
" 大小文字が混在した言葉で検索を行った場合のみ大小文字を区別
set smartcase
" 最後尾まで検索を終えたら次の検索で先頭に移る
set wrapscan

" タブ入力を複数の空白入力に置き換える
set expandtab
" 画面上でタブ文字が占める幅
set tabstop=2
" 自動インデントでずれる幅
set shiftwidth=2
" 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set softtabstop=2
" 改行時に前の行のインデントを継続する
set autoindent
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent

" OSのクリップボードをレジスタ指定無しで Yank, Put 出来るようにする
" set clipboard=unnamed,unnamedplus
" マウスの入力を受け付ける
set mouse=a
" Windows でもパスの区切り文字を / にする
" set shellslash
" インサートモードから抜けると自動的にIMEをオフにする
" set iminsert=2

" コマンドラインモードでTABキーによるファイル名補完を有効に
set wildmenu wildmode=list:longest,full
" コマンドラインの履歴を10000件保存する
set history=10000



"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/shama/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/home/shama/.cache/dein')

" Let dein manage dein
" Required:
"call dein#add('/home/shama/.cache/dein/repos/github.com/Shougo/dein.vim')

" Add or remove your plugins here like this:
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')
call dein#add('vim-jp/vimdoc-ja')

" add
call dein#load_toml('/home/shama/.config/nvim/dein.toml', {'lazy': 0})
call dein#load_toml('/home/shama/.config/nvim/dein_lazy.toml', {'lazy': 1})

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------



" for coc-pairs
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" for airline
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1

" カーソルキーでbuffer移動
nnoremap <Left> :bp<CR>
nnoremap <Right> :bn<CR>
" Smarter tab line有効化
let g:airline#extensions#tabline#enabled = 1
" powerline font入れないと若干ダサい
let g:airline_powerline_fonts = 1


" 実行時に前回の表示内容をクローズ&保存してから実行
let g:quickrun_no_default_key_mappings = 1
" nmap <Leader>r :cclose<CR>:write<CR>:QuickRun -mode n<CR>

" nnoremap <F11> :QuickRun<CR>
nnoremap run :QuickRun<CR>
nnoremap <C-v><F11> :QuickRun<CR>

" \   'outputter/buffer/close_on_empty': 1
let g:quickrun#default_config = {
\ '_': {
\   'hook/time/enable': 1,
\   'outputter/buffer/split': 'botright',
\   'outputter/error/error': 'quickfix',
\   'outputter/error/success': 'buffer',
\   'outputter/quickfix/open_cmd': 'copen',
\   'runner': 'vimproc',
\   'runner/vimproc/updatetime': 60,
\ },
\ 'python': {
\   'command': 'python3',
\ },
\ 'cpp': {
\   'command': 'g++',
\   'input': 'test/sample-1.in',
\   'runner': 'system',
\ },
\}

autocmd TermOpen * startinsert
tnoremap <Esc> <C-\><C-n>
command! -nargs=* T split | wincmd j | resize 20 | terminal <args>



let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('sources', {
\ 'gitcommit': ['look'],
\})
