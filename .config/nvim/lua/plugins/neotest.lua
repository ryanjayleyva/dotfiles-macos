vim.pack.add({
	{ src = 'https://github.com/nvim-neotest/neotest' },
	{ src = 'https://github.com/marilari88/neotest-vitest' },
	{ src = 'https://github.com/fredrikaverpil/neotest-golang' },
})

local neotest = require('neotest')

neotest.setup({
	adapters = {
		require('neotest-vitest'),
		require('rustaceanvim.neotest'),
		require('neotest-golang')({
			dap_mode = 'manual',
			dap_manual_config = {
				name = 'Debug Go Tests',
				type = 'go',
				request = 'launch',
				mode = 'test',
			},
		}),
	},
	output = {
		open_on_run = 'always',
	},
})

-- Tests
vim.keymap.set(
	'n',
	'<leader>tt',
	neotest.summary.toggle,
	{ desc = 'Toggle test summary' }
)
vim.keymap.set(
	'n',
	'<leader>tr',
	neotest.run.run,
	{ desc = 'Run nearest test' }
)
vim.keymap.set('n', '<leader>ts', neotest.run.stop, { desc = 'Stop test run' })
vim.keymap.set(
	'n',
	'<leader>ta',
	neotest.run.attach,
	{ desc = 'Attach to test run' }
)
-- Enter the window because the navigator keys cannot reach a floating window
vim.keymap.set('n', '<leader>to', function()
	neotest.output.open({ enter = true })
end, { desc = 'Open test output' })

vim.keymap.set('n', '<leader>tf', function()
	neotest.run.run(vim.fn.expand('%'))
end, { desc = 'Run tests in file' })

vim.keymap.set('n', '<leader>td', function()
	neotest.run.run({ strategy = 'dap' })
end, { desc = 'Debug nearest test' })
