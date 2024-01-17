require('nvim-treesitter.configs').setup({
    ensure_installed = {'c', 'rust', 'go', 'javascript', 'html', 'css', 'vim', 'vimdoc', 'query'},
    sync_install = false,
    highlight = { enable = true },
    additional_vim_regex_highlight = false,
})
