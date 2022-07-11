let mapleader = " "
let $KEYMAPS = '~/.config/nvim/keymaps.vim'
let $SETTINGS = '~/.config/nvim/settings.vim'
let $PLUGINS = '~/.config/nvim/plugin/plugins.lua'
let $LUA = '~/.config/nvim/plugin/lua'

nnoremap <M-j> 9j
nnoremap <M-k> 9k
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h


" Actions <Leader>
nnoremap <Leader>w <cmd>w<cr>
nnoremap <Leader>q <cmd>q<cr>
nnoremap <silent><Leader>n <cmd>nohlsearch<cr>
nnoremap <leader>cd <cmd>lcd %:p:h<CR>:pwd<CR>
nnoremap <Leader>p <cmd>MarkdownPreviewToggle<cr>
nnoremap <leader>f <cmd>RustFmt<cr>

" Movement <,>
nnoremap ,c <cmd>HopChar2<cr>
nnoremap ,l <cmd>HopLine<cr>

" TODO: encontrar un mejor binding para esto
" nnoremap <silent>,i <cmd>tabnew $MYVIMRC<cr>
" nnoremap <silent>,k <cmd>tabnew $KEYMAPS<cr>
" nnoremap <silent>,s <cmd>tabnew $SETTINGS<cr>
" nnoremap <silent>,p <cmd>tabnew $PLUGINS<cr>
" nnoremap <silent>,l <cmd>NvimTreeToggle $LUA<cr>
nnoremap <silent><C-\> <cmd>ToggleTerm<cr>

noremap <silent><C-n> <cmd>NvimTreeToggle<cr>





nnoremap <silent><Tab> gt
nnoremap <silent><S-Tab> gT
nnoremap <silent><M-Tab> <cmd>tabonly<cr>
