let g:tmux_navigator_no_mappings = 1
let g:airline_section_b = ''

nnoremap <silent> <C-H> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-J> :TmuxNavigateDown<cr>
nnoremap <silent> <C-K> :TmuxNavigateUp<cr>
nnoremap <silent> <C-L> :TmuxNavigateRight<cr>
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
nnoremap <leader>va :lua require('theprimeagen.telescope').anime_selector()<CR>
nnoremap <leader>vc :lua require('theprimeagen.telescope').chat_selector()<CR>
nnoremap <leader>gw :lua require('telescope').extensions.git_worktree.git_worktrees()<CR>
nnoremap <leader>gm :lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>

set tabstop=4
set shiftwidth=4
set expandtab
set noswapfile
highlight LineNr guifg=#fff
