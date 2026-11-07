return {
	cmd = {
		'bash-language-server',
		'start',
	},

	filetypes = {
		'sh',
	},

	root_markers = {
		'.git',
	},

	settings = {
		bashIde = {
			-- Skip recursion because a script in the home folder would scan everything
			globPattern = '*@(.sh|.inc|.bash|.command)',
		},
	},
}
