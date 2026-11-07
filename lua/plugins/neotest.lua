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

vim.keymap.set('n', '<leader>tt', neotest.summary.toggle)
vim.keymap.set('n', '<leader>tr', neotest.run.run)
vim.keymap.set('n', '<leader>ts', neotest.run.stop)
vim.keymap.set('n', '<leader>ta', neotest.run.attach)
vim.keymap.set('n', '<leader>to', neotest.output.open)

vim.keymap.set('n', '<leader>tf', function()
	neotest.run.run(vim.fn.expand('%'))
end)

vim.keymap.set('n', '<leader>td', function()
	neotest.run.run({ strategy = 'dap' })
end)
