vim.pack.add({
	{ src = 'https://github.com/mfussenegger/nvim-dap' },
	{ src = 'https://github.com/rcarriga/nvim-dap-ui' },
})

local dap = require('dap')

dap.adapters['pwa-node'] = {
	type = 'server',
	-- Match js-debug's listen address because the default 127.0.0.1 is refused
	host = 'localhost',
	port = '${port}',
	executable = {
		command = 'js-debug-adapter',
		args = { '${port}' },
	},
}

dap.adapters.go = {
	type = 'server',
	port = '${port}',
	executable = {
		command = 'dlv',
		args = { 'dap', '-l', '127.0.0.1:${port}' },
	},
}

dap.configurations.go = {
	{
		type = 'go',
		request = 'launch',
		name = 'Debug Package',
		mode = 'debug',
		program = '${fileDirname}',
	},

	{
		type = 'go',
		request = 'launch',
		name = 'Debug Package Tests',
		mode = 'test',
		program = '${fileDirname}',
	},
}

-- Skip both because setting skipFiles replaces js-debug's default that hides node internals
local skip_files = { '<node_internals>/**', '**/node_modules/**' }

local js_configs = {
	{
		type = 'pwa-node',
		request = 'launch',
		name = 'Debug Current File (Node)',
		program = '${file}',
		-- Set cwd because nvim-dap does not apply js-debug's default
		cwd = '${workspaceFolder}',
		console = 'integratedTerminal',
		skipFiles = skip_files,
	},

	{
		type = 'pwa-node',
		request = 'launch',
		name = 'Debug Vitest Tests',
		program = '${workspaceFolder}/node_modules/vitest/vitest.mjs',
		-- Pass the relative file because Vitest's filter ignores a symlinked path
		args = { 'run', '${relativeFile}' },
		cwd = '${workspaceFolder}',
		console = 'integratedTerminal',
		skipFiles = skip_files,
	},

	{
		type = 'pwa-node',
		request = 'attach',
		name = 'Attach to Node Process',
		-- Pick a process whose inspector listens on 9229 because js-debug does not enable it
		processId = require('dap.utils').pick_process,
		cwd = '${workspaceFolder}',
		skipFiles = skip_files,
	},
}

for _, filetype in ipairs({
	'javascript',
	'javascriptreact',
	'typescript',
	'typescriptreact',
}) do
	dap.configurations[filetype] = js_configs
end

require('dapui').setup()

-- Debugging
vim.keymap.set(
	'n',
	'<leader>db',
	dap.toggle_breakpoint,
	{ desc = 'Toggle breakpoint' }
)
vim.keymap.set('n', '<leader>dc', dap.continue, { desc = 'Continue debugging' })
vim.keymap.set('n', '<leader>di', dap.step_into, { desc = 'Step into' })
vim.keymap.set('n', '<leader>do', dap.step_over, { desc = 'Step over' })
vim.keymap.set('n', '<leader>dO', dap.step_out, { desc = 'Step out' })
vim.keymap.set(
	'n',
	'<leader>dt',
	dap.terminate,
	{ desc = 'Terminate debug session' }
)
vim.keymap.set('n', '<leader>dr', dap.repl.open, { desc = 'Open debug REPL' })
vim.keymap.set(
	'n',
	'<leader>du',
	require('dapui').toggle,
	{ desc = 'Toggle debug UI' }
)
