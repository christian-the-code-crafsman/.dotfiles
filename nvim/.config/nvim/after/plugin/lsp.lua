-- Setup cmp, for autocompletion
local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	window = {
		--completion = cmp.config.window.bordered(),
		--documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		--{name = 'buffer'},
		{ name = "luasnip" },
	}),
})

-- Setup Mason and Neovim lsp
require("mason").setup() --Mason must be setup before mason-lspconfig

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason-lspconfig").setup({
	ensure_installed = {
		"gopls",
		"rust_analyzer",
		"html",
		"cssls",
	},
	handlers = {
		function(server_name) -- Default handler
			lspconfig[server_name].setup({
				capabilities = capabilities,
			}) -- Passes in {} because it errors otherwise
		end,
		--		['rust_analyzer'] = function() --Rust Analyzer handler
		--			lspconfig.rust_analyzer.setup()
		--		end
	},
})
-- Remember: Don't setup with lsp with lspconfig outside of the mason-lspconfig handler

-- Global Mappings
-- Debugging Remaps
vim.keymap.set("n", "<leader>do", vim.diagnostic.open_float, { desc = "open diagnostic" })
vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, { desc = "next error" })
vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, { desc = "prev error" })
--vim.keymap.set("n", "<leader>dq", vim.diagnostic.setloclist, { desc = "" })

-- Uses LspAttach autocommand to only map these keymap when lsp attachs
vim.api.nvim_create_autocmd("LspAttach", {
	--group = vim.api.nvim_create_augroup("UserLspConfig", {
	callback = function(ev)
		-- Buffer local mapping
		vim.keymap.set("n", "<leader>lgD", vim.lsp.buf.declaration, { buffer = ev.buf, desc = "goto declaration" })
		vim.keymap.set("n", "<leader>lgd", vim.lsp.buf.definition, { buffer = ev.buf, desc = "goto definition" })
		vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, { buffer = ev.buf, desc = "hover" })

		vim.keymap.set("n", "<leader>li", vim.lsp.buf.implementation, { buffer = ev.buf, desc = "implementation" })
		vim.keymap.set("n", "<leader>lt", vim.lsp.buf.type_definition, { buffer = ev.buf, desc = "type definition" })
		vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, { buffer = ev.buf, desc = "reference" })
		vim.keymap.set("n", "<leader>ls", vim.lsp.buf.signature_help, { buffer = ev.buf, desc = "signature help" })

		vim.keymap.set("n", "<leader>lrr", vim.lsp.buf.rename, { buffer = ev.buf, desc = "rename" })

		vim.keymap.set("n", "<leader>ll", vim.lsp.buf.code_action, { buffer = ev.buf, desc = "code action" })
	end,
	--}),
})
