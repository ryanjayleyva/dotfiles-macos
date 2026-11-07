-- Exit insert mode on jk
vim.keymap.set('i', 'jk', '<ESC>')

-- Increment and decrement numbers
vim.keymap.set('n', '<leader>+', '<C-a>')
vim.keymap.set('n', '<leader>-', '<C-x>')

-- Clear search highlights
vim.keymap.set('n', '<leader>cs', vim.cmd.nohlsearch)

-- Save and source the file
vim.keymap.set('n', '<leader>us', '<cmd>update | source<CR>')

-- Send diagnostics to quickfix list
vim.keymap.set('n', '<leader>xq', vim.diagnostic.setqflist)

-- Send diagnostics to location list
vim.keymap.set('n', '<leader>xl', vim.diagnostic.setloclist)

-- Toggle diagnostic virtual text
vim.keymap.set('n', '<leader>xt', function()
	local current_status = vim.diagnostic.config().virtual_text
	vim.diagnostic.config({ virtual_text = not current_status })
end)
