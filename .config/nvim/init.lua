require('lsp')
local map = vim.api.nvim_set_keymap  -- set global keymap

local cmd = vim.cmd     				-- execute Vim commands
local exec = vim.api.nvim_exec 	-- execute Vimscript
local fn = vim.fn       				-- call Vim functions
local g = vim.g         				-- global variables
local opt = vim.opt         		-- global/buffer/windows-scoped optionsocal g = vim.g

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true


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


-- npm install -g tree-sitter neovim
---apt install --yes -- python3-venv

-- set leader to comma
g.mapleader = ','
g.maplocalleader = ','
require('plugins')
require('telescope_settings')
cmd('set termguicolors')
require'colorizer'.setup()

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
cmd('colorscheme gruvbox')
cmd('set number relativenumber')
cmd('set nohlsearch')
cmd('set nocompatible')
opt.number = true             -- show line number
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

vim.g.skip_ts_context_commentstring_module = true

cmd("omap <silent> m :<C-U>lua require('tsht').nodes()<CR>")
cmd("xnoremap <silent> m :lua require('tsht').nodes()<CR>")
----  autocmd FileType help wincmd L

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true      -- use spaces instead of tabs
opt.shiftwidth = 2        -- shift 4 spaces when tab
opt.tabstop = 2           -- 1 tab == 4 spaces
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
  autocmd FileType xml,html,xhtml,css,scss,lua,yaml,js,ts,lua setlocal shiftwidth=2 tabstop=2
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
-- map( "n", "<leader>a", ":Git blame<cr>", { noremap = true })

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

-- vim.api.nvim_set_keymap('n', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
-- vim.api.nvim_set_keymap('o', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
-- vim.api.nvim_set_keymap('o', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
-- vim.api.nvim_set_keymap('', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
--vim.api.nvim_set_keymap('n', 'K', "<cmd> lua require'hop'.hint_lines({})<cr>", {})
--vim.api.nvim_set_keymap('n', 'J', "<cmd> lua require'hop'.hint_lines({})<cr>", {})

cmd('source ~/.config/nvim/addon.vim')
