return {
	cmd = {
		'vscode-eslint-language-server',
		'--stdio',
	},

	filetypes = {
		'javascript',
		'javascriptreact',
		'svelte',
		'typescript',
		'typescriptreact',
	},

	root_markers = {
		'eslint.config.js',
		'eslint.config.cjs',
		'eslint.config.mjs',
		'eslint.config.ts',
		'eslint.config.mts',
		'eslint.config.cts',
	},
	workspace_required = true,

	-- Set every key because the server has no defaults
	settings = {
		validate = 'on',
		experimental = {},
		run = 'onType',
		rulesCustomizations = {},
		problems = { shortenToSingleLine = false },
		codeActionOnSave = { enable = false, mode = 'all' },
		codeAction = {
			disableRuleComment = { enable = true, location = 'separateLine' },
			showDocumentation = { enable = true },
		},
		nodePath = '',
		workingDirectory = { mode = 'auto' },
	},

	-- Set workspaceFolder so the server resolves paths
	before_init = function(_, config)
		local root = config.root_dir
		if root then
			config.settings = vim.tbl_deep_extend('force', config.settings or {}, {
				workspaceFolder = {
					uri = vim.uri_from_fname(root),
					name = vim.fn.fnamemodify(root, ':t'),
				},
			})
		end
	end,
}
