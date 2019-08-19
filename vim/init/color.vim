" for gruvbox-material
set termguicolors
colorscheme gruvbox-material-hard

" python用のハイライト
if version < 600
  syntax clear
elseif exists('b:current_after_syntax')
  finish
endif

syn match pythonOperator "\(+\|=\|-\|\^\|\*\)"
syn match pythonDelimiter "\(,\|\.\|:\)"
syn keyword pythonSpecialWord self

hi link pythonSpecialWord    Special
hi link pythonDelimiter      Special

let b:current_after_syntax = 'python'

" シンタックスハイライトの有効化
syntax enable

" hilight row number
set cursorline
hi clear CursorLine

" fix terminfo italic parse bug
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

if has('vim_starting')
  " 挿入モード時に非点滅の縦棒タイプのカーソル
  let &t_SI .= "\e[6 q"
  " ノーマルモード時に非点滅のブロックタイプのカーソル
  let &t_EI .= "\e[2 q"
  " 置換モード時に非点滅の下線タイプのカーソル
  let &t_SR .= "\e[4 q"
endif

