require('lsp')
local map = vim.api.nvim_set_keymap  -- set global keymap

local cmd = vim.cmd     				-- execute Vim commands
local exec = vim.api.nvim_exec 	-- execute Vimscript
local fn = vim.fn       				-- call Vim functions
local g = vim.g         				-- global variables
local opt = vim.opt         		-- global/buffer/windows-scoped optionsocal g = vim.g
-- cmd("set nocompatible")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local actions = require'lir.actions'
local mark_actions = require 'lir.mark.actions'
local clipboard_actions = require'lir.clipboard.actions'

require("neotest").setup({
  adapters = {
    require("neotest-python")({
        -- Extra arguments for nvim-dap configuration
        -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
        dap = { justMyCode = false },
        -- Command line arguments for runner
        -- Can also be a function to return dynamic values
        args = {"--log-level", "DEBUG"},
        -- Runner to use. Will use pytest if available by default.
        -- Can be a function to return dynamic value.
        runner = "pytest",
        -- Custom python path for the runner.
        -- Can be a string or a list of strings.
        -- Can also be a function to return dynamic value.
        -- If not provided, the path will be inferred by checking for
        -- virtual envs in the local directory and for Pipenev/Poetry configs
        python = ".venv/bin/python",
        -- Returns if a given file path is a test file.
        -- NB: This function is called a lot so don't perform any heavy tasks within it.
        -- is_test_file = function(file_path)
        --   ...
        -- end,
        -- !!EXPERIMENTAL!! Enable shelling out to `pytest` to discover test
        -- instances for files containing a parametrize mark (default: false)
        pytest_discover_instances = true
    })
  }
})


-- Set up nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    -- { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
    { name = 'codeium' },
  })
})

-- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
-- Set configuration for specific filetype.
--[[ cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' },
  }, {
    { name = 'buffer' },
  })
})
require("cmp_git").setup() ]]--

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  }),
  matching = { disallow_symbol_nonprefix_matching = false }
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['pyright'].setup {
  capabilities = capabilities
}

require'lir'.setup {
  show_hidden_files = false,
  ignore = {"node_modules"}, -- { ".DS_Store" "node_modules" } etc.
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

    -- -- You can define a function that returns a table to be passed as the third
    -- -- argument of nvim_open_win().
    -- win_opts = function()
    --   local width = math.floor(vim.o.columns * 0.8)
    --   local height = math.floor(vim.o.lines * 0.8)
    --   return {
    --     border = {
    --       "+", "─", "+", "│", "+:", "─", "+", "│",
    --     },
    --     width = width,
    --     height = height,
    --     row = 1,
    --     col = math.floor((vim.o.columns - width) / 2),
    --   }
    -- end,
  },
  hide_cursor = true,
  on_init = function()
    -- use visual mode
    vim.api.nvim_buf_set_keymap(
      0,
      "x",
      "J",
      ':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>',
      { noremap = true, silent = true }
    )

    -- echo cwd
    vim.api.nvim_echo({ { vim.fn.expand("%:p"), "Normal" } }, false, {})
  end,
}
-- empty setup using defaults
-- require'shade'.setup({
--   overlay_opacity = 75,
--   opacity_step = 1,
--   keys = {
--     brightness_up    = '<C-Up>',
--     brightness_down  = '<C-Down>',
--     toggle           = '<Leader>s',
--   }
-- })
-- OR setup with some options

-- require("nvim-tree").setup({
--   sort_by = "case_sensitive",
--   view = {
--     adaptive_size = false,
--     mappings = {
--       list = {
--         { key = "u", action = "dir_up" },
--       },
--     },
--   },
--   renderer = {
--     group_empty = true,
--   },
--   filters = {
--     dotfiles = true,
--   },
--   view = {
--     float = {
--       enable = false,
--     }
--   },
--   actions = {
--     open_file = {
--       window_picker = {
--         enable = false,
--       }
--     }
--   }
-- })

--
-- npm install -g tree-sitter neovim
---apt install --yes -- python3-venv

-- set leader to comma
g.mapleader = ','
g.maplocalleader = ','
-- ~/.config/nvim/lua/plugins.lua
require('plugins')
require('telescope_settings')

require"gitlinker".setup({
  opts = {
    -- action_callback = require"gitlinker.actions".open_in_browser,
    print_url = true,
  },
  callbacks = {
    ["gitlab.custobar.com"] = require"gitlinker.hosts".get_gitlab_type_url,
  },
-- default mapping to call url generation with action_callback
  mappings = "<leader>gy"
})
-- show errors on line
-- vim.lsp.handlers["textDocument/publishDiagnostics"] =
--   vim.lsp.with(
--   vim.lsp.diagnostic.on_publish_diagnostics,
--   {
--     underline = false
--   }
-- )
require("mason").setup()
-- the loading is important
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:


--

cmd('set termguicolors')
require'colorizer'.setup()
-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------

cmd('colorscheme gruvbox')

opt.number = true             -- show line number
cmd('set number relativenumber')
cmd('set nohlsearch')
opt.mouse = 'a'               -- enable mouse support
opt.clipboard = 'unnamedplus' -- copy/paste to system clipboard
opt.showmatch = true          -- highlight matching parenthesis
opt.foldmethod = 'marker'     -- enable folding (default 'foldmarker')
opt.colorcolumn = '120'        -- line lenght marker at 80 columns
opt.splitright = true         -- vertical split to the right
opt.splitbelow = true         -- orizontal split to the bottom
opt.ignorecase = true         -- ignore case letters when search
opt.smartcase = true          -- ignore lowercase for the whole pattern
opt.linebreak = true          -- wrap on word boundary
opt.smartcase = true          -- case-sensitive search if search term contains uppercase letters
opt.smartindent = true
opt.list = true               -- show whitespace

