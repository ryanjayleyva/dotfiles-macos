return {
	cmd = {
		'marksman',
		'server',
	},

	filetypes = {
		'markdown',
	},

	root_markers = {
		'.marksman.toml',
		'.git',
	},

	-- Handle the lens command because Neovim has no built-in handler for it
	commands = {
		['marksman.findReferences'] = function()
			vim.lsp.buf.references()
		end,
	},
}
