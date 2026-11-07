vim.pack.add({
	{ src = 'https://github.com/stevearc/conform.nvim' },
})

require('conform').setup({
	format_on_save = {
		lsp_format = 'fallback',
		timeout_ms = 5000,
	},

	-- Require a config so projects without one fall back to LSP formatting
	formatters = {
		prettier = {
			cwd = require('conform.util').root_file({
				'.prettierrc',
				'.prettierrc.json',
				'prettier.config.ts',
				'prettier.config.js',
			}),
			require_cwd = true,
		},
	},

	formatters_by_ft = {
		css = { 'prettier' },
		graphql = { 'prettier' },
		html = { 'prettier' },
		javascript = { 'prettier' },
		javascriptreact = { 'prettier' },
		json = { 'prettier' },
		json5 = { 'prettier' },
		jsonc = { 'prettier' },
		lua = { 'stylua' },
		markdown = { 'prettier' },
		python = { 'ruff_format' },
		rust = { 'rustfmt' },
		sh = { 'shfmt' },
		typescript = { 'prettier' },
		typescriptreact = { 'prettier' },
		yaml = { 'prettier' },
	},
})
