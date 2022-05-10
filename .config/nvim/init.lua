local map = vim.api.nvim_set_keymap  -- set global keymap
local cmd = vim.cmd     				-- execute Vim commands
local exec = vim.api.nvim_exec 	-- execute Vimscript
local fn = vim.fn       				-- call Vim functions
local g = vim.g         				-- global variables
local opt = vim.opt         		-- global/buffer/windows-scoped optionsocal g = vim.g
-- cmd("set nocompatible")


--
-- npm install -g tree-sitter neovim
---apt install --yes -- python3-venv
--- :COQDeps COQNow

-- set leader to comma
g.mapleader = ','
g.maplocalleader = ','
-- ~/.config/nvim/lua/plugins.lua
require('plugins')
require('lsp')
require('telescope_settings')
-- the loading is important
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:

vim.g.coq_settings = {
  auto_start = 'shut-up',
  keymap = { jump_to_mark = '<C-your_key>' }
}
--require'lspconfig'.tsserver.setup{ root_dir = vim.loop.cwd }

-- lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }
--
require('nvim-ts-autotag').setup()

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

require('telescope').load_extension('fzf')
require'nvim-treesitter.configs'.setup {
  highlight = {
    ensure_installed = { 'vue', 'javascript', 'lua' },
    enable = true,
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      ["foo.bar"] = "Identifier",
    },
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = { enable = true },
  indent = { enable = true },
  context_commentstring = { enable = true }
}

----  autocmd FileType help wincmd L

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true      -- use spaces instead of tabs
opt.shiftwidth = 4        -- shift 4 spaces when tab
opt.tabstop = 4           -- 1 tab == 4 spaces
opt.smartindent = true    -- autoindent new lines

-- don't auto commenting new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- remove line lenght marker for selected filetypes
cmd [[autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0]]

-- 2 spaces for selected filetypes
cmd [[
  autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml setlocal shiftwidth=2 tabstop=2
]]

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true         -- enable background buffers
opt.history = 10000       -- remember n lines in history
opt.lazyredraw = true     -- faster scrolling
opt.synmaxcol = 240       -- max column for syntax highlight

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


-- hop
vim.api.nvim_set_keymap('n', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('n', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('o', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
vim.api.nvim_set_keymap('o', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
vim.api.nvim_set_keymap('', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
--vim.api.nvim_set_keymap('n', 'K', "<cmd> lua require'hop'.hint_lines({})<cr>", {})
--vim.api.nvim_set_keymap('n', 'J', "<cmd> lua require'hop'.hint_lines({})<cr>", {})

cmd('source ~/.config/nvim/addon.vim')
