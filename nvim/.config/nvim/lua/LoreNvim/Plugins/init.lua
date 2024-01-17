return {
	{ -- LSP
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
	},
	{ -- Autocompletion & Snippets
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			-- lua snip
			{ "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
			"saadparwaiz1/cmp_luasnip",
		},
	},
	{ -- Telescope
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" }, -- Treesitter
	"EdenEast/nightfox.nvim", -- Nightfox colorschemes
	"ThePrimeagen/vim-be-good",
	"stevearc/conform.nvim", -- Conform formatter
	"mfussenegger/nvim-lint", -- Nvim linter
	{
		"folke/which-key.nvim",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300 -- time before keymaps popup
		end,
	}, -- Which Key
}
