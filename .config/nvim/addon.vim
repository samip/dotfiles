" let g:tmux_navigator_no_mappings = 1

let g:airline_section_b = ''

nnoremap <C-h> :TmuxNavigateLeft<CR>
nnoremap <C-j> :TmuxNavigateDown<CR>
nnoremap <C-k> :TmuxNavigateUp<CR>
nnoremap <C-l> :TmuxNavigateRight<CR>
nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <Leader>pf :lua require('telescope.builtin').find_files()<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <C-q> :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <C-b> :lua require('telescope.builtin').buffers()<CR>
nnoremap <C-f> :lua require('telescope.builtin').live_grep()<CR>
nnoremap <leader>vh :lua require('telescope.builtin').help_tags()<CR>
nnoremap q: :lua require('telescope.builtin').command_history()<CR>

nnoremap <leader>vrc :lua require('theprimeagen.telescope').search_dotfiles()<CR>
nnoremap <leader>gw :lua require('telescope').extensions.git_worktree.git_worktrees()<CR>
nnoremap <leader>gm :lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>

highlight LineNr guifg=#fff


let g:airline_theme='bubblegum'
