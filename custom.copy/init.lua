local autocmd = vim.api.nvim_create_autocmd
-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

-- ███╗   ██╗██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██║   ██║██║████╗ ████║
-- ██╔██╗ ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝

local o = vim.opt
local a = vim.api
local c = vim.cmd

o.completeopt = { "menu", "menuone", "noselect" }
o.shortmess = o.shortmess + "c"

o.clipboard = ""

o.writebackup = false -- not allows to edit files that are already being edited by other program
o.swapfile = false

o.syntax = "enable"
o.background = "dark"
o.signcolumn = "yes"

o.fileencoding = "utf-8"
o.wrap = false
o.showmode = false
o.cmdheight = 1 -- Height of the command bar
o.incsearch = true -- Makes search act like search in modern browsers
o.showmatch = true -- show matching brackets when text indicator is over them

o.relativenumber = true
o.number = true

o.ignorecase = true -- Ignore case when searching
o.smartcase = true -- ... unless there is a capital letter in the query
o.splitright = true
o.splitbelow = true
o.updatetime = 300
o.hlsearch = true
o.scrolloff = 4

o.cursorline = true

-- Tabs
o.autoindent = true
o.cindent = true

o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4
o.expandtab = true

o.breakindent = true
o.linebreak = true

o.foldmethod = "marker"
o.foldlevel = 0
o.modelines = 1

-- Highlight on yank
local highlight_group = a.nvim_create_augroup('YankHighlight', { clear = true })
a.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

if vim.g.neovide then
  vim.g.neovide_cursor_trail_legnth = 0.05
  vim.g.neovide_cursor_animation_length = 0.05
  o.guifont = "Jetbrains Mono 14"
end