cmd [[au Filetype lua setl omnifunc=v:lua.vim.lsp.omnifunc ]]
-- remove whitespace on save
cmd [[au BufWritePre * :%s/\s\+$//e]]

-- highlight on yank
exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
  augroup end
]], false)

-- require('telescope').load_extension('fzf')

require'nvim-treesitter.configs'.setup {
  highlight = {
    ensure_installed = { 'vue', 'javascript', 'lua', 'python', 'scss', 'css' },
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
  },
  indent = { enable = true },
  autotag = { enable = false },
  incremental_selection = {
    enable = true,
    keymaps = {
      -- init_selection = '<CR>',
      -- scope_decremental = '<S-CR>',
      -- scope_incremental = '<CR>',
      -- node_incremental = '<TAB>',
      -- node_decremental = '<S-TAB>',
    }
  },
    -- context_commentstring = { enable = true }
}

require('ts_context_commentstring').setup {}
vim.g.skip_ts_context_commentstring_module = true

cmd("omap <silent> m :<C-U>lua require('tsht').nodes()<CR>")
cmd("xnoremap <silent> m :lua require('tsht').nodes()<CR>")
----  autocmd FileType help wincmd L

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true      -- use spaces instead of tabs
opt.shiftwidth = 4        -- shift 4 spaces when tab
opt.tabstop = 4           -- 1 tab == 4 spaces
opt.smartindent = true    -- autoindent new lines

-- Status
opt.laststatus = 3

opt.winbar = "%=%m %f"

-- show json path in the winbar
if vim.fn.exists("+winbar") == 1 then
  opt.winbar = "%{%v:lua.require'jsonpath'.get()%} %=%m %f "
end



-- don't auto comment new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- remove line length marker for selected filetypes
cmd [[autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0]]

-- 2 spaces for selected filetypes
cmd [[
  autocmd FileType xml,html,xhtml,css,scss,lua,yaml setlocal shiftwidth=2 tabstop=2
]]

cmd [[augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end
  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end
]]
-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true         -- enable background buffers
opt.history = 10000       -- remember n lines in history
opt.lazyredraw = true     -- faster scrolling
opt.synmaxcol = 240       -- max column for syntax highlight

if vim.fn.has('wsl') == 1 then
    vim.g.clipboard = {
        name = 'WslClipboard',
        copy = {
            ['+'] = 'clip.exe',
            ['*'] = 'clip.exe',
        },
        paste = {
            ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
            ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        },
        cache_enabled = 0,
    }
end
-----------------------------------------------------------
-- Terminal
-----------------------------------------------------------
-- open a terminal pane on the right using :Term

cmd [[command! Term :botright vsplit term://$SHELL]]

-- Terminal visual tweaks
--- enter insert mode when switching to terminal
--- close terminal buffer on process exit
cmd [[
    autocmd TermOpen * setlocal listchars= nonumber norelativenumber nocursorline
    autocmd TermOpen * startinsert
    autocmd BufLeave term://* stopinsert
]]
-----------
-- Key map
----------
map( "n", "gp", "`[v`]", { noremap = true })
map( "n", "<leader>l", ":lua require('tsht').nodes()<CR>", { noremap = true })
-- or 'main'
cmd [[
    let g:gitgutter_diff_base = ''
]]
map ( "n", "<leader>d", ":GitGutterQuickFix<CR> <cmd>lua require('telescope.builtin').quickfix()<CR>", { noremap = true })

-- navige splits with ctrl+h/j/k/l
map( "n", "<leader>a", ":Git blame<cr>", { noremap = true })

map( "n", "<C-J>", "<C-W><C-J>", { noremap = true }
)
map( "n", "<C-K>", "<C-W><C-K>", { noremap = true })
map( "n", "<C-H>", "<C-W><C-H>", { noremap = true })

map( "n", "<C-L>", "<C-W><C-L>", { noremap = true })

-- save with ctrl+s
map( "n", "<C-S>", ":w<CR>", { noremap = true, silent = true })

-- save with ctrl+s
map( "i", "<C-S>", "<ESCAPE>:w<CR>", { noremap = true, silent = true })

-- source current file with F5
-- map( "n", "<F5>", ":source %<CR>", { noremap = true, silent = true })

map( "n", "<F5>", ":!xdotool search --name 'Firefox Developer Edition' key 'F5'<CR><CR>", { silent = true })
-- keep visual selection after indent
map( "v", "<", "<gv", { noremap = true })
map( "v", ">", ">gv", { noremap = true })

-- resize buffers
map( "n", "ä", ":vertical resize +5<CR>", { noremap = true })
map( "n", "Ä", ":vertical resize -5<CR>", { noremap = true })
map( "n", "ö", ":GitGutterNextHunk<CR>", { noremap = true})
map( "n", "Ö", ":GitGutterPrevHunk<CR>", { noremap = true})

map('n', '<space>v', ':vsplit | lua vim.lsp.buf.definition()<CR>', { noremap = true})
map('n', '<space>s', ':belowright split | lua vim.lsp.buf.definition()<CR>', { noremap = true})

map('n', '<space>d', ':lua vim.lsp.buf.hover()<CR>', { noremap = true})

vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
-- vim.api.nvim_set_keymap('n', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
-- vim.api.nvim_set_keymap('o', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
-- vim.api.nvim_set_keymap('o', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
-- vim.api.nvim_set_keymap('', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
--vim.api.nvim_set_keymap('n', 'K', "<cmd> lua require'hop'.hint_lines({})<cr>", {})
--vim.api.nvim_set_keymap('n', 'J', "<cmd> lua require'hop'.hint_lines({})<cr>", {})

cmd('source ~/.config/nvim/addon.vim')
