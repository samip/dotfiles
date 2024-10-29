-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/sami/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/sami/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/sami/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/sami/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/sami/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["FixCursorHold.nvim"] = {
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim",
    url = "https://github.com/antoinemadec/FixCursorHold.nvim"
  },
  ale = {
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/ale",
    url = "https://github.com/dense-analysis/ale"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["codeium.vim"] = {
    config = { "\27LJ\2\2-\0\0\1\0\3\0\0046\0\0\0009\0\1\0009\0\2\0D\0\1\0\19codeium#Accept\afn\bvim;\0\0\2\0\3\0\0056\0\0\0009\0\1\0009\0\2\0)\1\1\0D\0\2\0\29codeium#CycleCompletions\afn\bvim;\0\0\2\0\3\0\0056\0\0\0009\0\1\0009\0\2\0)\1ÿÿD\0\2\0\29codeium#CycleCompletions\afn\bvim,\0\0\1\0\3\0\0046\0\0\0009\0\1\0009\0\2\0D\0\1\0\18codeium#Clear\afn\bvim+\0\0\1\0\3\0\0046\0\0\0009\0\1\0009\0\2\0D\0\1\0\17codeium#Open\afn\bvim¶\2\1\0\5\0\20\0)6\0\0\0009\0\1\0009\0\2\0'\1\3\0'\2\4\0003\3\5\0005\4\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\1\3\0'\2\a\0003\3\b\0005\4\t\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\1\3\0'\2\n\0003\3\v\0005\4\f\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\1\3\0'\2\r\0003\3\14\0005\4\15\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\1\16\0'\2\17\0003\3\18\0005\4\19\0B\0\5\1K\0\1\0\1\0\2\texpr\2\vsilent\2\0\n<c-a>\6n\1\0\2\texpr\2\vsilent\2\0\n<c-x>\1\0\2\texpr\2\vsilent\2\0\n<c-,>\1\0\2\texpr\2\vsilent\2\0\n<c-;>\1\0\2\texpr\2\vsilent\2\0\n<C-g>\6i\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/codeium.vim",
    url = "https://github.com/Exafunction/codeium.vim"
  },
  fzf = {
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["gitlinker.nvim"] = {
    config = { "\27LJ\2\2Î\1\0\0\5\0\v\0\0166\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\0015\2\b\0006\3\0\0'\4\6\0B\3\2\0029\3\a\3=\3\t\2=\2\n\1B\0\2\1K\0\1\0\14callbacks\24gitlab.custobar.com\1\0\0\24get_gitlab_type_url\20gitlinker.hosts\topts\1\0\1\rmappings\15<leader>gy\1\0\1\14print_url\2\nsetup\14gitlinker\frequire\0" },
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/gitlinker.nvim",
    url = "https://github.com/ruifm/gitlinker.nvim"
  },
  ["hop.nvim"] = {
    config = { "\27LJ\2\2U\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\1\tkeys\28etovxqpdygfblzhckisuran\nsetup\bhop\frequire\0" },
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["i3-vim-syntax"] = {
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/i3-vim-syntax",
    url = "https://github.com/PotatoesMaster/i3-vim-syntax"
  },
  ["jsonpath.nvim"] = {
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/jsonpath.nvim",
    url = "https://github.com/phelipetls/jsonpath.nvim"
  },
  ["lir.nvim"] = {
    config = { "\27LJ\2\2G\0\0\2\1\4\0\b-\0\0\0009\0\0\0B\0\1\0016\0\1\0009\0\2\0'\1\3\0B\0\2\1K\0\1\0\1À\14normal! j\bcmd\bvim\16toggle_markü\1\0\0\6\0\f\0\0256\0\0\0009\0\1\0009\0\2\0)\1\0\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\6\0016\0\0\0009\0\1\0009\0\a\0004\1\3\0005\2\v\0006\3\0\0009\3\b\0039\3\t\3'\4\n\0B\3\2\2>\3\1\2>\2\1\1+\2\1\0004\3\0\0B\0\4\1K\0\1\0\1\3\0\0\0\vNormal\b%:p\vexpand\afn\14nvim_echo\1\0\2\vsilent\2\fnoremap\2=:<C-u>lua require\"lir.mark.actions\".toggle_mark(\"v\")<CR>\6J\6x\24nvim_buf_set_keymap\bapi\bvim‹\5\1\0\a\0005\0?6\0\0\0'\1\1\0B\0\2\0026\1\0\0'\2\2\0B\1\2\0026\2\0\0'\3\3\0B\2\2\0026\3\0\0'\4\4\0B\3\2\0029\3\5\0035\4\6\0005\5\a\0=\5\b\0045\5\t\0=\5\n\0045\5\f\0009\6\v\0=\6\r\0059\6\14\0=\6\15\0059\6\16\0=\6\17\0059\6\18\0=\6\19\0059\6\20\0=\6\21\0059\6\22\0=\6\23\0059\6\24\0=\6\25\0059\6\26\0=\6\27\0059\6\28\0=\6\29\0059\6\30\0=\6\31\0059\6 \0=\6!\0059\6\"\0=\6#\0059\6$\0=\6%\0053\6&\0=\6'\0059\6(\2=\6)\0059\6*\2=\6+\0059\6,\2=\6-\5=\5.\0045\5/\0005\0060\0=\0061\5=\0052\0043\0053\0=\0054\4B\3\2\0012\0\0€K\0\1\0\fon_init\0\nfloat\18curdir_window\1\0\2\22highlight_dirname\1\venable\1\1\0\1\rwinblend\3\0\rmappings\6P\npaste\6X\bcut\6C\tcopy\6J\0\6D\vdelete\6.\23toggle_show_hidden\6Y\14yank_path\6@\acd\6R\vrename\6N\fnewfile\6K\nmkdir\6q\tquit\6h\aup\n<C-t>\ftabedit\n<C-v>\vvsplit\n<C-s>\nsplit\t<CR>\1\0\0\tedit\rdevicons\1\0\1\venable\2\vignore\1\2\0\0\17node_modules\1\0\2\16hide_cursor\2\22show_hidden_files\1\nsetup\blir\26lir.clipboard.actions\21lir.mark.actions\16lir.actions\frequire\0" },
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/lir.nvim",
    url = "https://github.com/tamago324/lir.nvim"
  },
  ["mason.nvim"] = {
    config = { "\27LJ\2\2•\1\0\0\4\0\b\0\v6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\6\0005\2\4\0005\3\3\0=\3\5\2=\2\a\1B\0\2\1K\0\1\0\aui\1\0\0\nicons\1\0\0\1\0\3\20package_pending\6?\24package_uninstalled\6?\22package_installed\6V\nsetup\nmason\frequire\0" },
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  neoterm = {
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/neoterm",
    url = "https://github.com/kassio/neoterm"
  },
  neotest = {
    config = { "\27LJ\2\2ü\1\0\0\6\0\v\1\0196\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\t\0004\2\3\0006\3\0\0'\4\3\0B\3\2\0025\4\5\0005\5\4\0=\5\6\0045\5\a\0=\5\b\4B\3\2\0?\3\0\0=\2\n\1B\0\2\1K\0\1\0\radapters\1\0\0\targs\1\3\0\0\16--log-level\nDEBUG\bdap\1\0\3\30pytest_discover_instances\2\vpython\21.venv/bin/python\vrunner\vpytest\1\0\1\15justMyCode\1\19neotest-python\nsetup\fneotest\frequire\3€€À™\4\0" },
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/neotest",
    url = "https://github.com/nvim-neotest/neotest"
  },
  ["neotest-python"] = {
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/neotest-python",
    url = "https://github.com/nvim-neotest/neotest-python"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\2;\0\1\3\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\2\3\0B\1\2\1K\0\1\0\tbody\20vsnip#anonymous\afn\bvim»\5\1\0\b\0&\0Y6\0\0\0'\1\1\0B\0\2\0029\1\2\0005\2\6\0005\3\4\0003\4\3\0=\4\5\3=\3\a\0029\3\b\0009\3\t\0039\3\n\0035\4\f\0009\5\b\0009\5\v\5)\6üÿB\5\2\2=\5\r\0049\5\b\0009\5\v\5)\6\4\0B\5\2\2=\5\14\0049\5\b\0009\5\15\5B\5\1\2=\5\16\0049\5\b\0009\5\17\5B\5\1\2=\5\18\0049\5\b\0009\5\19\0055\6\20\0B\5\2\2=\5\21\4B\3\2\2=\3\b\0029\3\22\0009\3\23\0034\4\5\0005\5\24\0>\5\1\0045\5\25\0>\5\2\0045\5\26\0>\5\3\0045\5\27\0>\5\4\4B\3\2\2=\3\23\2B\1\2\0019\1\2\0009\1\28\0015\2\29\0005\3\30\0009\4\b\0009\4\t\0049\4\28\4B\4\1\2=\4\b\0034\4\3\0005\5\31\0>\5\1\4=\4\23\3B\1\3\0019\1\2\0009\1\28\1'\2 \0005\3!\0009\4\b\0009\4\t\0049\4\28\4B\4\1\2=\4\b\0039\4\22\0009\4\23\0044\5\3\0005\6\"\0>\6\1\0054\6\3\0005\a#\0>\a\1\6B\4\3\2=\4\23\0035\4$\0=\4%\3B\1\3\1K\0\1\0\rmatching\1\0\1'disallow_symbol_nonprefix_matching\1\1\0\1\tname\fcmdline\1\0\1\tname\tpath\1\0\0\6:\1\0\1\tname\vbuffer\1\0\0\1\3\0\0\6/\6?\fcmdline\1\0\1\tname\tpath\1\0\1\tname\fcodeium\1\0\1\tname\vbuffer\1\0\1\tname\rnvim_lsp\fsources\vconfig\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nabort\14<C-Space>\rcomplete\n<C-f>\n<C-b>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\bcmp\frequire\0" },
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-nio"] = {
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/nvim-nio",
    url = "https://github.com/nvim-neotest/nvim-nio"
  },
  ["nvim-treehopper"] = {
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/nvim-treehopper",
    url = "https://github.com/mfussenegger/nvim-treehopper"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\2—\4\0\0\4\0\19\0\0236\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\0015\2\6\0=\2\a\0015\2\b\0=\2\t\0015\2\n\0=\2\v\0015\2\f\0005\3\r\0=\3\14\2=\2\15\0015\2\16\0005\3\17\0=\3\14\2=\2\18\1B\0\2\1K\0\1\0\17textsubjects\1\0\3\6.\23textsubjects-smart\ai;!textsubjects-container-inner\6;!textsubjects-container-outer\1\0\2\19prev_selection\6,\venable\2\26incremental_selection\fkeymaps\1\0\4\19init_selection\bgnn\22scope_incremental\bgrc\21node_incremental\bgrn\21node_decremental\bgrm\1\0\1\venable\2\fautotag\1\0\1\venable\1\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\n\0\0\bvue\15javascript\15typescript\blua\vpython\tscss\bcss\btsx\15git_rebase\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textsubjects"] = {
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textsubjects",
    url = "https://github.com/RRethy/nvim-treesitter-textsubjects"
  },
  ["nvim-ts-autotag"] = {
    config = { "\27LJ\2\2O\0\0\1\0\2\0\0035\0\0\0007\0\1\0K\0\1\0\topts\1\0\3\26enable_close_on_slash\1\18enable_rename\2\17enable_close\2\0" },
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    config = { "\27LJ\2\2]\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\1\19enable_autocmd\1\nsetup\29ts_context_commentstring\frequire\0" },
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["shade.nvim"] = {
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/shade.nvim",
    url = "https://github.com/sunjon/shade.nvim"
  },
  ["splitjoin.vim"] = {
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/splitjoin.vim",
    url = "https://github.com/AndrewRadev/splitjoin.vim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["traces.vim"] = {
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/traces.vim",
    url = "https://github.com/markonm/traces.vim"
  },
  ["tree-climber.nvim"] = {
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/tree-climber.nvim",
    url = "https://github.com/drybalka/tree-climber.nvim"
  },
  ["vim-CtrlXA"] = {
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/vim-CtrlXA",
    url = "https://github.com/Konfekt/vim-CtrlXA"
  },
  ["vim-abolish"] = {
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/vim-abolish",
    url = "https://github.com/tpope/vim-abolish"
  },
  ["vim-airline"] = {
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/vim-airline",
    url = "https://github.com/vim-airline/vim-airline"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/vim-eunuch",
    url = "https://github.com/tpope/vim-eunuch"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/vim-gitgutter",
    url = "https://github.com/airblade/vim-gitgutter"
  },
  ["vim-node"] = {
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/vim-node",
    url = "https://github.com/moll/vim-node"
  },
  ["vim-numbertoggle"] = {
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/vim-numbertoggle",
    url = "https://github.com/jeffkreeftmeijer/vim-numbertoggle"
  },
  ["vim-projectionist"] = {
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/vim-projectionist",
    url = "https://github.com/tpope/vim-projectionist"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/vim-rhubarb",
    url = "https://github.com/tpope/vim-rhubarb"
  },
  ["vim-sensible"] = {
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/vim-sensible",
    url = "https://github.com/tpope/vim-sensible"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator",
    url = "https://github.com/christoomey/vim-tmux-navigator"
  },
  ["vim-vinegar"] = {
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/vim-vinegar",
    url = "https://github.com/tpope/vim-vinegar"
  },
  ["vim-yaml"] = {
    loaded = true,
    path = "/home/sami/.local/share/nvim/site/pack/packer/start/vim-yaml",
    url = "https://github.com/stephpy/vim-yaml"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: hop.nvim
time([[Config for hop.nvim]], true)
try_loadstring("\27LJ\2\2U\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\1\tkeys\28etovxqpdygfblzhckisuran\nsetup\bhop\frequire\0", "config", "hop.nvim")
time([[Config for hop.nvim]], false)
-- Config for: neotest
time([[Config for neotest]], true)
try_loadstring("\27LJ\2\2ü\1\0\0\6\0\v\1\0196\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\t\0004\2\3\0006\3\0\0'\4\3\0B\3\2\0025\4\5\0005\5\4\0=\5\6\0045\5\a\0=\5\b\4B\3\2\0?\3\0\0=\2\n\1B\0\2\1K\0\1\0\radapters\1\0\0\targs\1\3\0\0\16--log-level\nDEBUG\bdap\1\0\3\30pytest_discover_instances\2\vpython\21.venv/bin/python\vrunner\vpytest\1\0\1\15justMyCode\1\19neotest-python\nsetup\fneotest\frequire\3€€À™\4\0", "config", "neotest")
time([[Config for neotest]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\2;\0\1\3\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\2\3\0B\1\2\1K\0\1\0\tbody\20vsnip#anonymous\afn\bvim»\5\1\0\b\0&\0Y6\0\0\0'\1\1\0B\0\2\0029\1\2\0005\2\6\0005\3\4\0003\4\3\0=\4\5\3=\3\a\0029\3\b\0009\3\t\0039\3\n\0035\4\f\0009\5\b\0009\5\v\5)\6üÿB\5\2\2=\5\r\0049\5\b\0009\5\v\5)\6\4\0B\5\2\2=\5\14\0049\5\b\0009\5\15\5B\5\1\2=\5\16\0049\5\b\0009\5\17\5B\5\1\2=\5\18\0049\5\b\0009\5\19\0055\6\20\0B\5\2\2=\5\21\4B\3\2\2=\3\b\0029\3\22\0009\3\23\0034\4\5\0005\5\24\0>\5\1\0045\5\25\0>\5\2\0045\5\26\0>\5\3\0045\5\27\0>\5\4\4B\3\2\2=\3\23\2B\1\2\0019\1\2\0009\1\28\0015\2\29\0005\3\30\0009\4\b\0009\4\t\0049\4\28\4B\4\1\2=\4\b\0034\4\3\0005\5\31\0>\5\1\4=\4\23\3B\1\3\0019\1\2\0009\1\28\1'\2 \0005\3!\0009\4\b\0009\4\t\0049\4\28\4B\4\1\2=\4\b\0039\4\22\0009\4\23\0044\5\3\0005\6\"\0>\6\1\0054\6\3\0005\a#\0>\a\1\6B\4\3\2=\4\23\0035\4$\0=\4%\3B\1\3\1K\0\1\0\rmatching\1\0\1'disallow_symbol_nonprefix_matching\1\1\0\1\tname\fcmdline\1\0\1\tname\tpath\1\0\0\6:\1\0\1\tname\vbuffer\1\0\0\1\3\0\0\6/\6?\fcmdline\1\0\1\tname\tpath\1\0\1\tname\fcodeium\1\0\1\tname\vbuffer\1\0\1\tname\rnvim_lsp\fsources\vconfig\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nabort\14<C-Space>\rcomplete\n<C-f>\n<C-b>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: codeium.vim
time([[Config for codeium.vim]], true)
try_loadstring("\27LJ\2\2-\0\0\1\0\3\0\0046\0\0\0009\0\1\0009\0\2\0D\0\1\0\19codeium#Accept\afn\bvim;\0\0\2\0\3\0\0056\0\0\0009\0\1\0009\0\2\0)\1\1\0D\0\2\0\29codeium#CycleCompletions\afn\bvim;\0\0\2\0\3\0\0056\0\0\0009\0\1\0009\0\2\0)\1ÿÿD\0\2\0\29codeium#CycleCompletions\afn\bvim,\0\0\1\0\3\0\0046\0\0\0009\0\1\0009\0\2\0D\0\1\0\18codeium#Clear\afn\bvim+\0\0\1\0\3\0\0046\0\0\0009\0\1\0009\0\2\0D\0\1\0\17codeium#Open\afn\bvim¶\2\1\0\5\0\20\0)6\0\0\0009\0\1\0009\0\2\0'\1\3\0'\2\4\0003\3\5\0005\4\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\1\3\0'\2\a\0003\3\b\0005\4\t\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\1\3\0'\2\n\0003\3\v\0005\4\f\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\1\3\0'\2\r\0003\3\14\0005\4\15\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\1\16\0'\2\17\0003\3\18\0005\4\19\0B\0\5\1K\0\1\0\1\0\2\texpr\2\vsilent\2\0\n<c-a>\6n\1\0\2\texpr\2\vsilent\2\0\n<c-x>\1\0\2\texpr\2\vsilent\2\0\n<c-,>\1\0\2\texpr\2\vsilent\2\0\n<c-;>\1\0\2\texpr\2\vsilent\2\0\n<C-g>\6i\bset\vkeymap\bvim\0", "config", "codeium.vim")
time([[Config for codeium.vim]], false)
-- Config for: gitlinker.nvim
time([[Config for gitlinker.nvim]], true)
try_loadstring("\27LJ\2\2Î\1\0\0\5\0\v\0\0166\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\0015\2\b\0006\3\0\0'\4\6\0B\3\2\0029\3\a\3=\3\t\2=\2\n\1B\0\2\1K\0\1\0\14callbacks\24gitlab.custobar.com\1\0\0\24get_gitlab_type_url\20gitlinker.hosts\topts\1\0\1\rmappings\15<leader>gy\1\0\1\14print_url\2\nsetup\14gitlinker\frequire\0", "config", "gitlinker.nvim")
time([[Config for gitlinker.nvim]], false)
-- Config for: nvim-ts-context-commentstring
time([[Config for nvim-ts-context-commentstring]], true)
try_loadstring("\27LJ\2\2]\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\1\19enable_autocmd\1\nsetup\29ts_context_commentstring\frequire\0", "config", "nvim-ts-context-commentstring")
time([[Config for nvim-ts-context-commentstring]], false)
-- Config for: lir.nvim
time([[Config for lir.nvim]], true)
try_loadstring("\27LJ\2\2G\0\0\2\1\4\0\b-\0\0\0009\0\0\0B\0\1\0016\0\1\0009\0\2\0'\1\3\0B\0\2\1K\0\1\0\1À\14normal! j\bcmd\bvim\16toggle_markü\1\0\0\6\0\f\0\0256\0\0\0009\0\1\0009\0\2\0)\1\0\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\6\0016\0\0\0009\0\1\0009\0\a\0004\1\3\0005\2\v\0006\3\0\0009\3\b\0039\3\t\3'\4\n\0B\3\2\2>\3\1\2>\2\1\1+\2\1\0004\3\0\0B\0\4\1K\0\1\0\1\3\0\0\0\vNormal\b%:p\vexpand\afn\14nvim_echo\1\0\2\vsilent\2\fnoremap\2=:<C-u>lua require\"lir.mark.actions\".toggle_mark(\"v\")<CR>\6J\6x\24nvim_buf_set_keymap\bapi\bvim‹\5\1\0\a\0005\0?6\0\0\0'\1\1\0B\0\2\0026\1\0\0'\2\2\0B\1\2\0026\2\0\0'\3\3\0B\2\2\0026\3\0\0'\4\4\0B\3\2\0029\3\5\0035\4\6\0005\5\a\0=\5\b\0045\5\t\0=\5\n\0045\5\f\0009\6\v\0=\6\r\0059\6\14\0=\6\15\0059\6\16\0=\6\17\0059\6\18\0=\6\19\0059\6\20\0=\6\21\0059\6\22\0=\6\23\0059\6\24\0=\6\25\0059\6\26\0=\6\27\0059\6\28\0=\6\29\0059\6\30\0=\6\31\0059\6 \0=\6!\0059\6\"\0=\6#\0059\6$\0=\6%\0053\6&\0=\6'\0059\6(\2=\6)\0059\6*\2=\6+\0059\6,\2=\6-\5=\5.\0045\5/\0005\0060\0=\0061\5=\0052\0043\0053\0=\0054\4B\3\2\0012\0\0€K\0\1\0\fon_init\0\nfloat\18curdir_window\1\0\2\22highlight_dirname\1\venable\1\1\0\1\rwinblend\3\0\rmappings\6P\npaste\6X\bcut\6C\tcopy\6J\0\6D\vdelete\6.\23toggle_show_hidden\6Y\14yank_path\6@\acd\6R\vrename\6N\fnewfile\6K\nmkdir\6q\tquit\6h\aup\n<C-t>\ftabedit\n<C-v>\vvsplit\n<C-s>\nsplit\t<CR>\1\0\0\tedit\rdevicons\1\0\1\venable\2\vignore\1\2\0\0\17node_modules\1\0\2\16hide_cursor\2\22show_hidden_files\1\nsetup\blir\26lir.clipboard.actions\21lir.mark.actions\16lir.actions\frequire\0", "config", "lir.nvim")
time([[Config for lir.nvim]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\2•\1\0\0\4\0\b\0\v6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\6\0005\2\4\0005\3\3\0=\3\5\2=\2\a\1B\0\2\1K\0\1\0\aui\1\0\0\nicons\1\0\0\1\0\3\20package_pending\6?\24package_uninstalled\6?\22package_installed\6V\nsetup\nmason\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: nvim-ts-autotag
time([[Config for nvim-ts-autotag]], true)
try_loadstring("\27LJ\2\2O\0\0\1\0\2\0\0035\0\0\0007\0\1\0K\0\1\0\topts\1\0\3\26enable_close_on_slash\1\18enable_rename\2\17enable_close\2\0", "config", "nvim-ts-autotag")
time([[Config for nvim-ts-autotag]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\2—\4\0\0\4\0\19\0\0236\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\0015\2\6\0=\2\a\0015\2\b\0=\2\t\0015\2\n\0=\2\v\0015\2\f\0005\3\r\0=\3\14\2=\2\15\0015\2\16\0005\3\17\0=\3\14\2=\2\18\1B\0\2\1K\0\1\0\17textsubjects\1\0\3\6.\23textsubjects-smart\ai;!textsubjects-container-inner\6;!textsubjects-container-outer\1\0\2\19prev_selection\6,\venable\2\26incremental_selection\fkeymaps\1\0\4\19init_selection\bgnn\22scope_incremental\bgrc\21node_incremental\bgrn\21node_decremental\bgrm\1\0\1\venable\2\fautotag\1\0\1\venable\1\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\n\0\0\bvue\15javascript\15typescript\blua\vpython\tscss\bcss\btsx\15git_rebase\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
