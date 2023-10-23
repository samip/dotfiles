-- Only required if you have packer configured as `opt`
-- :PackerSync
-- vim.cmd [[packadd packer.nvim]]
local function bootstrap_pckr()
  local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

  if not vim.loop.fs_stat(pckr_path) then
    vim.fn.system({
      'git',
      'clone',
      "--filter=blob:none",
      'https://github.com/lewis6991/pckr.nvim',
      pckr_path
    })
  end

  vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()

require('pckr').add{
   'Konfekt/vim-CtrlXA';
   'PotatoesMaster/i3-vim-syntax';
   'christoomey/vim-tmux-navigator';
   'jeffkreeftmeijer/vim-numbertoggle'; -- rel/norm linenumbers;
  --  'junegunn/vim-peekaboo';
   'kassio/neoterm';
  --  'leafgarland/typescript-vim';
  --  'majutsushi/tagbar';
   'markonm/traces.vim'; -- :s live preview;
   'moll/vim-node';
   'tpope/vim-commentary';
   'stephpy/vim-yaml';
   'tpope/vim-eunuch';
   'tpope/vim-fugitive';
   'tpope/vim-projectionist';
   'tpope/vim-rhubarb';
   'tpope/vim-sensible';
   'tpope/vim-surround';
   'tpope/vim-vinegar'; -- file browsing with -;
   'vim-airline/vim-airline';
   'mfussenegger/nvim-treehopper';
   --{
--	   'nvim-treesitter/nvim-treesitter',
--	   run = ':TSUpdate'
 --  }
   'nvim-treesitter/playground';
   -- {
    -- 'nvim-telescope/telescope.nvim';
    -- requires = {
      -- {'nvim-lua/plenary.nvim'},
      -- {'nvim-telescope/telescope-fzf-native.nvim', run="make" }
    -- }
  --}
   'neovim/nvim-lspconfig';
   'ms-jpq/coq_nvim';
  -- { 'ms-jpq/coq.artifacts', branch = 'artifacts' };
  -- 'psliwka/vim-smoothie';
  -- { "beauwilliams/focus.nvim", config = function() require("focus").setup() end };
   'airblade/vim-gitgutter';
   'RRethy/nvim-treesitter-textsubjects';
   'JoosepAlviste/nvim-ts-context-commentstring';
   --{'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
   'norcalli/nvim-colorizer.lua';
   'williamboman/mason.nvim';
   'sunjon/shade.nvim';
   'drybalka/tree-climber.nvim';
   'tamago324/lir.nvim';
   'kyazdani42/nvim-web-devicons';
   'tpope/vim-abolish';
   'phelipetls/jsonpath.nvim';
}
	
