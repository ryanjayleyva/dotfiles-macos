-- Insert mode
vim.keymap.set('i', 'jk', '<Esc>', { desc = 'Exit insert mode' })

-- Numbers
vim.keymap.set('n', '<leader>+', '<C-a>', { desc = 'Increment number' })
vim.keymap.set('n', '<leader>-', '<C-x>', { desc = 'Decrement number' })

-- Search
vim.keymap.set(
	'n',
	'<leader>cs',
	'<Cmd>nohlsearch<CR>',
	{ desc = 'Clear search highlights' }
)

-- File
vim.keymap.set(
	'n',
	'<leader>us',
	'<Cmd>update | source<CR>',
	{ desc = 'Save and source file' }
)

-- Diagnostics
vim.keymap.set(
	'n',
	'<leader>xq',
	vim.diagnostic.setqflist,
	{ desc = 'Diagnostics to quickfix list' }
)
vim.keymap.set(
	'n',
	'<leader>xl',
	vim.diagnostic.setloclist,
	{ desc = 'Diagnostics to location list' }
)
vim.keymap.set('n', '<leader>xt', function()
	vim.diagnostic.config({
		virtual_text = not vim.diagnostic.config().virtual_text,
	})
end, { desc = 'Toggle diagnostic virtual text' })
