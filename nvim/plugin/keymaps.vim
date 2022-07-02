let mapleader = " "
nnoremap <Leader>w :w<cr>
nnoremap <Leader>q :q<cr>

nnoremap <M-j> 9j
nnoremap <M-k> 9k
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
" nnoremap <silent><M-k> :resize -2<cr>
" nnoremap <silent><M-j> :resize +2<cr>
" nnoremap <silent><M-l> :vertical resize -2<cr>
" nnoremap <silent><M-h> :vertical resize +2<cr>



nnoremap <silent><Leader>n :nohlsearch<cr>

let $KEYMAPS = '~/.config/nvim/plugin/keymaps.vim'
let $SETTINGS = '~/.config/nvim/plugin/settings.vim'
let $PLUGINS = '~/.config/nvim/plugin/plugins.lua'
let $LUA = '~/.config/nvim/plugin/lua'

nnoremap <silent>.i :vsplit $MYVIMRC<cr>
nnoremap <silent>.k :vsplit $KEYMAPS<cr>
nnoremap <silent>.s :vsplit $SETTINGS<cr>
nnoremap <silent>.p :vsplit $PLUGINS<cr>
nnoremap <silent>.l :vsplit $LUA<cr>

noremap <silent><C-n> :NvimTreeToggle<cr>

noremap <silent><C-f> :tabnew<cr>
nnoremap <silent><Tab> gt
nnoremap <silent><S-Tab> gT
nnoremap <silent><M-Tab> :tabonly<cr>
" noremap<C-S-f> :f

nnoremap <silent>f :HopChar2<cr>
nnoremap <silent>F :HopLine<cr>
