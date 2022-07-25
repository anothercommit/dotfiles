let $KEYMAPS = '~/.config/nvim/keymaps.lua'
let $SETTINGS = '~/.config/nvim/settings.vim'
let $PLUGINS = '~/.config/nvim/plugin/plugins.lua'
let $LUA = '~/.config/nvim/plugin/lua'


autocmd BufEnter * silent! lcd %:p:h

autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })

lua << EOF
require('packer').startup()
EOF
