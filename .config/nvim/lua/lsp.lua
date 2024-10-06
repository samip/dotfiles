local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	-- Enable completion triggered by <c-x><c-o>
	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
	--require'completion'.on_attach
	-- Mappings.
	local opts = { noremap = true, silent = true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap('n', '<space>k', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
	buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	buf_set_keymap('n', '<space>s', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
	buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
	buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
	buf_set_keymap('n', '<Up>', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
	buf_set_keymap('n', '<Down>', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
	--buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
	buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end



-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'tsserver', 'solargraph', 'bashls', 'pyright', 'lua_ls', 'clangd', 'tailwindcss' }
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup {
		on_attach = function(client)
			client.resolved_capabilities.document_formatting = false
		end,
		flags = {
			debounce_text_changes = 150,
		}
	}
end

local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		-- null_ls.builtins.formatting.stylua,
		-- null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.completion.spell,
		null_ls.builtins.formatting.prettier.with({
			filetypes = { "javascript", "typescript", "vue", "css", "scss", "html", "json", "yaml", "vls", "markdown" }
		}),
	},
})
on_attach = function(client)
	if client.resolved_capabilities.document_formatting then
		vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
	end
end

--     filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
--     on_attach = function(client)
--         client.resolved_capabilities.document_formatting = false
--     end,
-- }

nvim_lsp.vuels.setup {
	on_attach = function(client)
		--[[
		Internal Vetur formatting is not supported out of the box

		This line below is required if you:
				- want to format using Nvim's native `vim.lsp.buf.formatting**()`
				- want to use Vetur's formatting config instead, e.g, settings.vetur.format {...}
			--]]
		client.resolved_capabilities.document_formatting = true
		on_attach(client)
	end,
	capabilities = capabilities,
	settings = {
		vetur = {
			completion = {
				autoImport = true,
				useScaffoldSnippets = true
			},
			format = {
				defaultFormatter = {
					html = "none",
					js = "prettier",
					ts = "prettier",
				}
			},
			validation = {
				template = true,
				script = true,
				style = true,
				templateProps = true,
				interpolation = true
			},
			experimental = {
				templateInterpolationService = true
			}
		}
	},
	-- root_dir = util.root_pattern("header.php", "package.json", "style.css", 'webpack.config.js')
}
vim.lsp.handlers["textDocument/publishDiagnostics"] =
		vim.lsp.with(
			vim.lsp.diagnostic.on_publish_diagnostics,
			{
				underline = false
			}
		)


-- diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] =
		vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			-- Disable underline, it's very annoying
			underline = false,
			virtual_text = false,
			-- Enable virtual text, override spacing to 4
			-- virtual_text = {spacing = 4},
			-- Use a function to dynamically turn signs off
			-- and on, using buffer local variables
			signs = true,
			update_in_insert = false
		})
