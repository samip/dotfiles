-- Only required if you have packer configured as `opt`
-- :PackerSync
-- vim.cmd [[packadd packer.nvim]]
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
return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'AndrewRadev/splitjoin.vim'
  use 'Konfekt/vim-CtrlXA'
  use 'PotatoesMaster/i3-vim-syntax'
  use 'christoomey/vim-tmux-navigator'
  use 'jeffkreeftmeijer/vim-numbertoggle' -- rel/norm linenumbers
  -- use 'junegunn/vim-peekaboo'
  use 'kassio/neoterm'
  -- use 'leafgarland/typescript-vim'
  -- use 'majutsushi/tagbar'
  use 'markonm/traces.vim' -- :s live preview
  use 'moll/vim-node'
  use 'tpope/vim-commentary'
  use 'stephpy/vim-yaml'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-projectionist'
  use 'tpope/vim-rhubarb'
  use 'tpope/vim-sensible'
  use 'tpope/vim-surround'
  use 'tpope/vim-vinegar' -- file browsing with -
  use 'tpope/vim-repeat' -- file browsing with -
  use 'vim-airline/vim-airline'
  use 'mfussenegger/nvim-treehopper'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/playground'
  use {
    'phaazon/hop.nvim',
    branch = 'v1', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-fzf-native.nvim', run="make"},
    }
  }
  use 'neovim/nvim-lspconfig'
  use 'ms-jpq/coq_nvim'
  --use { 'ms-jpq/coq.artifacts', branch = 'artifacts' }
  --use 'psliwka/vim-smoothie'
  --use { "beauwilliams/focus.nvim", config = function() require("focus").setup() end }
  use 'airblade/vim-gitgutter'
  use 'RRethy/nvim-treesitter-textsubjects'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use {'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
  use 'dense-analysis/ale'
  use 'windwp/nvim-ts-autotag'
  use 'norcalli/nvim-colorizer.lua'
  use 'williamboman/mason.nvim'
  use {
    'ruifm/gitlinker.nvim',
    requires = 'nvim-lua/plenary.nvim',
  }
  use 'mfussenegger/nvim-dap'
  use 'sunjon/shade.nvim'
  use 'drybalka/tree-climber.nvim'
  use 'tamago324/lir.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'tpope/vim-abolish'
  use 'phelipetls/jsonpath.nvim'
end)
