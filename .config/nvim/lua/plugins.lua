-- Only required if you have packer configured as `opt`
-- :PackerSync
-- vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'AndrewRadev/splitjoin.vim'
  use 'Konfekt/vim-CtrlXA'
  use 'PotatoesMaster/i3-vim-syntax'
  use 'christoomey/vim-tmux-navigator'
  use 'jeffkreeftmeijer/vim-numbertoggle' -- rel/norm linenumbers
  use 'junegunn/vim-peekaboo'
  use 'kassio/neoterm'
  -- use 'leafgarland/typescript-vim'
  -- use 'majutsushi/tagbar'
  use 'markonm/traces.vim' -- :s live preview
  use 'moll/vim-node'
  use 'scrooloose/nerdcommenter'
  use 'stephpy/vim-yaml'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-projectionist'
  use 'tpope/vim-rhubarb'
  use 'tpope/vim-sensible'
  use 'tpope/vim-surround'
  use 'tpope/vim-vinegar' -- file browsing with -
  use 'vim-airline/vim-airline'

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/playground'
  use 'neovim/nvim-lspconfig'
  use 'kabouzeid/nvim-lspinstall'
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
  use 'ms-jpq/coq_nvim'
  --use { 'ms-jpq/coq.artifacts', branch = 'artifacts' }
  --use 'psliwka/vim-smoothie'
  use 'preservim/nerdtree'
  --use { "beauwilliams/focus.nvim", config = function() require("focus").setup() end }
  use 'airblade/vim-gitgutter'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use {'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
  use 'dense-analysis/ale'
  use 'windwp/nvim-ts-autotag'
  use 'norcalli/nvim-colorizer.lua'
end)
