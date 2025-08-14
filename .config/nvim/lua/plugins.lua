local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  use 'AndrewRadev/splitjoin.vim'
  use 'Konfekt/vim-CtrlXA'
  use 'PotatoesMaster/i3-vim-syntax'
  use 'christoomey/vim-tmux-navigator'
  use 'jeffkreeftmeijer/vim-numbertoggle' -- rel/norm linenumbers
  use 'kassio/neoterm'
  use 'markonm/traces.vim' -- :s live preview
  use 'moll/vim-node'
  use 'tpope/vim-commentary'
  use 'stephpy/vim-yaml'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-projectionist'
  use 'tpope/vim-rhubarb'
  use 'tpope/vim-sensible'
  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  })
  use 'tpope/vim-vinegar' -- file browsing with -
  use 'tpope/vim-repeat' -- file browsing with -
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'mfussenegger/nvim-treehopper'
  use 'nvim-treesitter/playground'
  use {
    'phaazon/hop.nvim',
    branch = 'v1', -- optional but strongly recommended
    config = function()
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
  use { 'airblade/vim-gitgutter', branch = 'main' }
  use 'RRethy/nvim-treesitter-textsubjects'
  use {
    'JoosepAlviste/nvim-ts-context-commentstring',
    config = function()
      require('ts_context_commentstring').setup {
        enable_autocmd = false,
      }
    end
  }
  use {'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
  use 'dense-analysis/ale'
  use 'norcalli/nvim-colorizer.lua'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'sunjon/shade.nvim'
  use 'tpope/vim-abolish'
  use 'phelipetls/jsonpath.nvim'
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
    },
    config = function()
      local cmp = require'cmp'
      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'codeium' },
          { name = 'path' },
        })
      })

      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
            { name = 'cmdline' }
          }),
        matching = { disallow_symbol_nonprefix_matching = false }
      })
    end
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = { 'vue', 'javascript', 'typescript', 'lua', 'python', 'scss', 'css', 'tsx', 'git_rebase' },
        highlight = { enable = true },
        indent = { enable = true },
        autotag = { enable = false },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          }
        },
        textsubjects = {
          enable = true,
          prev_selection = ',',
          keymaps = {
            ['.'] = 'textsubjects-smart',
            [';'] = 'textsubjects-container-outer',
            ['i;'] = 'textsubjects-container-inner',
          }
        }
      }
    end
  }
  use 'ojroques/nvim-osc52'
  use {
    'tamago324/lir.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons'
    },
    config = function()
      local actions = require'lir.actions'
      local mark_actions = require 'lir.mark.actions'
      local clipboard_actions = require'lir.clipboard.actions'

      require'lir'.setup {
        show_hidden_files = false,
        ignore = {"node_modules"},
        devicons = {
          enable = true
        },
        mappings = {
          ['<CR>']     = actions.edit,
          ['<C-s>'] = actions.split,
          ['<C-v>'] = actions.vsplit,
          ['<C-t>'] = actions.tabedit,
          ['h']     = actions.up,
          ['q']     = actions.quit,
          ['K']     = actions.mkdir,
          ['N']     = actions.newfile,
          ['R']     = actions.rename,
          ['@']     = actions.cd,
          ['Y']     = actions.yank_path,
          ['.']     = actions.toggle_show_hidden,
          ['D']     = actions.delete,
          ['J'] = function()
            mark_actions.toggle_mark()
            vim.cmd('normal! j')
          end,
          ['C'] = clipboard_actions.copy,
          ['X'] = clipboard_actions.cut,
          ['P'] = clipboard_actions.paste,
        },
        float = {
          winblend = 0,
          curdir_window = {
            enable = false,
            highlight_dirname = false
          },
        },
        hide_cursor = true,
        on_init = function()
          vim.api.nvim_buf_set_keymap(
            0,
            "x",
            "J",
            ':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>',
            { noremap = true, silent = true }
          )
          vim.api.nvim_echo({ { vim.fn.expand("%:p"), "Normal" } }, false, {})
        end,
      }
    end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
