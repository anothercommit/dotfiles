let mapleader = " "

nnoremap <Leader>w :w<cr>
nnoremap <Leader>q :q<cr>

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <silent><M-k> :resize -2<cr>
nnoremap <silent><M-j> :resize +2<cr>
nnoremap <silent><M-l> :vertical resize -2<cr>
nnoremap <silent><M-h> :vertical resize +2<cr>

nnoremap <silent>,<Tab> :BufferLineCycleNext<cr>
nnoremap <silent>,<S-Tab> :BufferLineCyclePrev<cr>
nnoremap <silent><Leader>,<Tab> :BufferLinePickClose<cr>
nnoremap <silent><Leader><Tab> :BufferLinePick<cr>

nnoremap <silent><Leader>n :nohlsearch<cr>

let $KEYMAPS = '~/.config/nvim/plugin/keymaps.vim'
let $SETTINGS = '~/.config/nvim/plugin/settings.vim'
let $PLUG = '~/.config/nvim/plugin/plug.vim'
let $LUA = '~/.config/nvim/plugin/lua'

nnoremap <silent>.k :vsplit $KEYMAPS<cr>
nnoremap <silent>.s :vsplit $SETTINGS<cr>
nnoremap <silent>.p :vsplit $PLUG<cr>
nnoremap <silent>.i :vsplit $MYVIMRC<cr>
nnoremap <silent>.l :vsplit $LUA<cr>

noremap <silent><C-n> :NvimTreeToggle<cr>

nnoremap <silent>f :lua require'hop'.hint_char1()<cr>
nnoremap <silent>,l :lua require'hop'.hint_lines()<cr>
