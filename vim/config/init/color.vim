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
