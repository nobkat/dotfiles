
set nocompatible	" Use Vim defaults (much better!)

set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp
set fileformats=unix,dos,mac
set backspace=indent,eol,start		" allow backspacing over everything in insert mode
set ambiwidth=double
nnoremap <C-h> Xh 
nnoremap <backspace> Xh 
set nobackup		" dont keep a backup file
set nowritebackup
set noswapfile
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set ruler		" show the cursor position all the time

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif
 
set shortmess+=I  "起動時メッセージ無効
set smartindent "あたらしい行をつくったらインデント
set autoindent "前の行と同じインデント
set smarttab
set tabstop=4 shiftwidth=4 softtabstop=0 "タブを２
set expandtab "タブをスペースに
set number "行番号
set wildmenu "コマンドモードの一覧
set wildchar=<tab>
set wildmode=list:full
set history=1000 "コマンド・検索パターンの履歴
set complete+=k "補完に辞書ファイル追加
set list "不可視文字の表示
set listchars=trail:~,extends:>,precedes:<,nbsp:_,tab:▸\ 
set scrolloff=5 "カーソルの上または下に表示する最小限の行数。 
set whichwrap=b,s,h,l,<,>,[,] "カーソルを行頭，行末で止まらないようにする。
"選択した文字列を検索
vnoremap <silent> // y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
"選択した文字列を置換
vnoremap /r "xy:%s/<C-R>=escape(@x, '\\/.*$^~[]')<CR>//gc<Left><Left><Left>
set laststatus=2 " 常にステータスラインを表示
set statusline=%<%f\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%4v\ %l/%L
set display=uhex "表示できない文字を<xx>の形で表示
set matchpairs& matchpairs+=<:>
set matchtime=3
set foldcolumn=1
set clipboard=unnamed
"set virtualedit=all  "文字のないところへカーソルを移動
set hidden
set gdefault   " 置換の時 g オプションをデフォルトで有効にする

"w!!でスーパーユーザーとして保存
cmap w!! w !sudo tee > /dev/null %
inoremap jj <Esc> "jjでESC

"imap <C-I> <C-V><Tab>
""表示行単位で移動
nnoremap j gj
nnoremap k gk
nnoremap <S-Up>v<Up>
" ctrl + A, E, K, D, H
imap <C-a> <esc>I
imap <C-e> <esc>E
imap <C-k> <esc>lDA
imap <C-d> <delete>
imap <C-h> <backspace>
" Shift + 矢印で visual modeがはじまる
nnoremap <S-Down> v<Down>
nnoremap <S-Left> v<Left>
nnoremap <S-Right> v<Right>
imap <S-Up> <ESC>v<Up>
imap <S-Down> <ESC>v<Down>
imap <S-Left> <ESC>v<Left>
imap <S-Right> <ESC>v<Right>
" visual mode 中のShift + 矢印は範囲選択
vnoremap <S-Up> k
vnoremap <S-Down> j
vnoremap <S-Left> h
vnoremap <S-Right> l

nmap <CR> i<CR>

vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

"ctrl-e でPython
autocmd BufNewFile,BufRead *.py nnoremap <C-e> :!python3 %
autocmd FileType python setlocal completeopt-=preview


"Leaderをスペースキーに
let mapleader = "\<Space>"
noremap <Leader>h ^
noremap <Leader>l $
noremap <Leader>w :w<CR>

nnoremap <silent><Esc><Esc> :<C-u>nohlsearch<CR>

"Buffer
nnoremap <silent>bp :bprevious<CR>
nnoremap <silent>bn :bnext<CR>
nnoremap <silent>bb :b#<CR>
nnoremap <silent>bd :bdelete<CR>
nnoremap <silent>bl :ls<CR>
"dein Scripts-----------------------------
"if &compatible
"  set nocompatible               " Be iMproved
"endif

" Requiredj:
"set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
"if dein#load_state('~/.vim/dein/.')
"  call dein#begin('~/.vim/dein/.')
"
"  " Let dein manage dein
"  " Required:
"  call dein#add('~/.vim/dein/repos/github.com/Shougo/dein.vim')
"
  " Add or remove your plugins here:
