set nocompatible 
filetype on
filetype plugin on
syntax on
se mouse+=a " for Xcopy to work
set softtabstop=4 expandtab
" set hlsearch
set nohlsearch
set ic
set incsearch
set showcmd
" open new splits in right and below

" disable auto-comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set splitbelow
set splitright
set list " show white space
set smartcase
set clipboard=unnamedplus
" disable airline git section
let g:airline_section_b = ''
map Y y$
" normal esc in terminal window
tnoremap <Esc> <C-\><C-n>
nmap <F2> :e ~/.config/nvim/init.vim<CR>
" nmap <Tab> cc
nmap ö <Plug>(GitGutterNextHunk)
nmap Ö <Plug>(GitGutterPrevHunk)
" reselect visual mode selection after shift
vnoremap < <gv
vnoremap > >gv

" paste yanked
nnoremap <leader>p "0p
nnoremap <leader>P "0P

" replace word under cursor
nmap <leader>r :%s/<C-r><C-w>//g<Left><Left>

" rebind split navigation to ctrl+j/k/l/h
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
map <C-S> :w<CR>
imap <C-S> <Esc>:w<CR>
vmap <C-S> <Esc>:w<CR>
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" added nerdtree
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-vinegar'
Plugin 'vim-syntastic/syntastic'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'ngmy/vim-rubocop'
Plugin 'vim-ruby/vim-ruby'
" Plugin 'ycm-core/YouCompleteMe'
Plugin 'neoclide/coc.nvim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'majutsushi/tagbar'
Plugin 'kassio/neoterm'
Plugin 'scrooloose/nerdcommenter'
" Plugin 'chaoren/vim-wordmotion'
Plugin 'markonm/traces.vim'
Plugin 'tpope/vim-projectionist'
Plugin 'stephpy/vim-yaml'
Plugin 'Konfekt/vim-CtrlXA'
Plugin 'posva/vim-vue'
Plugin 'kchmck/vim-coffee-script'
Plugin 'jwhitley/vim-matchit'
Plugin 'moll/vim-node'
Plugin 'vim-airline/vim-airline'
Plugin 'junegunn/vim-peekaboo'
Plugin 'airblade/vim-gitgutter'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'PotatoesMaster/i3-vim-syntax'
Plugin 'tpope/vim-rhubarb'
Plugin 'tpope/vim-eunuch'
" All of your Plugins must be added before the following line
"
call vundle#end()
" sudo write
cnoremap w!! execute 'silent! write !SUDO_ASKPASS=`which ssh-askpass` sudo tee % >/dev/null' <bar> edit! required

filetype plugin indent on    " required

set number
set nu rnu
" close vim if NERDTree is the last open buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" dont match filenames with ag
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

let g:NERDSpaceDelims = 1

nmap <F6> :NERDTreeToggle<CR>
nmap <F7> :NERDTreeMirror<CR>
nnoremap <F8> :vertical wincmd f<CR>
nmap <F9> :TREPLSendFile<CR>
nnoremap <F5> :buffers<CR>:buffer<Space>
nnoremap <leader><leader> :GFiles<CR>
nnoremap <leader>fi       :Files<CR>
nnoremap <leader>C        :Colors<CR>
nnoremap <leader><CR>     :Buffers<CR>
nnoremap <leader>fl       :Lines<CR>
nnoremap <leader>ag       :Ag! <CR>
" nnoremap <leader>ag       :Ag! <C-R><C-W><CR>
nnoremap <leader>m        :History<CR>


noremap <Leader>gg  :Ag!<C-r>=Escape(expand('<cword>'))<CR><CR>

function! Escape(stuff)
    return substitute(escape(a:stuff, '\/.*$^~[]'), "\n", '\\n', "g")
endfunction

"smart indent when entering insert mode with i on empty lines
function! IndentWithI()
    if len(getline('.')) == 0
        return "\"_ccO"
    else
        return "i"
    endif
endfunction
nnoremap <expr> i IndentWithI()

nnoremap <silent> ä :vertical resize +5<CR>
nnoremap <silent> Ä :vertical resize -5<CR>

colorscheme gruvbox
set bg=dark
set expandtab
set shiftwidth=2
set softtabstop=2
filetype plugin indent on
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
" let g:nerdtree_tabs_open_on_console_startup=1
    " vim hardcodes background color erase even if the terminfo file does
        " not contain bce (not to mention that libvte based terminals
        " incorrectly contain bce in their terminfo files). This causes
        " incorrect background rendering when using a color theme with a
        " background color.
let &t_ut=''
let g:vimrubocop_config = '/home/spe/environment/system/.rubocop.yml'
" FZF {{{
" <C-p> or <C-t> to search files
nnoremap <silent> <C-t> :FZF -m<cr>
nnoremap <silent> <C-p> :FZF -m<cr>

" <M-p> for open buffers
nnoremap <silent> <M-p> :Buffers<cr>

" <M-S-p> for MRU
nnoremap <silent> <M-S-p> :History<cr>

" Use fuzzy completion relatve filepaths across directory
imap <expr> <c-x><c-f> fzf#vim#complete#path('git ls-files $(git rev-parse --show-toplevel)')

" Better command history with q:
command! CmdHist call fzf#vim#command_history({'right': '40'})
nnoremap q: :CmdHist<CR>

" Better search history
command! QHist call fzf#vim#search_history({'right': '40'})
nnoremap q/ :QHist<CR>



function! s:ag_to_qfC(line)
  let parts = split(a:line, ':')
  return {'filename': expand('%'), 'lnum': parts[0], 'col': parts[1],
        \ 'text': join(parts[3:], ':')}
endfunction

function! s:ag_handlerC(lines)
  if len(a:lines) < 2 | return | endif

  let cmd = get({'ctrl-x': 'split',
               \ 'ctrl-v': 'vertical split',
               \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')
  let list = map(a:lines[1:], 's:ag_to_qfC(v:val)')

  let first = list[0]
  execute cmd escape(first.filename, ' %#\')
  execute first.lnum
  execute 'normal!' first.col.'|zz'

  if len(list) > 1
    call setqflist(list)
    copen
    wincmd p
  endif
endfunction


" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
end

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
"nmap <silent> <C-s> <Plug>(coc-range-select)
"xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
let g:coc_global_extensions = ['coc-solargraph']
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>i
