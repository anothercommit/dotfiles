let mapleader = " "
nnoremap <Leader>w <cmd>w<cr>
nnoremap <Leader><S-w> <cmd>wa<cr>
nnoremap <Leader>q <cmd>q<cr>
nnoremap <Leader><S-q> <cmd>qa<cr>

nnoremap <M-j> 9j
nnoremap <M-k> 9k
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
" nnoremap <silent><M-k> <cmd>resize -2<cr>
" nnoremap <silent><M-j> <cmd>resize +2<cr>
" nnoremap <silent><M-l> <cmd>vertical resize -2<cr>
" nnoremap <silent><M-h> <cmd>vertical resize +2<cr>



nnoremap <silent><Leader>n <cmd>nohlsearch<cr>

let $KEYMAPS = '~/.config/nvim/plugin/keymaps.vim'
let $SETTINGS = '~/.config/nvim/plugin/settings.vim'
let $PLUGINS = '~/.config/nvim/plugin/plugins.lua'
let $LUA = '~/.config/nvim/plugin/lua'

nnoremap <silent>.i <cmd>tabnew $MYVIMRC<cr>
nnoremap <silent>.k <cmd>tabnew $KEYMAPS<cr>
nnoremap <silent>.s <cmd>tabnew $SETTINGS<cr>
nnoremap <silent>.p <cmd>tabnew $PLUGINS<cr>
nnoremap <silent>.l <cmd>NvimTreeToggle $LUA<cr>

noremap <silent><C-n> <cmd>NvimTreeToggle<cr>

noremap > <cmd>><cr>
noremap < <cmd><<cr>
noremap <silent><C-f> <cmd>tabnew<cr>
nnoremap <silent><Tab> gt
nnoremap <silent><S-Tab> gT
nnoremap <silent><M-Tab> <cmd>tabonly<cr>
" noremap<C-S-f> <cmd>f

nnoremap <silent>f <cmd>HopChar2<cr>
nnoremap <silent>F <cmd>HopLine<cr>
nnoremap <leader>cd <cmd>lcd %:p:h<CR>:pwd<CR>
nnoremap  ,m <cmd>MarkdownPreviewToggle<cr>
