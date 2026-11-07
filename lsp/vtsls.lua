return {
	cmd = {
		'vtsls',
		'--stdio',
	},

	filetypes = {
		'javascript',
		'javascriptreact',
		'typescript',
		'typescriptreact',
	},

	root_markers = {
		'tsconfig.json',
		'tsconfig.app.json',
		'tsconfig.node.json',
		'jsconfig.json',
		'package.json',
		'.git',
	},

	settings = {
		typescript = {
			inlayHints = {
				parameterNames = { enabled = 'all' },
				parameterTypes = { enabled = true },
				variableTypes = { enabled = true },
				propertyDeclarationTypes = { enabled = true },
				functionLikeReturnTypes = { enabled = true },
				enumMemberValues = { enabled = true },
			},
		},

		javascript = {
			inlayHints = {
				parameterNames = { enabled = 'all' },
				parameterTypes = { enabled = true },
				variableTypes = { enabled = true },
				propertyDeclarationTypes = { enabled = true },
				functionLikeReturnTypes = { enabled = true },
			},
		},

		vtsls = {
			autoUseWorkspaceTsdk = true,
			experimental = {
				completion = {
					enableServerSideFuzzyMatch = true,
				},
			},
		},
	},
}
