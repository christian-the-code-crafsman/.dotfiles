local format_opts = {
	lsp_fallback = true,
	async = false,
	timeout_ms = 500,
}

local conform = require("conform")
conform.setup({
	formatters_by_ft = {
		go = { "goimports" }, -- goimports is gofmt that also checks for unused imports
		lua = { "stylua" },
		python = { "pyink" },
		html = { "prettier" },
		css = { "prettier" },
		js = { "prettier" },
	},
	format_on_save = format_opts,
})

-- Create formatting keymap
vim.keymap.set({ "n", "v" }, "<leader>mp", function()
	conform.format(format_opts)
end, { desc = "format file or range (if in visual mode)" })
