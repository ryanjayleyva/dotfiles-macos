return {
	cmd = {
		'gopls',
	},

	filetypes = {
		'go',
		'gomod',
		'gowork',
		'gosum',
	},

	root_markers = {
		'go.work',
		'go.mod',
	},
	workspace_required = true,

	settings = {
		gopls = {
			staticcheck = true,
			semanticTokens = true,
			usePlaceholders = true,

			codelenses = {
				test = true,
			},

			hints = {
				assignVariableTypes = true,
				constantValues = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},

			analyses = {
				shadow = true,
			},
		},
	},
}
