return {
	cmd = {
		'pyright-langserver',
		'--stdio',
	},

	filetypes = {
		'python',
	},

	root_markers = {
		'pyrightconfig.json',
		'pyproject.toml',
		'setup.py',
		'setup.cfg',
		'requirements.txt',
		'Pipfile',
		'.git',
	},

	settings = {
		pyright = {
			-- Hide tagged hints because Neovim shows them as noisy diagnostics
			disableTaggedHints = true,
			-- Leave imports to ruff because both would offer the action
			disableOrganizeImports = true,
		},

		python = {
			analysis = {
				diagnosticMode = 'workspace',
				typeCheckingMode = 'strict',

				-- Downgrade these because strict reports them as errors
				diagnosticSeverityOverrides = {
					reportMissingTypeStubs = 'warning',
					reportUnknownMemberType = 'warning',
					reportUntypedFunctionDecorator = 'warning',
					reportUntypedNamedTuple = 'warning',

					-- Silence these because ruff reports the same problems
					reportUndefinedVariable = 'none',
					reportUnusedImport = 'none',
					reportUnusedVariable = 'none',
				},
			},
		},
	},
}
