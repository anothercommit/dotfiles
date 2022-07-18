-- Various autocmds and functions{{{
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		'git',
		'clone',
		'--depth',
		'1',
		'https://github.com/wbthomason/packer.nvim',
		install_path,
	})
	print('Installing packer close and reopen Neovim...')
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
	return
end
--}}}

-- TODO
-- coq_nvim
-- galaxyline
-- dap para rust

return packer.startup(function(use)

use 'wbthomason/packer.nvim'
--
-- Lenguage related {{{
use 'neovim/nvim-lspconfig'

use 'hrsh7th/nvim-cmp'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-path'
use 'hrsh7th/cmp-nvim-lua'
use 'hrsh7th/cmp-nvim-lsp'

use 'onsails/lspkind.nvim'

use 'saadparwaiz1/cmp_luasnip'
use 'L3MON4D3/LuaSnip'

use 'mfussenegger/nvim-dap'
use 'rcarriga/nvim-dap-ui'
use 'ravenxrz/DAPInstall.nvim'

use 'rust-lang/rust.vim'

use { 
    'williamboman/nvim-lsp-installer',
    config = function() require'nvim-lsp-installer'.setup {} end
}

use {
    'nvim-treesitter/nvim-treesitter', 
    run = ':TSUpdate',
    requires = { { 'p00f/nvim-ts-rainbow' } }
}
-- }}}

-- Sruff {{{
use {
  'numToStr/Comment.nvim',
  config = function() require'Comment'.setup() end,
  requires = { { 'JoosepAlviste/nvim-ts-context-commentstring' } }
}

use {
  'folke/which-key.nvim',
  config = function()
    require('which-key').setup {}
  end
}

use { 'akinsho/toggleterm.nvim', tag = 'v1.*' }

use { 
  'phaazon/hop.nvim',
  config = function()
    require'hop'.setup()
  end
}

use {
  'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} }
}

use {
  'AckslD/nvim-neoclip.lua',
  config = function()
    require('neoclip').setup()
    require('telescope').load_extension('neoclip')
  end,
}

use 'junegunn/fzf.vim'
use 'kyazdani42/nvim-tree.lua'

use({
  'iamcco/markdown-preview.nvim',
  run = function() vim.fn['mkdp#util#install']() end
})

use {
  'junegunn/goyo.vim',
  requires = 'junegunn/limelight.vim'
}

use 'tpope/vim-fugitive'
use 'windwp/nvim-autopairs'
use 'tpope/vim-repeat'
-- }}}

-- Aesthetic {{{
use {
    'kyazdani42/nvim-web-devicons', 
    config = function() require'nvim-web-devicons'.setup {} end
}

use { 
  'norcalli/nvim-colorizer.lua',
  config = function()
    require'colorizer'.setup()
  end
}

use 'lukas-reineke/indent-blankline.nvim'
use 'kshenoy/vim-signature'
use 'nvim-lualine/lualine.nvim'

-- Themes
use 'sainnhe/everforest'
use 'dracula/vim'
use 'sainnhe/sonokai'
use 'navarasu/onedark.nvim'
use 'savq/melange'
use 'tanvirtin/monokai.nvim'
use 'rebelot/kanagawa.nvim'
use 'sainnhe/edge'
use 'ellisonleao/gruvbox.nvim'
-- }}}
end)
