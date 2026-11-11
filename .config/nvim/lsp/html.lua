return {
	cmd = {
		'vscode-html-language-server',
		'--stdio',
	},

	filetypes = {
		'html',
	},

	root_markers = {
		'package.json',
		'.git',
	},

	-- Opt in because the server offers no formatter by default
	init_options = { provideFormatter = true },
}
