return {
	cmd = {
		'rust-analyzer',
	},

	filetypes = {
		'rust',
	},

	root_markers = {
		'Cargo.toml',
		'.git',
	},
	workspace_required = true,

	settings = {
		['rust-analyzer'] = {
			cargo = {
				features = 'all',
			},

			diagnostics = {
				styleLints = {
					enable = true,
				},
			},

			check = {
				command = 'clippy',
			},
		},
	},
}