"  "call dein#add('Shougo/neosnippet.vim')
"  "call dein#add('Shougo/neosnippet-snippets')
"  "call dein#add('davidhalter/jedi-vim')
"  call dein#add('easymotion/vim-easymotion')
"  call dein#add('ervandew/supertab') ""
"  call dein#add('Townk/vim-autoclose') "自動で括弧を閉じる
"  call dein#add('AndrewRadev/switch.vim') "+ -
"  call dein#add('thinca/vim-quickrun') "Leader r
"  call dein#add('junegunn/vim-easy-align') "enter key enter
"  call dein#add('Shougo/unite.vim') "book mark
"  call dein#add('Shougo/vimfiler') "filer
"  call dein#add('Shougo/vimproc', {'build' : 'make'})
"  call dein#add('scrooloose/syntastic')

  " You can specify revision/branch/tag.
"  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  " Required:
"  call dein#end()
"  call dein#save_state()
"endif

" Required:
"filetype plugin indent on
"syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------

" vim-easymotion の設定 -------------------------
" ホームポジションに近いキーを使う
"let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
" 「'」 + 何かにマッピング
"let g:EasyMotion_leader_key="'"
" ストローク選択を優先する
"let g:EasyMotion_grouping=1
" 検索時、大文字小文字を区別しない
"  let g:EasyMotion_smartcase = 1
" カラー設定変更
"hi EasyMotionTarget ctermbg=none ctermfg=red
"hi EasyMotionShade  ctermbg=none ctermfg=blue
" デフォルトのキーマッピングを無効に
"  let g:EasyMotion_do_mapping = 0

"  to move to {char}
"nmap  <Leader>f <Plug>(easymotion-bd-f)
"map <Leader>f <Plug>(easymotion-overwin-f)

" , to move to {char}{char}
nmap , <Plug>(easymotion-overwin-f2)
vmap , <Plug>(easymotion-bd-f2)

" f + 2文字 で画面全体を検索してジャンプ
"nmap f <plug>(easymotion-overwin-f2)

"Switch -----------------------------------------
nmap + :Switch<CR>
nmap - :Switch<CR>

" unite.vim keymap -----------------------:-------
"
" The prefix key.
"nnoremap    [unite]   <Nop>
"nmap    <Leader>u [unite]
"
"let g:unite_source_history_yank_enable =1
"nnoremap <silent> [unite]f :<C-u>Unite<Space>file<CR>
"nnoremap <silent> [unite]g :<C-u>Unite<Space>grep<CR>
"nnoremap <silent> [unite]u :<C-u>Unite<Space>buffer<CR>
"nnoremap <silent> [unite]b :<C-u>Unite<Space>bookmark<CR>
"nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
"nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
"nnoremap <silent> [unite]h :<C-u>Unite<Space>history/yank<CR>
"nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
"nnoremap <silent> [unite]c :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"
"
"let g:unite_source_grep_command = 'ag'
"let g:unite_source_grep_default_opts = '--nocolor --nogroup'
"let g:unite_source_grep_max_candidates = 200
"let g:unite_source_grep_recursive_opt = ''
" unite-grepの便利キーマップ
"vnoremap /g y:Unite grep::-iRn:<C-R>=escape(@", '\\.*$^[]')<CR><CR>
"let g:unite_source_bookmark_directory = $HOME . '/.vim/unite/bookmark'

"esc二回で終了
"au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
"au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

"Vimfiler -----------------------------------------
"let g:vimfiler_as_default_explorer=1
"nmap <Leader>f :VimFiler -split -simple -winwidth=35 -no-quit<CR>
"let g:vimfiler_safe_mode_by_default=0
"let g:vimfiler_enable_auto_cd = 1

"Quickrun -----------------------------------------
"nnoremap <silent> <Leader>q :<C-u>QuickRun<CR>
"let g:quickrun_config={'*': {'split': '', 'runmode': 'async:remote:vimproc'},'python':{'command':'python3'}}
"let g:quickrun_config._ = {'runner' : 'vimproc', 'runner/vimproc/updatetime' : 100, 'hook/time/enable' : 1}
"set splitbelow
"nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

" vim-easymotion の設定 -------------------------
"let g:syntastic_python_checkers = ["flake8"]
nmap <Leader>s :Errors

