-- Fall back to the package copy because Mason installs TypeScript with astro-ls
local bundled_tsdk = vim.fn.stdpath('data')
	.. '/mason/packages/astro-language-server/node_modules/typescript/lib'

-- Check tsserverlibrary.js because TypeScript 7 dropped it and the server loads it
local function workspace_tsdk(root)
	local dir = root
	while dir ~= vim.fs.dirname(dir) do
		local tsdk = dir .. '/node_modules/typescript/lib'
		if vim.uv.fs_stat(tsdk .. '/tsserverlibrary.js') then
			return tsdk
		end
		dir = vim.fs.dirname(dir)
	end
end

return {
	cmd = {
		'astro-ls',
		'--stdio',
	},

	filetypes = {
		'astro',
	},

	root_markers = {
		'package.json',
		'tsconfig.json',
		'jsconfig.json',
		'.git',
	},

	-- Set tsdk because the server refuses to start without it
	before_init = function(params, config)
		local tsdk = config.root_dir and workspace_tsdk(config.root_dir)
		params.initializationOptions = {
			typescript = { tsdk = tsdk or bundled_tsdk },
		}
	end,
}
