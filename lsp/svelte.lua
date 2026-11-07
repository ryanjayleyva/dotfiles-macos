return {
	cmd = {
		'svelteserver',
		'--stdio',
	},

	filetypes = {
		'svelte',
	},

	-- Prefer the lockfile because a monorepo keeps one at its root
	root_markers = {
		{
			'package-lock.json',
			'yarn.lock',
			'pnpm-lock.yaml',
			'bun.lockb',
			'bun.lock',
			'deno.lock',
		},
		'.git',
	},

	on_attach = function(client, bufnr)
		vim.api.nvim_buf_create_user_command(
			bufnr,
			'LspMigrateToSvelte5',
			function()
				client:exec_cmd({
					title = 'Migrate Component to Svelte 5 Syntax',
					command = 'migrate_to_svelte_5',
					arguments = { vim.uri_from_bufnr(bufnr) },
				})
			end,
			{ desc = 'Migrate Component to Svelte 5 Syntax' }
		)
	end,
}
