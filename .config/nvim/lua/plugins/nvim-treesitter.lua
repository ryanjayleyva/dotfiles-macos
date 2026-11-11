vim.pack.add({
	{ src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
})

-- Install parsers in the background
require('nvim-treesitter').install({
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
})

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

-- Grow and shrink the selection with the built-in an and in
-- Use remap because an and in are mappings
vim.keymap.set('n', '<leader>ci', 'van', { remap = true })
vim.keymap.set('x', '<leader>ci', 'an', { remap = true })
vim.keymap.set('x', '<leader>cd', 'in', { remap = true })
