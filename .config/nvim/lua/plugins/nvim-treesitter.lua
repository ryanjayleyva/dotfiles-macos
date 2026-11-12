vim.pack.add({
	{ src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
})

local parsers = {
	'astro',
	'bash',
	'css',
	'dockerfile',
	'go',
	'gomod',
	'gosum',
	'gowork',
	'graphql',
	'html',
	'javascript',
	'jsdoc',
	'json',
	'json5',
	'lua',
	'luadoc',
	'python',
	'regex',
	'rust',
	'sql',
	'svelte',
	'templ',
	'toml',
	'tsx',
	'typescript',
	'yaml',
}

vim.api.nvim_create_autocmd('FileType', {
	pattern = {
		'astro',
		'css',
		'dockerfile',
		'go',
		'gomod',
		'gosum',
		'gowork',
		'graphql',
		'html',
		'javascript',
		'javascriptreact',
		'json',
		'json5',
		'jsonc',
		'lua',
		'python',
		'rust',
		'sh',
		'sql',
		'svelte',
		'templ',
		'toml',
		'typescript',
		'typescriptreact',
		'yaml',
	},
	callback = function(event)
		-- Ignore errors because the parser may still be installing
		pcall(vim.treesitter.start, event.buf)
	end,
})

-- Start highlighting in buffers opened before their parser finished installing
local function start_highlighting_in_open_buffers()
	-- Refresh the runtimepath because Neovim caches the missing parser directory
	vim.o.runtimepath = vim.o.runtimepath
	for _, buffer in ipairs(vim.api.nvim_list_bufs()) do
		pcall(vim.treesitter.start, buffer)
	end
end

-- Install parsers in the background
local function install_parsers()
	local install_task = require('nvim-treesitter').install(parsers)
	install_task:await(vim.schedule_wrap(start_highlighting_in_open_buffers))
end

-- Install parsers once Mason installs the CLI
local function install_parsers_when_cli_ready(mason_package)
	if mason_package.name == 'tree-sitter-cli' then
		-- Schedule because Mason emits the event in a fast context
		vim.schedule(install_parsers)
	end
end

-- Wait for Mason (plugins/mason.lua) to install the CLI because parsers compile with it
if vim.fn.executable('tree-sitter') == 1 then
	install_parsers()
else
	local mason_registry = require('mason-registry')
	mason_registry:on('package:install:success', install_parsers_when_cli_ready)
end

-- Grow and shrink the selection with the built-in an and in
-- Use remap because an and in are mappings
vim.keymap.set('n', '<leader>ci', 'van', { remap = true })
vim.keymap.set('x', '<leader>ci', 'an', { remap = true })
vim.keymap.set('x', '<leader>cd', 'in', { remap = true })
