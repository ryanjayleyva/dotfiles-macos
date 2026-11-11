vim.lsp.inlay_hint.enable(true)
vim.lsp.codelens.enable(true)

vim.lsp.config('*', {
	capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

vim.lsp.enable({
	'astro',
	'bashls',
	'cssls',
	'dockerls',
	'emmet_language_server',
	'eslint',
	'gopls',
	'graphql',
	'html',
	'jsonls',
	'lua_ls',
	'marksman',
	'postgres_lsp',
	'pyright',
	'ruff',
	-- Skip rust-analyzer because rustaceanvim (plugins/rustaceanvim.lua) starts it
	-- from lsp/rust-analyzer.lua Enabling it here starts the client without those
	-- settings because rustaceanvim clears them from the shared config
	-- 'rust-analyzer',
	'svelte',
	'tailwindcss',
	'templ',
	'tombi',
	'vtsls',
	'yamlls',
})

vim.diagnostic.config({
	virtual_text = true,
	severity_sort = true,
	float = {
		source = true,
	},
	signs = {
		numhl = {
			[vim.diagnostic.severity.ERROR] = 'ErrorMsg',
			[vim.diagnostic.severity.WARN] = 'WarningMsg',
		},
	},
})
