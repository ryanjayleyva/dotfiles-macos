-- Build fzf-native after updates because vim.pack has no build step
vim.api.nvim_create_autocmd('PackChanged', {
	callback = function(event)
		local plugin_name = event.data.spec.name
		local was_deleted = event.data.kind == 'delete'

		if plugin_name == 'telescope-fzf-native.nvim' and not was_deleted then
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

-- Show line numbers in previews except help, and wrap long CSV lines
vim.api.nvim_create_autocmd('User', {
	pattern = 'TelescopePreviewerLoaded',
	callback = function(event)
		local filetype = event.data.filetype
		local file_name = event.data.bufname

		if filetype ~= 'help' then
			vim.wo.number = true
		end

		if file_name and file_name:match('%.csv$') then
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
end, { desc = 'Find files' })

vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find buffers' })
vim.keymap.set(
	'n',
	'<leader>fh',
	builtin.help_tags,
	{ desc = 'Find help tags' }
)
