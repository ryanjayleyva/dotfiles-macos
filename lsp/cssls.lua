return {
	cmd = {
		'vscode-css-language-server',
		'--stdio',
	},

	filetypes = {
		'css',
	},

	root_markers = {
		'package.json',
		'.git',
	},

	-- Opt in because the server offers no formatter by default
	init_options = { provideFormatter = true },

	settings = {
		css = {
			-- Enable because the server treats a missing value as off
			validate = true,
			-- Ignore because Tailwind adds at-rules such as @apply and @theme
			lint = { unknownAtRules = 'ignore' },
		},
	},
}
