vim.pack.add({
	{ src = 'https://github.com/tpope/vim-dadbod' },
	{ src = 'https://github.com/kristijanhusak/vim-dadbod-completion' },
	{ src = 'https://github.com/kristijanhusak/vim-dadbod-ui' },
})

require('cmp').setup.filetype({ 'sql', 'mysql', 'plsql' }, {
	sources = {
		{ name = 'vim-dadbod-completion' },
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'path' },
		{ name = 'buffer' },
	},
})

vim.g.db_ui_use_nerd_fonts = 1

-- Database
vim.keymap.set(
	'n',
	'<leader>Db',
	'<cmd>DBUI<cr>',
	{ desc = 'Toggle database UI' }
)

-- Rebind because the default <leader>R shadows the kulala prefix in results
vim.keymap.set(
	'n',
	'<leader>Dl',
	'<Plug>(DBUI_ToggleResultLayout)',
	{ remap = true, desc = 'Toggle query result layout' }
)
