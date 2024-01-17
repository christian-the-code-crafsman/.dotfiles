-- Setup cmp, for autocompletion
local cmp = require('cmp')
cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered()
	},
	mapping = cmp.mapping.preset.insert({
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
	}),
	sources = cmp.config.sources({
		{name = 'nvim_lsp'},
		--{name = 'buffer'},
		{name = 'luasnip'},
	})
})

-- Setup Mason and Neovim lsp
require('mason').setup() --Mason must be setup before mason-lspconfig

local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('mason-lspconfig').setup({
	ensure_installed = {
		'gopls',
		'rust_analyzer',
		'html',
		'cssls'
	},
	handlers = {
		function(server_name) -- Default handler
			lspconfig[server_name].setup({
				capabilities = capabilities
			}) -- Passes in {} because it errors otherwise
		end,
--		['rust_analyzer'] = function() --Rust Analyzer handler
--			lspconfig.rust_analyzer.setup()
--		end
	}
})
-- Remember: Don't setup with lsp with lspconfig outside of the mason-lspconfig handler

-- Global Mappings
-- Debugging Remaps
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- Uses LspAttach autocommand to only map these keymap when lsp attachs
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		-- Buffer local mapping
		local opts = {buffer = ev.buf}
		vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
	end
})
