-- Build jsregexp after updates because vim.pack has no build step
vim.api.nvim_create_autocmd('PackChanged', {
	callback = function(event)
		local is_luasnip = event.data.spec.name == 'LuaSnip'
		if is_luasnip and event.data.kind ~= 'delete' then
			local cmd = { 'make', 'install_jsregexp' }
			vim.system(cmd, { cwd = event.data.path }):wait()
		end
	end,
})

vim.pack.add({
	{ src = 'https://github.com/L3MON4D3/LuaSnip' },
	{ src = 'https://github.com/rafamadriz/friendly-snippets' },
})

require('luasnip').config.setup({
	keep_roots = true,
	link_roots = true,
	link_children = true,
	exit_roots = false,
	update_events = { 'TextChanged', 'TextChangedI' },
})

require('luasnip.loaders.from_vscode').lazy_load()
