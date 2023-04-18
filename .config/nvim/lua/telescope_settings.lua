require('telescope').setup{
  prompt_prefix = "> ",
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = false, -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  },
  pickers = {
    find_files = {
      find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
    },
  },
}

changed_on_branch = function()
    local previewers = require('telescope.previewers')
    local pickers = require('telescope.pickers')
    local sorters = require('telescope.sorters')
    local finders = require('telescope.finders')
    -- local projectRoot = `git rev-parse --show-toplevel`

    pickers.new {
        results_title = 'Modified on current branch',
        finder = finders.new_oneshot_job({'git-branch-modified.sh', 'list'}),
        sorter = sorters.get_fuzzy_file(),
        previewer = previewers.new_termopen_previewer {
            get_command = function(entry)
                return {'git-branch-modified.sh', 'diff', entry.value}
            end
        },
    }:find()
end

--require('telescope.builtin').git_files()
vim.api.nvim_set_keymap('n', '<leader>c', '<Cmd>lua changed_on_branch()<cr>', {})
vim.api.nvim_set_keymap("n", "<leader>q", ":Telescope quickfix<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>f", ":Telescope find_files<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>f", ":Telescope find_files<cr>", {})
--vim.api.nvim_set_keymap("n", "<leader>g", ":Telescope git_files<cr>", {})
--vim.api.nvim_set_keymap('n', '<Leader>g',  [[<Cmd>lua require('telescope.builtin').git_files()<CR>]], { noremap = true, silent = true })
--vim.api.nvim_set_keymap("n", "<leader>r", ":Telescope lsp_references<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>gr", "[[<Cmd>lua require('telescope.builtin').live_grep()<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>re", "[[<Cmd>lua require('telescope.builtin').lsp_references()<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>sd", "[[<Cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>sy", "[[<Cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>dot", "[[<Cmd>require'telescope.builtin'.find_files{ cwd = '~/.config'}<CR>]]", {})
vim.api.nvim_set_keymap("n", "<leader>pw",  "[[<Cmd>lua require('telescope.builtin').grep_string { search = vim.fn.expand('<cword>') }<CR>", {})
--nnoremap <Leader>dot <cmd>lua require'telescope.builtin'.find_files{ cwd = "~/.config/nvim/" }<CR>
--nnoremap <leader>fg <cmd>Telescope live_grep<cr>
--nnoremap <leader>fb <cmd>Telescope buffers<cr>
--nnoremap <leader>fh <cmd>Telescope help_tags<cr>

