autocmd BufEnter * silent! lcd %:p:h

augroup remember_folds
  autocmd!
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent! loadview
augroup END

" Por si la de arriba falla.
" augroup remember_folds
"   autocmd!
"   au BufWinLeave ?* mkview 1
"   au BufWinEnter ?* silent! loadview 1
" augroup END

lua << EOF
require('packer').startup()
EOF
