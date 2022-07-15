" source ~/.config/nvim/keymaps.vim
source ~/.config/nvim/keymaps.lua
source ~/.config/nvim/settings.vim

let $KEYMAPS = '~/.config/nvim/keymaps.lua'
let $SETTINGS = '~/.config/nvim/settings.vim'
let $PLUGINS = '~/.config/nvim/plugin/plugins.lua'
let $LUA = '~/.config/nvim/plugin/lua'


autocmd BufEnter * silent! lcd %:p:h


lua << EOF
require('packer').startup()
EOF
