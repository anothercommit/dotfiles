-- Various autocmds and functions{{{
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
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
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end
--}}}

return packer.startup(function(use)
     
use 'wbthomason/packer.nvim'

use 'neovim/nvim-lspconfig'

use 'hrsh7th/nvim-cmp'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-path'
use 'hrsh7th/cmp-nvim-lua'
use 'hrsh7th/cmp-nvim-lsp'

use 'saadparwaiz1/cmp_luasnip'
use 'L3MON4D3/LuaSnip'

use 'onsails/lspkind.nvim'


use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

-- use {
--   'glepnir/galaxyline.nvim', branch = 'main',
--   config = function() require('galaxyline') end
-- }

use {
    "kyazdani42/nvim-web-devicons", 
    config = function() require'nvim-web-devicons'.setup {} end
}

use {
    'junegunn/goyo.vim',
    requires = 'junegunn/limelight.vim'
}

use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end
})


use {
    'numToStr/Comment.nvim',
    config = function() require'Comment'.setup() end
}

use {
  'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} }
}

use 'rust-lang/rust.vim'

use 'nvim-lualine/lualine.nvim'
use 'tpope/vim-fugitive'
use 'junegunn/fzf.vim'
use 'phaazon/hop.nvim'
use 'kyazdani42/nvim-tree.lua'
use 'kshenoy/vim-signature'
use "windwp/nvim-autopairs"

-- Themes
use 'sainnhe/everforest'                                        
use 'EdenEast/nightfox.nvim'                                    
use 'dracula/vim'                                               
use 'sainnhe/sonokai'    
use 'VDuchauffour/neodark.nvim'
use 'navarasu/onedark.nvim'
end)
