-- Build fzf-native after updates because vim.pack has no build step
vim.api.nvim_create_autocmd('PackChanged', {
	callback = function(event)
		local is_fzf_native = event.data.spec.name == 'telescope-fzf-native.nvim'
		if is_fzf_native and event.data.kind ~= 'delete' then
			vim.system({ 'make' }, { cwd = event.data.path }):wait()
		end
	end,
})

vim.pack.add({
	{ src = 'https://github.com/nvim-telescope/telescope.nvim' },
	{ src = 'https://github.com/nvim-telescope/telescope-fzf-native.nvim' },
})

local builtin = require('telescope.builtin')
local telescope = require('telescope')

telescope.setup({
	defaults = {
		layout_strategy = 'vertical',
		layout_config = {
			width = 0.6,
			height = 0.9,
		},
	},
})

vim.api.nvim_create_autocmd('User', {
	pattern = 'TelescopePreviewerLoaded',
	callback = function(args)
		if args.data.filetype ~= 'help' then
			vim.wo.number = true
		end

		if args.data.bufname and args.data.bufname:match('%.csv$') then
			vim.wo.wrap = true
		end
	end,
})

-- Load fzf-native if built
pcall(telescope.load_extension, 'fzf')

-- Map telescope pickers
vim.keymap.set('n', '<leader>ff', function()
	builtin.find_files({
		hidden = true,
		file_ignore_patterns = { '%.git/' },
	})
end)

vim.keymap.set('n', '<leader>fg', builtin.live_grep)
vim.keymap.set('n', '<leader>fb', builtin.buffers)
vim.keymap.set('n', '<leader>fh', builtin.help_tags)
