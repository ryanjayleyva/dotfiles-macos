vim.pack.add({
	{ src = 'https://github.com/mason-org/mason.nvim' },
	{ src = 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim' },
})

-- Map each lsp/*.lua name to its Mason package
-- Keep in sync with the enabled servers in core/lsp.lua
local servers = {
	astro = 'astro-language-server',
	bashls = 'bash-language-server',
	cssls = 'css-lsp',
	dockerls = 'dockerfile-language-server',
	emmet_language_server = 'emmet-language-server',
	eslint = 'eslint-lsp',
	gopls = 'gopls',
	graphql = 'graphql-language-service-cli',
	html = 'html-lsp',
	jsonls = 'json-lsp',
	lua_ls = 'lua-language-server',
	marksman = 'marksman',
	postgres_lsp = 'postgres-language-server',
	pyright = 'pyright',
	ruff = 'ruff',
	-- Skip enabling in core/lsp.lua because rustaceanvim starts it with these settings
	['rust-analyzer'] = 'rust-analyzer',
	svelte = 'svelte-language-server',
	tailwindcss = 'tailwindcss-language-server',
	templ = 'templ',
	tombi = 'tombi',
	vtsls = 'vtsls',
	yamlls = 'yaml-language-server',
}

-- Install non-LSP tools too
local tools = {
	'codelldb',
	'delve',
	'js-debug-adapter',
	'prettier',
	'shfmt',
	'stylua',
	'tree-sitter-cli',
}

local ensure_installed = vim.list_extend(vim.tbl_values(servers), tools)

require('mason').setup()

require('mason-tool-installer').setup({
	ensure_installed = ensure_installed,
	run_on_start = true,
})
