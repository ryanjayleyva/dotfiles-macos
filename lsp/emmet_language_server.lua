return {
	cmd = {
		'emmet-language-server',
		'--stdio',
	},

	filetypes = {
		'css',
		'html',
		'javascript',
		'javascriptreact',
		'templ',
		'typescript',
		'typescriptreact',
	},

	root_markers = {
		'package.json',
		'.git',
	},

	init_options = {
		includeLanguages = {
			javascript = 'javascriptreact',
			templ = 'html',
			typescript = 'typescriptreact',
		},
		showAbbreviationSuggestions = true,
		syntaxProfiles = {
			html = {
				selfClosingStyle = 'xhtml',
			},
		},
	},
}
