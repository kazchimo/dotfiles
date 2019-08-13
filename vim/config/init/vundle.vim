set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'sheerun/vim-polyglot'

" note taking plugin
Plugin 'xolox/vim-notes'
Plugin 'xolox/vim-misc'

" go plugin
Plugin 'fatih/vim-go'

Plugin 'sainnhe/gruvbox-material'

" 導入したいプラグインを以下に列挙
" Plugin '[Github Author]/[Github repo]' の形式で記入
Plugin 'osyo-manga/vim-over'
Plugin 'kakkyz81/evervim'
Plugin 'airblade/vim-gitgutter'
Plugin 'jacoborus/tender.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'alvan/vim-closetag' "htmlなどのタグを自動で閉じる
Plugin 'cohama/lexima.vim' "カッコなどを自動閉じ
Plugin 'kamykn/spelunker.vim' " スペルチェック

Plugin 'vim-python/python-syntax'

" カラーテーマ
Plugin 'w0ng/vim-hybrid'

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

call vundle#end()

