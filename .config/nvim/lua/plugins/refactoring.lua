vim.pack.add({
	-- Drop on Neovim 0.13 because it ships vim.async
	{ src = 'https://github.com/lewis6991/async.nvim' },
	{ src = 'https://github.com/ThePrimeagen/refactoring.nvim' },
})

vim.keymap.set({ 'n', 'x' }, '<leader>rs', function()
	require('refactoring').select_refactor()
end, { desc = 'Select refactor' })
