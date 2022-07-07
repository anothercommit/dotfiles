source ~/.config/nvim/keymaps.vim
source ~/.config/nvim/settings.vim

autocmd BufEnter * silent! lcd %:p:h

lua << EOF
require('packer').startup()
EOF
