local wk = require("which-key")
wk.register({
	["<leader>"] = {
		f = { name = "+find" },
		l = { name = "+lsp", g = { name = "goto" } },
		d = { name = "+diagnostic" },
		c = { name = "+color" },
		m = { name = "+format" },
	},
})
