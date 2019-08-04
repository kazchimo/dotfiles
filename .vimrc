set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" 導入したいプラグインを以下に列挙
" Plugin '[Github Author]/[Github repo]' の形式で記入
Plugin 'airblade/vim-gitgutter'
Plugin 'jacoborus/tender.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'alvan/vim-closetag' "htmlなどのタグを自動で閉じる
Plugin 'cohama/lexima.vim' "カッコなどを自動閉じ
Plugin 'kamykn/spelunker.vim' " スペルチェック 

" vimautoformat
Plugin 'Chiel92/vim-autoformat'

"previm
Plugin 'tyru/open-browser.vim'
Plugin 'kannokanno/previm'

" スクロールをなめらかにする 
Plugin 'yuttie/comfortable-motion.vim'

" markdownエディット用
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" コードフォーマッタ
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plugin 'google/vim-glaive'

" ypafとの連携
Plugin 'pignacio/vim-yapf-format'

Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'jiangmiao/auto-pairs'

Plugin 'ervandew/supertab'

Plugin 'Lokaltog/vim-easymotion' 
Plugin 'tpope/vim-fugitive'

" シンタックスチェック
Plugin 'scrooloose/syntastic'

" Plugin 'Shougo/deoplete.nvim'
" Plugin 'roxma/vim-hug-neovim-rpc'
" Plugin 'roxma/nvim-yarp'
call vundle#end()
filetype plugin indent on

autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
autocmd BufNewFile,BufRead *.bash* set filetype=shell

" autoformatの設定
au BufWrite * :Autoformat

" Previm
let g:previm_open_cmd = ''
nnoremap [previm] <Nop>
nmap <Space>p [previm]
nnoremap <silent> [previm]o :<C-u>PrevimOpen<CR>
nnoremap <silent> [previm]r :call previm#refresh()<CR>

" vim-closinの設定
let g:closetag_filenames = '*.html,*.xml, *.xhtml,*.phtml'
let g:closetag_shortcut = '>'

" vim-airlineの設定
let g:airline_theme='jellybeans'

" deoplete.nvim用
let g:deoplete#enable_at_startup = 1

" easymotion用の設定
map <Space> <Plug>(easymotion-s2)

" vim-codefmtの自動フォーマット設定
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType vue AutoFormatBuffer prettier
augroup END

" syntastics用の設定
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" yapfのpath設定
let g:yapf_format_yapf_location ="/Users/moriyamakazuki/.pyenv/shims/yapf"

" テーマの設定
syntax enable
colorscheme tender

" setting
"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd


" 見た目系
" 行番号を表示
set number
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
" シンタックスハイライトの有効化
syntax enable

" カーソル設定
if has('vim_starting')
    " 挿入モード時に非点滅の縦棒タイプのカーソル
    let &t_SI .= "\e[6 q"
    " ノーマルモード時に非点滅のブロックタイプのカーソル
    let &t_EI .= "\e[2 q"
    " 置換モード時に非点滅の下線タイプのカーソル
    let &t_SR .= "\e[4 q"
endif


" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2


" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>
" jjでエスケープ
inoremap <silent> jj <ESC>

" 日本語入力で”っj”と入力してもEnterキーで確定させればインサートモードを抜ける
inoremap <silent> っj <ESC>
