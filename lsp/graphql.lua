return {
	cmd = {
		'graphql-lsp',
		'server',
		'-m',
		'stream',
	},

	filetypes = {
		'graphql',
		'javascriptreact',
		'typescriptreact',
	},

	-- Nest the markers because the closest config wins whatever its name
	root_markers = {
		{
			'graphql.config.ts',
			'graphql.config.cts',
			'graphql.config.mts',
			'graphql.config.js',
			'graphql.config.cjs',
			'graphql.config.mjs',
			'graphql.config.json',
			'graphql.config.yaml',
			'graphql.config.yml',
			'graphql.config.toml',
			'.graphqlrc',
			'.graphqlrc.ts',
			'.graphqlrc.cts',
			'.graphqlrc.mts',
			'.graphqlrc.js',
			'.graphqlrc.cjs',
			'.graphqlrc.mjs',
			'.graphqlrc.json',
			'.graphqlrc.yaml',
			'.graphqlrc.yml',
			'.graphqlrc.toml',
		},
	},
	workspace_required = true,
}
