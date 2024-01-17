local lint = require("lint")
local golangci = lint.linters.golangcilint
golangci.args = { "--enable-all" }
lint.linters_by_ft = {
	go = { "golangcilint" },
	lua = { "luacheck" },
	python = { "pylint" },
	--html = { "htmlhint" },
}

-- Lints on enter buffer, write to buffer, leave insert
local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	--pattern = '*.go', -- Limit running linter to files with names that match the pattern
	group = lint_augroup,
	callback = function()
		lint.try_lint()
	end,
})

vim.keymap.set("n", "<leader>l", function()
	lint.try_lint()
end, { desc = "Trigger linting on current file via keypress" })
