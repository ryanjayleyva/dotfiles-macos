return {
	cmd = {
		'lua-language-server',
	},

	filetypes = { 'lua' },

	root_markers = {
		'.git',
		'.stylua.toml',
	},

	settings = {
		Lua = {
			format = {
				enable = false,
			},

			completion = {
				autoRequire = false,
				callSnippet = 'Replace',
				displayContext = 12,
			},

			hint = {
				arrayIndex = 'Enable',
				enable = true,
				setType = true,
			},

			runtime = {
				version = 'LuaJIT',
				-- Resolve modules like Neovim because the default also matches mason's dap.lua
				path = { 'lua/?.lua', 'lua/?/init.lua' },
			},

			semantic = {
				keyword = true,
			},

			type = {
				castNumberToInteger = false,
				inferParamType = true,
				weakNilCheck = true,
				weakUnionCheck = true,
			},

			workspace = {
				checkThirdParty = false,
				library = vim.list_extend(vim.api.nvim_get_runtime_file('', true), {
					'${3rd}/busted/library',
				}),
			},
		},
	},
}
